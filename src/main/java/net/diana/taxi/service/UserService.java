package net.diana.taxi.service;

import net.diana.taxi.repository.CarRepository;
import net.diana.taxi.repository.UserRepository;
import net.diana.taxi.model.Car;
import net.diana.taxi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService
{
	@Autowired
	private CarRepository carRepository;

	@Autowired
	private UserRepository userRepository;

	public User getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		Optional<User> userOptional = userRepository.findByUsername(authentication.getName());

		User user = userOptional.get();

		return user;
	}

	public User getUserById(int userId)
	{
		Optional<User> userOptional = userRepository.findById(userId);

		User user = userOptional.get();

		return user;
	}

	public void updateUser(User user)
	{
		userRepository.save(user);
	}
	/*void registerNewUser(User newUser);
	
	User getUserById(int userId);

	User getCurrentUser();*/

	public Boolean saveNewCar(String name, String model, int year)
	{
		Car newCar = new Car();
		newCar.setName(name);
		newCar.setModel(model);
		newCar.setYear(year);

		Car addedCar = carRepository.save(newCar);

		User currentUser = getCurrentUser();
		currentUser.setCarId(addedCar.getCarId());
		updateUser(currentUser);

		return true;
	}
}