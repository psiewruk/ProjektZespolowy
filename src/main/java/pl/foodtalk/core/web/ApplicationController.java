package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Application;
import pl.foodtalk.core.service.ApplicationService;
import pl.foodtalk.core.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApplicationController {

	@Autowired
	private ApplicationService applicationService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = {"/restauratorForm"}, method = RequestMethod.GET)
	public String management(Model model, Authentication auth) {
		
		if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}

		return "restauratorForm";
	}

	@RequestMapping(value = {"/restauratorForm"}, method = RequestMethod.POST)
	public String application(Model model, Authentication authentication, @RequestParam("name") String name, @RequestParam("description") String description,
			@RequestParam("street") String street, @RequestParam("number") String number, @RequestParam("postcode") String postcode, 
			@RequestParam("city") String city) {

		Application app = new Application(name, description, street, number, postcode, city, userService.findByUsername(authentication.getName()));

		applicationService.save(app);
		
		return "redirect:/restauratorForm";
	}
}