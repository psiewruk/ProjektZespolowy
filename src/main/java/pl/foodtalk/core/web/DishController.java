package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.service.DishService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DishController {
    @Autowired
    private DishService dishService;
    List<Restaurant> rList;
    
    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String welcome(Model model1) {
    	/*model.addAttribute("category", new Category());
		model.addAttribute("listCategories", this.categoryService.findAll());*/
    	
    	for(Dish d : dishService.findByCategory_id(1)) {
    		/*hmap.put(d.getMenu().getRestaurant().getName(), d);*/
    		if(!rList.contains(d.getMenu().getRestaurant()))
    			rList.add(d.getMenu().getRestaurant());
    	}
    	model1.addAttribute("rList", rList);
        return "category";
    }
}
