package pl.foodtalk.core.web;

import org.springframework.web.bind.annotation.ModelAttribute;
import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.service.DishService;
import pl.foodtalk.core.service.RestaurantService;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestaurantController {
    @Autowired
    private DishService dishService;
    @Autowired
    private RestaurantService restaurantService;
    
    @RequestMapping(value = {"/restaurants/{cat}"}, method = RequestMethod.GET)
    public String restaurants(@PathVariable("cat") String cat, Model model) {
    	ArrayList<Restaurant> listRestaurants = new ArrayList<Restaurant>();
    	
    	model.addAttribute("restaurant", new Restaurant());
    	for(Dish d : this.dishService.findByCategoryName(cat)) {
    		if(!listRestaurants.contains(d.getMenu().getRestaurant()))
    			listRestaurants.add(d.getMenu().getRestaurant());
    	}
		model.addAttribute("listRestaurants", listRestaurants);
        return "restaurants";
    }

    @RequestMapping(value = "/restaurants", method = RequestMethod.GET)
    public String findAll(Model model) {
        model.addAttribute("restaurant", new Restaurant());
        model.addAttribute("listRestaurants", restaurantService.findAll());
        return "restaurant";
    }
    
    /*@RequestMapping(value = {"/restaurant/{name}"}, method = RequestMethod.GET)
    public String restaurant(@PathVariable("name") String name, Model model) {
    	ArrayList<Restaurant> listRestaurants = new ArrayList<Restaurant>();
    	
    	model.addAttribute("restaurant", this.restaurantService.findByName(name));
        return "restaurant";
    }*/
}
