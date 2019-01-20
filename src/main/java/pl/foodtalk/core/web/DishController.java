package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.service.DishService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DishController {

    @Autowired
    private DishService dishService;

    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
    public String findAll(Model model) {
        model.addAttribute("dish", new Dish());
        model.addAttribute("listDishes", dishService.findAll());
        return "dish";
    }
}