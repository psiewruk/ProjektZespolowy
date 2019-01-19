package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
    
    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String category(Model model) {
    	model.addAttribute("category", new Category());
		model.addAttribute("listCategories", this.categoryService.findAll());
        return "category";
    }
}
