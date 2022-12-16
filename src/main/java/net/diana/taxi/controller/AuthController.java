package net.diana.taxi.controller;

import javax.servlet.http.HttpServletRequest;

import net.diana.taxi.service.CustomUserDetailsService;
import net.diana.taxi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AuthController
{
    @Autowired
    private CustomUserDetailsService userDetailsService;
    
    @RequestMapping(value =  "/login", method = RequestMethod.GET)
    public String getLoginPage() 
    {
    	return "login";
    }
    
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String getSignupPage()
    {
    	return "signup";
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registerUser(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		
		if(password1 != null && password2 != null && password1.equals(password2))
		{
			try
			{
				
				User newUser = new User();
				newUser.setEmail(email);
				newUser.setUsername(username);
				newUser.setPassword(password1);
				
				userDetailsService.registerNewUser(newUser);
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		
		return "login";
	}
    
}
