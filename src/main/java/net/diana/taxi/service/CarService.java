package net.diana.taxi.service;

import net.diana.taxi.repository.CarRepository;
import net.diana.taxi.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CarService
{
    @Autowired
    private CarRepository carRepository;

    public Car getCarById(int carId)
    {
        Optional<Car> carOptional = carRepository.findById(carId);

        Car car = carOptional.get();

        return car;
    }
}
