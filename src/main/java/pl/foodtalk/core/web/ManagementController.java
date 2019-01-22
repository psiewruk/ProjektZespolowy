package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.service.CategoryService;
import pl.foodtalk.core.service.DishService;
import pl.foodtalk.core.service.MenuService;
import pl.foodtalk.core.service.RestaurantService;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManagementController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private DishService dishService;

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = {"/manage"}, method = RequestMethod.GET)
	public String management(Model model, Authentication auth) {

		HashMap<Menu, List<Dish>> menuMap = new HashMap<Menu, List<Dish>>();
		model.addAttribute("dish", new Dish());
		model.addAttribute("menu", new Menu());
		
		if(restaurantService.findByUserUsername(auth.getName()) != null) {
			for(Menu m : menuService.findByRestaurantName(restaurantService.findByUserUsername(auth.getName()).getName()))
				menuMap.put(m, dishService.findByMenuId(m.getId()));
			model.addAttribute("restaurant", restaurantService.findByUserUsername(auth.getName()));
		}
		model.addAttribute("menuMap", menuMap);
		model.addAttribute("listCategories", categoryService.findAll());
		
		if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}

		return "manage";
	}

	//
	//ZARZADZANIE MENU
	//

	@RequestMapping(value = {"/manage/editMenu"}, method = RequestMethod.POST)
	public String editMenu(Model model, Authentication authentication, @RequestParam("newName") String newName, @RequestParam("menuId") Long menuId) {

		Menu menu = menuService.findById(menuId);
		menu.setName(newName);
		menuService.save(menu);

		return "redirect:/manage";
	}

	@RequestMapping(value = {"/manage/deleteMenu"}, method = RequestMethod.POST)
	public String deleteMenu(Model model, Authentication authentication, @RequestParam("menuId") Long menuId) {

		menuService.deleteById(menuId);

		return "redirect:/manage";
	}

	@RequestMapping(value = {"/manage/addMenu"}, method = RequestMethod.POST)
	public String addMenu(Model model, Authentication authentication, @RequestParam("menuName") String menuName) {

		Menu menu = new Menu(menuName, restaurantService.findByUserUsername(authentication.getName()));
		menuService.save(menu);

		return "redirect:/manage";
	}

	//
	//ZARZADZANIE DISH
	//

	@RequestMapping(value = {"/manage/editDish"}, method = RequestMethod.POST)
	public String editDish(Model model, Authentication authentication, @RequestParam("newName") String newName, @RequestParam("newPrice") Float newPrice,
						   @RequestParam("newDesc") String newDesc, @RequestParam("dishId") Long dishId) {

		Dish dish = dishService.findById(dishId);
		if(newName.length() != 0)
			dish.setName(newName);
		if(newDesc.length() != 0)
			dish.setDescription(newDesc);
		if(newPrice != null)
			dish.setPrice(newPrice);
		dishService.save(dish);

		return "redirect:/manage";
	}

	@RequestMapping(value = {"/manage/addDish"}, method = RequestMethod.POST)
	public String addDish(Model model, Authentication authentication, @RequestParam("newName") String newName, @RequestParam("newPrice") Float newPrice,
						  @RequestParam("newDesc") String newDesc, @RequestParam("menuId") Long menuId, @RequestParam("cat") Long categoryId) {

		Dish dish = new Dish(newPrice, newName, newDesc, categoryService.findById(categoryId), menuService.findById(menuId));
		dishService.save(dish);

		return "redirect:/manage";
	}

	@RequestMapping(value = {"/manage/deleteDish"}, method = RequestMethod.POST)
	public String deleteDish(Model model, Authentication authentication, @RequestParam("dishId") Long dishId) {

		dishService.deleteById(dishId);

		return "redirect:/manage";
	}
}