package net.diana.taxi.controller;

import net.diana.taxi.service.TravelService;
import net.diana.taxi.model.Travel;
import net.diana.taxi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

@Controller
public class MainController
{
    @Autowired
    private TravelService travelService;

    @RequestMapping(value = {"", "/", "/welcome"}, method = RequestMethod.GET)
    public String getIndex()
    {
        return "welcome";
    }
    
    @RequestMapping(value = {"/dashboard"}, method = RequestMethod.GET)
    public String getDashboardPage(Model model, Authentication authentication)
    {
        //proverit, est li u usera travel
        //esli est', travel byl li booked ili net
        //esli booked is true , otpravit v jsp

        if(authentication != null)
        {
            //method authentication checks, if user get authorized, if yes it shows
            //method authentication proveryaet, prohodil li user authorization, esli da vyvodit
            User user = (User) authentication.getPrincipal();

            //travelList - beretsya id voditelya, kotoryi predlojil poezdku
            List<Travel> travelList = travelService.getTravelListByUserId(user.getId());

            //travvelerBookList - massiv of Map, kotoryi budet zapolnen userami, zabronirovavshie opredelennuyu poezdku
            // voditelya,  t.e odin List i vnutri Map hranyatsya vse usery s dannymi po otdelnosti
            List<Map> travellerBookList = travelService.getTravellerBookList(travelList);

            //model otrpavlyaet dannye v jsp, dlya vyvoda v frontend
            model.addAttribute("travellerBookList", travellerBookList);
        }

    	return "dashboard";
    }
}