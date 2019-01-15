package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.service.RestaurantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestaurantController {
    @Autowired
    private RestaurantService restaurantService;

    @RequestMapping(value = {"/category/{id}"}, method = RequestMethod.GET)
    public String category(Model model) {
        return "category";
    }
}
