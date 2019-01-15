package pl.foodtalk.core.web;

import org.springframework.web.bind.annotation.PathVariable;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.service.DishService;
import pl.foodtalk.core.service.MenuService;
import pl.foodtalk.core.service.RestaurantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;

@Controller
public class RestaurantController {
    @Autowired
    private RestaurantService restaurantService;
    
    @Autowired
    private MenuService menuService;
    
    @Autowired
    private DishService dishService;

    /*@RequestMapping(value = {"/category/restaurant/{res}"}, method = RequestMethod.GET)
    public String restaurant(@PathVariable("res") String res, Model model) {
        ArrayList<Menu> listMenus = new ArrayList<Menu>();

        model.addAttribute("menu", new Menu());
        for(Menu m : this.menuService.findByRestaurantName(res)) {
            listMenus.add(m.getRestaurant())
        }
        return "restaurant";
    }*/
}