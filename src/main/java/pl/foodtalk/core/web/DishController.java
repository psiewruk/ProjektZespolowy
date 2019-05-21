package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.repository.DishRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DishController {

    @Autowired
    private DishRepository dishRepository;

    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
    public String findAll(Model model, Authentication auth) {
        model.addAttribute("dish", new Dish());
        model.addAttribute("listDishes", dishRepository.findAll());
        
        if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}
        
        return "dish";
    }
}