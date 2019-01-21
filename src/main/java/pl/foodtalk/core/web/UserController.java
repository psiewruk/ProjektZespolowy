package pl.foodtalk.core.web;

import pl.foodtalk.core.model.User;
import pl.foodtalk.core.service.SecurityService;
import pl.foodtalk.core.service.UserService;
import pl.foodtalk.core.validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
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

    @RequestMapping(value = "/restaurantStatic", method = RequestMethod.GET)
    public String restaurantStatic(Model model) {
    	
        return "restaurantStatic";
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
    public String login(Model model, String error, String logout, @RequestHeader("Referer") String referer) {
    	
    	
        if (error != null)
            model.addAttribute("error", "Nazwa użytkownika lub hasło niepoprawne.");

        if (logout != null)
            model.addAttribute("message", "Zostałeś wylogowany.");

        return "login";
    }
}
