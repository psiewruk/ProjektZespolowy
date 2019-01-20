package pl.foodtalk.core.web;

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
import pl.foodtalk.core.model.User;
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


    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("category", new Category());
        model.addAttribute("listCategories", this.categoryService.findAll());
        model.addAttribute("restaurant", new Restaurant());
        model.addAttribute("listRestaurants", this.restaurantService.findAll());

        return "admin";
    }

    //ZARZĄDZANIE KATEGORIAMI

    @RequestMapping(value = {"admin/addCategory"}, method = RequestMethod.POST)
    public String addCategory(Model model, @RequestParam("categoryName") String categoryName) {
        Category category = new Category(categoryName);
        categoryService.save(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"/admin/editCategory"}, method = RequestMethod.POST)
    public String editCategory(Model model, @RequestParam("newName") String newName, @RequestParam("categoryId") Long categoryId) {
        Category category = categoryService.findById(categoryId);
        category.setName(newName);
        categoryService.save(category);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"admin/deleteCategory"})
    public String deleteCategory(Model model, @RequestParam("categoryId") Long categoryId) {
        categoryService.deleteById(categoryId);

        return "redirect:/admin";
    }

    //ZARZĄDZANIE RESTAURACJAMI

    @RequestMapping(value = {"admin/addRestaurant"}, method = RequestMethod.POST)
    public String addRestaurant(Model model, Authentication authentication, @RequestParam("name") String name,
                                @RequestParam("desc") String desc, @RequestParam("address") Long addressId,
                                @RequestParam("user") Long userId) {

        Address address = addressService.findById(addressId);
        User user = userService.findById(userId);

        Restaurant restaurant = new Restaurant(name,address,user,desc);
        restaurantService.save(restaurant);

        return "redirect:/admin";
    }

    @RequestMapping(value = {"admin/editRestaurant"}, method = RequestMethod.POST)
    public String editRestaurant(Model model, Authentication authentication, @RequestParam("restaurantId") Long restaurantId,
                                 @RequestParam("newName") String newName, @RequestParam("newDesc") String newDesc,
                                 @RequestParam("newAddress") Long addressId, @RequestParam("newUser") Long userId) {
        Restaurant restaurant = restaurantService.findById(restaurantId);

        if(newName.length() != 0)
            restaurant.setName(newName);
        if(newDesc.length() != 0)
            restaurant.setDescription(newDesc);
        restaurant.setAddress(addressService.findById(addressId));
        restaurant.setUser(userService.findById(userId));

        return "redirect:/admin";
    }

    @RequestMapping(value = {"admin/deleteRestaurant"})
    public String deleteRestaurant(Model model, @RequestParam("restaurantId") Long restaurantId) {
        restaurantService.deleteById(restaurantId);

        return "redirect:/admin";
    }
}
