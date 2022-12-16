package net.diana.taxi.repository;

import net.diana.taxi.model.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityRepository extends JpaRepository<City, Integer>
{
    List<City> findCityByName(@Param("name") String name);
}