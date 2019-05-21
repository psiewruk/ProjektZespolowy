package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.repository.DishRepository;
import pl.foodtalk.core.repository.RestaurantRepository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestaurantController {
    @Autowired
    private DishRepository dishRepository;

    @Autowired
    private RestaurantRepository restaurantRepository;
    
    @RequestMapping(value = {"/restaurants/{cat}"}, method = RequestMethod.GET)
    public String restaurants(@PathVariable("cat") String cat, Model model, Authentication auth) {
    	ArrayList<Restaurant> listRestaurants = new ArrayList<Restaurant>();
    	
    	model.addAttribute("restaurant", new Restaurant());
    	for(Dish d : this.dishRepository.findByCategoryName(cat)) {
    		if(!listRestaurants.contains(d.getMenu().getRestaurant()))
    			listRestaurants.add(d.getMenu().getRestaurant());
    	}
		model.addAttribute("listRestaurants", listRestaurants);
		
		if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}
		
        return "restaurants";
    }

    @RequestMapping(value = "/restaurants", method = RequestMethod.GET)
    public String findAll(Model model, Authentication auth) {
        model.addAttribute("restaurant", new Restaurant());
        model.addAttribute("listRestaurants", restaurantRepository.findAll());
        
        if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}
        
        return "restaurant";
    }
}
