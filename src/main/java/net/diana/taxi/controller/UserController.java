package net.diana.taxi.controller;

import net.diana.taxi.service.TravelService;
import net.diana.taxi.service.UserService;
import net.diana.taxi.model.User;
import net.diana.taxi.repository.TravelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController
{
    @Autowired
    private TravelService travelService;

    @Autowired
    private TravelRepository travelRepository;

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String getProfilePage(Model model)
    {
        model.addAttribute("user",userService.getCurrentUser());
        return "profile";
    }

    @RequestMapping(value = "/editprofile", method = RequestMethod.GET)
    public String getEditProfilePage(Model model)
    {
        model.addAttribute("user", userService.getCurrentUser());
        return "editprofile";
    }

    @RequestMapping(value = "/editprofile/save", method = RequestMethod.POST)
    public String getProfileEdit(HttpServletRequest request)
    {
        User user = userService.getCurrentUser();
        user.setName(request.getParameter("name"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPhoneNumber(request.getParameter("phoneNumber"));
        //user.setBirthDate(request.getParameter("birthDate"));
        userService.updateUser(user);

        return "redirect:/editprofile";
    }

    @RequestMapping(value = "/add-car", method = RequestMethod.GET)
    public String getAddCarPage()
    {
        return "add-car";
    }

    @RequestMapping(value = "/add-car", method = RequestMethod.POST)
    public String getAddingCar(HttpServletRequest request)
    {
        String name = request.getParameter("name");
        String model = request.getParameter("model");
        int year  = Integer.parseInt(request.getParameter("year"));
        Boolean isSaved = userService.saveNewCar(name, model, year);

        return "redirect:/profile";
    }
}