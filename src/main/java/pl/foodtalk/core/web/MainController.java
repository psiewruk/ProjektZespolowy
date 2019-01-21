package pl.foodtalk.core.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
    
    @RequestMapping(value = {"/accessDenied"}, method = RequestMethod.GET)
    public String accessDenied(Model model) {
        return "accessDenied";
    }
    
    @RequestMapping(value = {"/notFound"}, method = RequestMethod.GET)
    public String notFound(Model model) {
        return "notFound";
    }
}
