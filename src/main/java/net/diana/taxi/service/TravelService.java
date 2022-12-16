package net.diana.taxi.service;

import net.diana.taxi.model.*;
import net.diana.taxi.repository.CityTaxiRepository;
import net.diana.taxi.repository.TravelBookRepository;
import net.diana.taxi.tools.CalculateDistance;
import net.diana.taxi.util.Notification;
import net.diana.taxi.model.*;
import net.diana.taxi.repository.TravelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.Date;
import java.util.*;

@Service
public class TravelService {
    @Autowired
    private TravelRepository travelRepository;

    @Autowired
    private TravelBookRepository travelBookRepository;

    @Autowired
    private CityService cityService;

    @Autowired
    private CityTaxiRepository cityTaxiRepository;

    public List<Travel> getTravelListByUserId(int userId)
    {
        List<Travel> travel = travelRepository.findTravelByUserId(userId);
        return travel;
    }

    public List<TravelBook> getTravelBookListByUserId(int userId)
    {
        List<TravelBook> travelBooks = travelBookRepository.findTravelBookListByUserId(userId);
        return travelBooks;
    }

    public List<TravelBook> getTravelBookByTravelId(int travelId)
    {
        List<TravelBook> travelBook = travelBookRepository.findTravelBookByTravelId(travelId);
        return travelBook;
    }

    public List<CityTaxi> getTaxiByCity(String city)
    {
        List<CityTaxi> cityTaxiList = cityTaxiRepository.findTaxiByCity(city);
        return cityTaxiList;
    }

    public List<Map> getTravellerBookList(List<Travel> travelList)
    {
        //travvelerBookList - massiv of Map, kotoryi budet zapolnen userami, zabronirovavshie opredelennuyu poezdku
        // voditelya,  t.e odin List i vnutri Map hranyatsya vse usery s dannymi po otdelnosti
        List<Map> travellerBookList = new ArrayList();

        /*v pervom for loop vyvoditsya vse poezdki, predlojennye voditelem , i kajdaya poezdka prohoditsya po cikclu
            po otdelnosti, naprimer esli u drivera est' 2 poezdki snachala proverka idet po pervoi i vo vtorom cikle
            beretsya dannye klientov zabronirovavshih poezdku*/
        for(Travel travel: travelList)
        {
            //travelBooks - massiv, kotoryi zapolnyaetsya passajirami, kotorye zabronirovali poezdku s id "travel.getTravelId()"
            List<TravelBook> travelBooks = getTravelBookByTravelId(travel.getTravelId());

            //v etom cikle beretsya dannye usera
            for(TravelBook travelBook: travelBooks)
            {
                Map<String, String> travellerBook = new HashMap<>();
                travellerBook.put("travelId", Integer.toString(travel.getTravelId()));
                travellerBook.put("travelBookId", Integer.toString(travelBook.getId()));
                travellerBook.put("userId", Integer.toString(travel.getUser().getId()));
                travellerBook.put("pickup", travel.getPickup());
                travellerBook.put("destination", travel.getDestination());
                travellerBook.put("travelDate", travel.getTravelDate().toString());
                travellerBook.put("name", travelBook.getName());
                travellerBook.put("numberOfSeats", Integer.toString(travelBook.getNumberOfSeats()));
                if(travelBook.getApproved() == false && travelBook.getRejected() == false)
                {
                    //vse poluchennye dannye v travellerBook dobavlyaestys v List travellerBookList
                    travellerBookList.add(travellerBook);
                }
            }
        }

        return travellerBookList;
    }
    //Eshe odin method dlya pokaza vsplyvayushix uvedomlenii
    //Method dlya odobreniya voditelem passajira
    public Notification approveTravelBook(int travelId, int travelBookId, int bookedSeats)
    {
        Notification notification;

        Optional<Travel> travel = travelRepository.findById(travelId);

        //dlya rasschityvaniya mest
        int totalBookedSeats = travel.get().getBookedSeats() + bookedSeats;
        if(travel.get().getSeats() < totalBookedSeats)
        {
            notification = new Notification(Notification.WARNING, "You don't have enough seats.");
        }
        else
        {
            int updateBookedSeatResult = travelRepository.updateTravelBookedSeats(travelId, totalBookedSeats);
            int approveResult = travelBookRepository.updateTravelBookApproved(travelBookId);

            notification = new Notification(Notification.SUCCESS, "Book is successfully approved.");
        }

        return notification;
    }

    public Notification rejectTravelBook(int travelBookId)
    {
        Notification notification;

        int rejectResult = travelBookRepository.updateTravelBookRejected(travelBookId);
        if (rejectResult > 0) notification = new Notification(Notification.SUCCESS, "Book is successfully rejected.");
        else notification = new Notification(Notification.DANGER, "Rejection was unsuccessful.");

        return notification;
    }

    //Method dlya otmeny travel by driver
    public String cancelTravel(int travelId)
    {
        int cancelResult = travelRepository.updateCanceledTravel(travelId);

        return "cancelResult";
    }


    //vozvrashaet massiv, kotoryi budet zapolnen dostupnymi poezdkami po pickup, destination i date
    public List<Travel> getAllTravelsByDestinationAndDate(String pickup, String destination, Date date)
    {
        //massiv, kotoryi soderjit poezdki po destination i date
        List<Travel> travels = travelRepository.findTravelsByDestinationAndTravelDate(destination, date);

        //gorod, vvodimyi by passenger
        City pickupCity = cityService.getCityByName(pickup).get(0);

        //massiv, soderjashiy vse goroda, kotorye v dalneishem budut provereny
        List<City> allCities = cityService.getAllCities();

        //pervyi loop proveryaet goroda travels.size
        for(int i = 0; i<travels.size(); i++)
        {
            City possiblePickupCity = null;

            /*proveryaetsya vse goroda, beretsya vse pickup so vsego travel, possiblePickupCity priravnyaetsya k gorodu,
            k opredelennomu pickup(nujnuyu) dlya dalneishei proverki po distancii*/
            for(City city: allCities)
            {
                if(travels.get(i).getPickup().equals(city.getName()))
                {
                    // this shouldn't be null, NEVER!
                    possiblePickupCity = city;
                    break;
                }
            }

            int radius = 70;

            //proveryaetsya distanciya po latiude i longitude, dlya polucheniya dostupnyh poezdok vnutri radiusa 70
            double distance = CalculateDistance.distance(pickupCity.getLatitude(), pickupCity.getLongitude(), possiblePickupCity.getLatitude(), possiblePickupCity.getLongitude());
            if(distance > radius)
            {
                travels.remove(i);
                i--;
            }
        }

        return travels;
    }

    //Dlya sohraneniya taxi vnutri gorodas
    public Boolean saveNewTaxi(User user, String city)
    {
        CityTaxi newTaxi = new CityTaxi();
        newTaxi.setUser(user);
        newTaxi.setCity(city);

        try
        {
            CityTaxi savedTaxi = (CityTaxi) cityTaxiRepository.save(newTaxi);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    //Etot method sohranyaet poezdku, predlojennyi by driver
    public Boolean saveNewTravel(User user, String pickup, String destination, Date travelDate, int price, int seats)
    {
        Travel newTravel = new Travel();
        newTravel.setUser(user);
        newTravel.setPickup(pickup);
        newTravel.setDestination(destination);
        newTravel.setTravelDate(travelDate);
        newTravel.setPrice(price);
        newTravel.setSeats(seats);

        try
        {
            Travel savedTravel = travelRepository.save(newTravel);
            System.out.println(savedTravel);
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }

        return true;
    }

    //Etot method dlya sohraneniya broni poezdki, kotoryi broniruet passenger opredelennuyu poezdku
    public Boolean saveTravelBook (int userId, int travelId, String name, int phoneNumber, String message, int numberOfSeats)
    {
        TravelBook newTravelBook = new TravelBook();
        newTravelBook.setUserId(userId);
        newTravelBook.setTravelId(travelId);
        newTravelBook.setName(name);
        newTravelBook.setPhoneNumber(phoneNumber);
        newTravelBook.setMessage(message);
        newTravelBook.setNumberOfSeats(numberOfSeats);
        newTravelBook.setApproved(false);
        newTravelBook.setRejected(false);

        try
        {
            TravelBook savedBook = travelBookRepository.save(newTravelBook);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }

        return true;
    }
}