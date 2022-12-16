package net.diana.taxi.repository;

import net.diana.taxi.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Integer>
{

}
