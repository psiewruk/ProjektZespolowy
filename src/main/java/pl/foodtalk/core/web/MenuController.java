package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.model.Visit;
import pl.foodtalk.core.service.DishService;
import pl.foodtalk.core.service.MenuService;
import pl.foodtalk.core.service.RestaurantService;
import pl.foodtalk.core.service.UserService;
import pl.foodtalk.core.service.VisitService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;
    
    @Autowired
    private DishService dishService;
    
    @Autowired
    private RestaurantService restaurantService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private VisitService visitService;

    @RequestMapping(value = {"/restaurant/{res}"}, method = RequestMethod.GET)
    public String menu(@PathVariable("res") String res, Model model) {
    	
    	HashMap<Menu, List<Dish>> menuMap = new HashMap<Menu, List<Dish>>();
        ArrayList<Visit> futureVisits = new ArrayList<Visit>();
    	model.addAttribute("dish", new Dish());
    	model.addAttribute("menu", new Menu());
    	model.addAttribute("visitForm", new Visit());
    	model.addAttribute("restaurant", restaurantService.findByName(res));
    
    	for(Menu m : this.menuService.findByRestaurantName(res))
    		menuMap.put(m, this.dishService.findByMenuId(m.getId()));

        model.addAttribute("menuMap", menuMap);

        for(Visit v : visitService.findByRestaurantName(res)) {
            if(v.getEnd_date().compareTo(new Date()) < 0)
                futureVisits.add(v);
        }

        model.addAttribute("futureVisits", futureVisits);

        return "restaurant";
    }

    
	@RequestMapping(value = "/restaurant/{res}", method = RequestMethod.POST)
    public String visit(@ModelAttribute("visitForm") Visit visitForm, @PathVariable("res") String res, BindingResult bindingResult, Model model, Authentication authentication) throws ParseException {
    
    	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"); 
    	
    	visitForm.setRestaurant(this.restaurantService.findByName(res));
    	visitForm.setUser(this.userService.findByUsername(authentication.getName()));
    	visitForm.setStart_date(new Date(formatter.parse(visitForm.getStart_dateString()).getTime()));
    	visitForm.setEnd_date(new Date(formatter.parse(visitForm.getEnd_dateString()).getTime()));
        visitService.save(visitForm);

        System.out.println(visitForm.getStart_dateString() + "   " + visitForm.getEnd_dateString());
        System.out.println(visitForm.getStart_date() + "   "+visitForm.getEnd_date());
        
        return "redirect:/restaurant/"+res;
	}

    @RequestMapping(value = "/menus", method = RequestMethod.GET)
    public String findAll(Model model) {
        model.addAttribute("menu", new Menu());
        model.addAttribute("listMenus", menuService.findAll());
        return "menu";
    }
}
