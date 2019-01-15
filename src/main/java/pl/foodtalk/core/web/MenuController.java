package pl.foodtalk.core.web;

import org.springframework.web.bind.annotation.RestController;
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
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = {"/restaurant/{res}"}, method = RequestMethod.GET)
    public String menu(@PathVariable("res") String res, Model model) {
        model.addAttribute("menu", new Menu());
        model.addAttribute("listMenus", this.menuService.findByRestaurantName(res));
        return "restaurant";
    }
}
