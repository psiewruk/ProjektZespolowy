package pl.foodtalk.core.web;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model, Authentication auth) {
    	if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}
    	
        return "welcome";
    }
    
    @RequestMapping(value = {"/accessDenied"}, method = RequestMethod.GET)
    public String accessDenied(Model model) {
        return "accessDenied";
    }
    
    @RequestMapping(value = {"/notFound"}, method = RequestMethod.GET)
    public String notFound(Model model) {
        return "notFound";
    }
}
