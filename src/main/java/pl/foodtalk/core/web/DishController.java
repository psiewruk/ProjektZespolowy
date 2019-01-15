package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.service.DishService;
import pl.foodtalk.core.service.MenuService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DishController {
    @Autowired
    private DishService dishService;
    
    @RequestMapping(value = {"/category/{cat}"}, method = RequestMethod.GET)
    public String dish(@PathVariable("cat") String cat, Model model) {
    	ArrayList<Restaurant> listRestaurants = new ArrayList<Restaurant>();
    	
    	model.addAttribute("restaurant", new Restaurant());
    	for(Dish d : this.dishService.findByCategoryName(cat)) {
    		if(!listRestaurants.contains(d.getMenu().getRestaurant()))
    			listRestaurants.add(d.getMenu().getRestaurant());
    	}
		model.addAttribute("listRestaurants", listRestaurants);
        return "category";
    }
}