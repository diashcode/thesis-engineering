package net.diana.taxi.repository;

import java.util.Optional;
import net.diana.taxi.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository <User, Integer>
{
	Optional <User> findByUsername(String username);
}