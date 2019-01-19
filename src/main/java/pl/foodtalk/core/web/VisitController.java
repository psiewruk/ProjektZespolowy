package pl.foodtalk.core.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.foodtalk.core.model.Visit;
import pl.foodtalk.core.service.RestaurantService;
import pl.foodtalk.core.service.UserService;
import pl.foodtalk.core.service.VisitService;

public class VisitController {
    @Autowired
    private VisitService visitService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RestaurantService restaurantService;

   /* @RequestMapping(value = "/restaurant/{name}", method = RequestMethod.POST)
    public String visit(@ModelAttribute("visitForm") Visit visitForm, @PathVariable("name") String name, BindingResult bindingResult, Model model, Authentication authentication) {
    
    	visitForm.setRestaurant(this.restaurantService.findByName(name));
    	visitForm.setUser(this.userService.findByUsername(authentication.getName()));
        visitService.save(visitForm);

        return "redirect:/restaurant";
    }*/
}
