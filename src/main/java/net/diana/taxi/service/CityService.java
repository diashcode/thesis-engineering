package net.diana.taxi.service;

import net.diana.taxi.model.City;
import net.diana.taxi.repository.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityService
{
    @Autowired
    private CityRepository cityRepository;

    public List<City> getCityByName(String name)
    {
        List<City> cityList = cityRepository.findCityByName(name);

        return cityList;
    }

    public List<City> getAllCities()
    {
        List<City> allCityList = cityRepository.findAll();

        return allCityList;
    }
}
