package net.diana.taxi.service;

import java.util.Optional;

import net.diana.taxi.model.CustomUserDetails;
import net.diana.taxi.repository.UserRepository;
import net.diana.taxi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService
{
	@Autowired
	private UserRepository usersRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
	{
		Optional <User> optionalUsers = usersRepository.findByUsername(username);
		
		optionalUsers
				.orElseThrow(() -> new UsernameNotFoundException("Username not found"));
		return optionalUsers
                .map(CustomUserDetails::new).get();
	}
	
	public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        Optional<User> userOptional = usersRepository.findByUsername(authentication.getName());

        User user = userOptional.get();

        return user;
    }
	
	public void registerNewUser(User newUser)
    {
    	usersRepository.save(newUser);
    }
}
