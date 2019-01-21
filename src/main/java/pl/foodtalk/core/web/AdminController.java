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
import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.model.Role;
import pl.foodtalk.core.model.User;
import pl.foodtalk.core.repository.RoleRepository;
import pl.foodtalk.core.service.AddressService;
import pl.foodtalk.core.service.CategoryService;
import pl.foodtalk.core.service.RestaurantService;
import pl.foodtalk.core.service.UserService;

@Controller
public class AdminController {

    @Autowired
    private RestaurantService restaurantService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("category", new Category());
        model.addAttribute("listCategories", this.categoryService.findAll());
        model.addAttribute("restaurant", new Restaurant());
        model.addAttribute("listRestaurants", this.restaurantService.findAll());
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", userService.findAll());
        model.addAttribute("role", new Role());
        model.addAttribute("listRoles", roleRepository.findAll());
        
        return "admin";
    }

    //ZARZĄDZANIE KATEGORIAMI

    @RequestMapping(value = {"/admin/addCategory"}, method = RequestMethod.POST)
    public String addCategory(Model model, @RequestParam("categoryName") String categoryName) {
        Category category = new Category(categoryName);
        categoryService.save(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/editCategory"}, method = RequestMethod.POST)
    public String editCategory(Model model, @RequestParam("newName") String newName, @RequestParam("categoryId") Long categoryId) {
        Category category = categoryService.findById(categoryId);

        if(newName.length() != 0)
            category.setName(newName);
        categoryService.save(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/deleteCategory"})
    public String deleteCategory(Model model, @RequestParam("categoryId") Long categoryId) {
        categoryService.deleteById(categoryId);

        return "redirect:/admin";
    }

    //ZARZĄDZANIE RESTAURACJAMI

    @RequestMapping(value = {"/admin/addRestaurant"}, method = RequestMethod.POST)
    public String addRestaurant(Model model, Authentication authentication, @RequestParam("restaurantName") String name,
                                @RequestParam("desc") String desc, @RequestParam("street") String street,
                                @RequestParam("number") String number, @RequestParam("code") String code,
                                @RequestParam("city") String city,@RequestParam("username") String username) {

        Address address = new Address(street,number,code,city);
        addressService.save(address);
        User user = userService.findByUsername(username);

        Restaurant restaurant = new Restaurant(name,address,user,desc);
        restaurantService.save(restaurant);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/editRestaurant"}, method = RequestMethod.POST)
    public String editRestaurant(Model model, Authentication authentication,@RequestParam("restaurantId") Long restaurantId,
                                 @RequestParam("newName") String newName, @RequestParam("newDesc") String newDesc,
                                 @RequestParam("newStreet") String newStreet, @RequestParam("newNumber") String newNumber,
                                 @RequestParam("newCode") String newCode, @RequestParam("newCity") String newCity) {

        Restaurant restaurant = restaurantService.findById(restaurantId);
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

        addressService.save(address);
        restaurantService.save(restaurant);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/deleteRestaurant"})
    public String deleteRestaurant(Model model, Authentication authentication, @RequestParam("restaurantId") Long restaurantId) {

        restaurantService.deleteById(restaurantId);

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
    
    @RequestMapping(value = {"/admin/deleteUser"})
    public String deleteUser(Model model, Authentication authentication, @RequestParam("userId") Long userId) {

        userService.deleteById(userId);

        return "redirect:/admin";
    }
}
