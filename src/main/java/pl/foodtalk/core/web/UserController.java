package pl.foodtalk.core.web;

import pl.foodtalk.core.model.User;
import pl.foodtalk.core.service.SecurityService;
import pl.foodtalk.core.service.UserService;
import pl.foodtalk.core.validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
    	
        return "index";
    }
    
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public String category(Model model) {
    	
        return "category";
    }

    @RequestMapping(value = "/restaurantBurger", method = RequestMethod.GET)
    public String restaurantBurger(Model model) {
    	
        return "restaurantBurger";
    }
    
    @RequestMapping(value = "/restaurantPizza", method = RequestMethod.GET)
    public String restaurantPizza(Model model) {
    	
        return "restaurantPizza";
    }
    
    @RequestMapping(value = "/restaurantKebab", method = RequestMethod.GET)
    public String restaurantKebab(Model model) {
    	
        return "restaurantKebab";
    }
    
    @RequestMapping(value = "/restaurantTortilla", method = RequestMethod.GET)
    public String restaurantTortilla(Model model) {
    	
        return "restaurantTortilla";
    }
    
    @RequestMapping(value = "/restaurantLasagne", method = RequestMethod.GET)
    public String restaurantLasagne(Model model) {
    	
        return "restaurantLasagne";
    }
    
    @RequestMapping(value = "/restaurantMakaron", method = RequestMethod.GET)
    public String restaurantMakaron(Model model) {
    	
        return "restaurantMakaron";
    }
    
    @RequestMapping(value = "/restaurantSalatki", method = RequestMethod.GET)
    public String restaurantSalatki(Model model) {
    	
        return "restaurantSalatki";
    }
    
    @RequestMapping(value = "/restaurantKanapki", method = RequestMethod.GET)
    public String restaurantKanapki(Model model) {
    	
        return "restaurantKanapki";
    }
    
    @RequestMapping(value = "/restaurantSushi", method = RequestMethod.GET)
    public String restaurantSushi(Model model) {
    	
        return "restaurantSushi";
    }
    
    @RequestMapping(value = "/restaurantPierogi", method = RequestMethod.GET)
    public String restaurantPierogi(Model model) {
    	
        return "restaurantPierogi";
    }
    
    @RequestMapping(value = "/restaurantNalesniki", method = RequestMethod.GET)
    public String restaurantNalesniki(Model model) {
    	
        return "restaurantNalesniki";
    }
    
    @RequestMapping(value = "/restaurantZupy", method = RequestMethod.GET)
    public String restaurantZupy(Model model) {
    	
        return "restaurantZupy";
    }
    
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
}
