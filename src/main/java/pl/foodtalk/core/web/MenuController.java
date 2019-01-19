package pl.foodtalk.core.web;

import org.springframework.web.bind.annotation.*;
import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.service.DishService;
import pl.foodtalk.core.service.MenuService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;
    
    @Autowired
    private DishService dishService;

    @RequestMapping(value = {"/restaurant/{res}"}, method = RequestMethod.GET)
    public String menu(@PathVariable("res") String res, Model model) {
    	
    	HashMap<Menu, List<Dish>> menuMap = new HashMap<Menu, List<Dish>>();
    	model.addAttribute("dish", new Dish());
    
    	for(Menu m : this.menuService.findByRestaurantName(res)) {
    		menuMap.put(m, this.dishService.findByMenuId(m.getId()));
    	}
    	
        model.addAttribute("menu", new Menu());
        model.addAttribute("listMenus", this.menuService.findByRestaurantName(res));
        model.addAttribute("menuMap", menuMap);

        return "restaurant";
    }

    @RequestMapping(value = "/menus", method = RequestMethod.GET)
    public String findAll(Model model) {
        model.addAttribute("menu", new Menu());
        model.addAttribute("listMenus", menuService.findAll());
        return "menu";
    }

    @RequestMapping(value="/menu/add", method = RequestMethod.POST)
    public String addMenu(@ModelAttribute Menu m) {
        menuService.addMenu(m);
        return "redirect:/menus";
    }

    @RequestMapping(value = "/menu/update/", method = RequestMethod.POST)
    public String updateMenu(@ModelAttribute Menu m) {
        menuService.updateMenu(m);
        return "redirect:/menus";
    }

    @RequestMapping("/delete/{id}")
    public String deleteMenu(@PathVariable("id") int id) {
        menuService.deleteMenu(id);
        return "redirect:/menus";
    }
}
