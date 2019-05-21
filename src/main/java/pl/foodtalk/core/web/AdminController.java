package pl.foodtalk.core.web;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.foodtalk.core.model.Address;
import pl.foodtalk.core.model.Application;
import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.model.Role;
import pl.foodtalk.core.model.User;
import pl.foodtalk.core.repository.RoleRepository;
import pl.foodtalk.core.repository.AddressRepository;
import pl.foodtalk.core.repository.ApplicationRepository;
import pl.foodtalk.core.repository.CategoryRepository;
import pl.foodtalk.core.repository.RestaurantRepository;
import pl.foodtalk.core.service.UserService;

@Controller
public class AdminController {

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private ApplicationRepository applicationService;

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String admin(Model model, Authentication auth) {
        model.addAttribute("category", new Category());
        model.addAttribute("listCategories", this.categoryRepository.findAll());
        model.addAttribute("restaurant", new Restaurant());
        model.addAttribute("listRestaurants", this.restaurantRepository.findAll());
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", userService.findAll());
        model.addAttribute("role", new Role());
        model.addAttribute("listRoles", roleRepository.findAll());
        model.addAttribute("application", new Application());
        model.addAttribute("listApplications", applicationService.findAll());
        
        if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}
        
        return "admin";
    }

    //ZARZĄDZANIE KATEGORIAMI

    @RequestMapping(value = {"/admin/addCategory"}, method = RequestMethod.POST)
    public String addCategory(Model model, @RequestParam("categoryName") String categoryName) {
        Category category = new Category(categoryName);
        categoryRepository.save(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/editCategory"}, method = RequestMethod.POST)
    public String editCategory(Model model, @RequestParam("newName") String newName, @RequestParam("categoryId") Long categoryId) {
        Category category = categoryRepository.findById(categoryId);

        if(newName.length() != 0)
            category.setName(newName);
        categoryRepository.save(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/deleteCategory"}, method = RequestMethod.POST)
    public String deleteCategory(Model model, @RequestParam("categoryId") Long categoryId) {
        categoryRepository.deleteById(categoryId);

        return "redirect:/admin";
    }

    //ZARZĄDZANIE RESTAURACJAMI

    @RequestMapping(value = {"/admin/addRestaurant"}, method = RequestMethod.POST)
    public String addRestaurant(Model model, Authentication authentication, @RequestParam("restaurantName") String name,
                                @RequestParam("desc") String desc, @RequestParam("street") String street,
                                @RequestParam("number") String number, @RequestParam("code") String code,
                                @RequestParam("city") String city,@RequestParam("username") String username) {

        Address address = new Address(street,number,code,city);
        addressRepository.save(address);
        User user = userService.findByUsername(username);

        Restaurant restaurant = new Restaurant(name,address,user,desc);
        restaurantRepository.save(restaurant);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/editRestaurant"}, method = RequestMethod.POST)
    public String editRestaurant(Model model, Authentication authentication,@RequestParam("restaurantId") Long restaurantId,
                                 @RequestParam("newName") String newName, @RequestParam("newDesc") String newDesc,
                                 @RequestParam("newStreet") String newStreet, @RequestParam("newNumber") String newNumber,
                                 @RequestParam("newCode") String newCode, @RequestParam("newCity") String newCity) {

        Restaurant restaurant = restaurantRepository.findById(restaurantId);
        Address address = restaurant.getAddress();

        if(newName.length() != 0)
            restaurant.setName(newName);
        if(newDesc.length() != 0)
            restaurant.setDescription(newDesc);
        if(newStreet.length() != 0)
            address.setStreet(newStreet);
        if(newNumber.length() != 0)
            address.setNumber(newNumber);
        if(newCode.length() != 0)
            address.setPost_code(newCode);
        if(newCity.length() != 0)
            address.setCity(newCity);

        addressRepository.save(address);
        restaurantRepository.save(restaurant);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/deleteRestaurant"}, method = RequestMethod.POST)
    public String deleteRestaurant(Model model, Authentication authentication, @RequestParam("restaurantId") Long restaurantId) {

        restaurantRepository.deleteById(restaurantId);

        return "redirect:/admin";
    }
    
    //ZARZADZANIE UZYTKOWNIKAMI
    
    @RequestMapping(value = {"/admin/editUser"}, method = RequestMethod.POST)
    public String editUser(Model model, Authentication authentication,@RequestParam("userId") Long userId,
                                 @RequestParam("newUsername") String newUsername, @RequestParam("newRole") Long newRole) {

        User user = userService.findById(userId);

        if(newUsername.length() != 0)
            user.setUsername(newUsername);
        if(newRole != null)
        	user.setRoles(new HashSet<>(roleRepository.findById(newRole)));

        userService.save(user);

        return "redirect:/admin";
    }
    
    @RequestMapping(value = {"/admin/deleteUser"}, method = RequestMethod.POST)
    public String deleteUser(Model model, Authentication authentication, @RequestParam("userId") Long userId) {

        userService.deleteById(userId);

        return "redirect:/admin";
    }
    
    //ZARZADZANIE WNIOSKAMI
    @RequestMapping(value = {"/admin/approveApp"}, method = RequestMethod.POST)
    public String approveApp(Model model, Authentication authentication, @RequestParam("applicationId") Long applicationId) {

        Application app = applicationService.findById(applicationId);
        
        Address addr = new Address(app.getStreet(), app.getNumber(), app.getPost_code(), app.getCity());
        addressRepository.save(addr);
        
        Restaurant res = new Restaurant(app.getName(), addr, app.getUser(), app.getDescription());
        restaurantRepository.save(res);
        
        return "redirect:/admin";
    }
    
    @RequestMapping(value = {"/admin/discardApp"}, method = RequestMethod.POST)
    public String discardApp(Model model, Authentication authentication, @RequestParam("applicationId") Long applicationId) {

        applicationService.deleteById(applicationId);

        return "redirect:/admin";
    }
    
}
