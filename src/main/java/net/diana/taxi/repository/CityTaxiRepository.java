package net.diana.taxi.repository;

import net.diana.taxi.model.CityTaxi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityTaxiRepository extends JpaRepository<CityTaxi, Integer>
{
    List<CityTaxi> findTaxiByCity(@Param("city") String city);
}
