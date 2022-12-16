package net.diana.taxi.controller.rest;

import net.diana.taxi.service.TravelService;
import net.diana.taxi.model.Travel;
import net.diana.taxi.repository.TravelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/rest")
public class TravelRestController
{
    @Autowired
    private TravelService travelService;

    @Autowired
    private TravelRepository travelRepository;

   /* @RequestMapping(value = "/getAllTravels", method = RequestMethod.GET)
    public List<Travel> getAllTravel()
    {
        List<Travel> travelList = travelService.getAllTravelsByPickupAndDestination("Osh", "Bishkek");
        return travelList;
    }*/

    @RequestMapping(value = "/getAllTravels", method = RequestMethod.GET)
    public List<Travel> getAllTravels()
    {
        return travelRepository.findAll();
    }
}