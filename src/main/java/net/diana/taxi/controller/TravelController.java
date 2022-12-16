package net.diana.taxi.controller;

import net.diana.taxi.model.Car;
import net.diana.taxi.model.CityTaxi;
import net.diana.taxi.model.Travel;
import net.diana.taxi.model.User;
import net.diana.taxi.service.CarService;
import net.diana.taxi.service.TravelService;
import net.diana.taxi.service.UserService;
import net.diana.taxi.util.Notification;
import net.diana.taxi.model.*;
import net.diana.taxi.repository.TravelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class TravelController
{
    @Autowired
    private UserService userService;

    @Autowired
    private TravelService travelService;

    @Autowired
    private CarService carService;

    @Autowired
    private TravelRepository travelRepository;

    @RequestMapping(value = "/travel-search", method = RequestMethod.GET)
   public String getTravelSearchPage(Model model)
    {
       /* Map<String, String> me = new HashMap<>();
        me.put("name", "Diana");
        me.put("lastname", "Sheralieva");
        model.addAttribute(me); */

        //List<Travel> travelList = travelService.getAllTravelsByPickupAndDestination("Osh", "Bishkek");
        List<Travel> travelList = travelRepository.findAll();

        model.addAttribute(travelList);

        return "travel-search";
    }

    @RequestMapping(value = "/incity-taxi-search", method = RequestMethod.POST)
    public String getTaxiSearchPage(HttpServletRequest request, Model model)
    {
        List<Map> incityTaxiList = new ArrayList<>();
        String city = request.getParameter("city");
        List<CityTaxi> cityTaxiList = travelService.getTaxiByCity(city);
        for(CityTaxi cityTaxi: cityTaxiList)
        {
            User user = userService.getUserById(cityTaxi.getUser().getId());
            Map<String, String> incityInfo = new HashMap<>();
            incityInfo.put("city", cityTaxi.getCity());
            incityInfo.put("driverName", user.getName());
            incityInfo.put("phoneNumber", user.getPhoneNumber());
            incityTaxiList.add(incityInfo);
        }
        model.addAttribute("incityTaxiList", incityTaxiList);

        return "travel-search";
    }


    @RequestMapping(value = "/travel-search", method = RequestMethod.POST)
    public String getTravelSearchPage(HttpServletRequest request, Model model)
    {
        List<Map> travelInfoList = new ArrayList<>();
        try
        {
            String pickup = request.getParameter("pickup");
            String destination = request.getParameter("destination");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String travelDate = request.getParameter("travelDate");
            java.util.Date date = sdf.parse(travelDate);
            Date sqlTravelDate = new Date(date.getTime());
            List<Travel> travelList = travelService.getAllTravelsByDestinationAndDate(pickup, destination, sqlTravelDate);
            for(Travel travel: travelList)
            {
                User user = userService.getUserById(travel.getUser().getId());
                Car car =  carService.getCarById(user.getCarId());
                Map<String, String> travelInfo = new HashMap<>();
                travelInfo.put("travelId", Integer.toString(travel.getTravelId()));
                travelInfo.put("pickup", travel.getPickup());
                travelInfo.put("destination", travel.getDestination());
                travelInfo.put("travelDate", travel.getTravelDate().toString());
                travelInfo.put("price", Integer.toString(travel.getPrice()));
                travelInfo.put("bookedSeats", Integer.toString(travel.getBookedSeats()));
                travelInfo.put("seats", Integer.toString(travel.getSeats()));
                travelInfo.put("driverName", user.getName());
                travelInfo.put("carName", car.getName());
                travelInfo.put("carModel", car.getModel());
                travelInfoList.add(travelInfo);
            }
            model.addAttribute("travelInfoList", travelInfoList);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "travel-search?error";
        }

        return "travel-search";
    }

    @RequestMapping(value = "/travel-book", method = RequestMethod.GET)
    public String getTravelBookPage(@RequestParam("travelId") Long travelId, Model model)
    {
        model.addAttribute("travelId", travelId);
        return "travel-book";
    }

    @RequestMapping(value = "/travel-book", method = RequestMethod.POST)
    public String getTravelBookPage(HttpServletRequest request, Model model)
    {
        try
        {
            //if user is not authorized, userId = -1
            int userId = Integer.parseInt(request.getParameter("userId"));
            Integer travelId = Integer.parseInt(request.getParameter("travelId"));
            String name = request.getParameter("name");
            Integer numberOfSeats = Integer.parseInt(request.getParameter("numberOfSeats"));
            Integer phoneNumber = Integer.parseInt((request.getParameter("phoneNumber")));
            String message = request.getParameter("message");
            Boolean isSavedBook = travelService.saveTravelBook(userId, travelId, name, phoneNumber, message, numberOfSeats);
            System.out.println(isSavedBook);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "travel-book?error";

        }
        return "travel-book";
    }

    @RequestMapping(value = "/travel-offer", method = RequestMethod.GET)
    public String getTravelOfferPage()
    {
        return "travel-offer";
    }

    @RequestMapping(value = "/incity-taxi-offer", method = RequestMethod.POST)
    public String getTaxiOffer(HttpServletRequest request, Model model)
    {
        String city = request.getParameter("city");
        Boolean isTaxiSaved = travelService.saveNewTaxi(userService.getCurrentUser(), city);

        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/travel-offer", method = RequestMethod.POST)
    public String getTravelOffer(HttpServletRequest request, Model model)
    {
        try
        {
            String pickup = request.getParameter("pickup");
            String destination = request.getParameter("destination");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String travelDate = request.getParameter("travelDate");
            java.util.Date date = sdf.parse(travelDate);
            Date sqlDate = new Date(date.getTime());
            int price = Integer.parseInt(request.getParameter("price"));
            int seats = Integer.parseInt(request.getParameter("seats"));
            Boolean isSaved = travelService.saveNewTravel(userService.getCurrentUser(), pickup, destination, sqlDate, price, seats);
            System.out.println(isSaved);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "travel-offer?error";
        }

        return "travel-offer";
    }

    @RequestMapping(value = "/approve-travel-book", method = RequestMethod.POST)
    public String approveTravelBook(HttpServletRequest request, Authentication authentication, Model model)
    {
        try
        {
            int travelId = Integer.parseInt(request.getParameter("travelId"));
            int travelBookId = Integer.parseInt(request.getParameter("travelBookId"));
            int numberOfBookedSeats = Integer.parseInt(request.getParameter("numberOfBookedSeats"));

            Notification notification = travelService.approveTravelBook(travelId, travelBookId, numberOfBookedSeats);
            model.addAttribute("notification", notification);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "dashboard?error";
        }

        User user = (User) authentication.getPrincipal();
        List<Travel> travelList = travelService.getTravelListByUserId(user.getId());
        List<Map> travellerBookList = travelService.getTravellerBookList(travelList);
        model.addAttribute("travellerBookList", travellerBookList);

        return "dashboard";
    }

    @RequestMapping(value = "/reject-travel-book", method = RequestMethod.POST)
    public String rejectTravelBook(HttpServletRequest request, Authentication authentication, Model model)
    {
        try
        {
            int travelBookId = Integer.parseInt(request.getParameter("travelBookId"));

            Notification notification = travelService.rejectTravelBook(travelBookId);
            model.addAttribute("notification", notification);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "dashboard?error";
        }

        User user = (User) authentication.getPrincipal();
        List<Travel> travelList = travelService.getTravelListByUserId(user.getId());
        List<Map> travellerBookList = travelService.getTravellerBookList(travelList);
        model.addAttribute("travellerBookList", travellerBookList);

        return "dashboard";
    }

    @RequestMapping(value = "/travels-offered", method = RequestMethod.GET)
    public String getTravelsOfferedPage(Model model, Authentication authentication)
    {
        try
        {
            User user = (User) authentication.getPrincipal();
            List<Travel> userTravelList = travelService.getTravelListByUserId(user.getId());
            model.addAttribute("userTravelList", userTravelList);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return "travels-offered?error";
        }
        return "travels-offered";
    }

    @RequestMapping(value = "travels-booked", method = RequestMethod.GET)
    public String getTravelsBookedPage(Model model, Authentication authentication, HttpServletRequest request)
    {
        /*List<Map> travelsBookedInfoList = new ArrayList<>();
        int travelId = Integer.parseInt(request.getParameter("travelId"));
        List<TravelBook> travelBooks = travelService.getTravelBookByTravelId(travelId);
        for(TravelBook travelBook: travelBooks)
        {
            Travel travel = (Travel) travelService.getTravelBookListByUserId(travelBook.getTravelId());
            Map<String, String> travelBookedInfo = new HashMap<>();
            travelBookedInfo.put("bookedSeats", Integer.toString(travelBook.getNumberOfSeats()));
            travelBookedInfo.put("pickup", travel.getPickup());
            travelBookedInfo.put("destination", travel.getDestination());
            travelBookedInfo.put("travelDate", travel.getTravelDate().toString());
            travelsBookedInfoList.add(travelBookedInfo);
        }
        model.addAttribute("travelBookedInfoList", travelsBookedInfoList);*/
        return "travels-booked";
    }

    @RequestMapping(value = "/cancel-travel", method = RequestMethod.POST)
    public String cancelTravel(HttpServletRequest request)
    {
        int travelId = Integer.parseInt(request.getParameter("travelId"));
        String updateTravel = travelService.cancelTravel(travelId);

        return "redirect:/travels-offered";
    }
}