package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.model.CategoryIMG;
import pl.foodtalk.core.service.CategoryService;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String categoryIMG(Model model, Authentication auth) throws UnsupportedEncodingException {
    	
    	model.addAttribute("category", new CategoryIMG());
		model.addAttribute("listCategories", this.categoryService.findAll());
		
		if(auth != null) {
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_USER")))
				model.addAttribute("isUser", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_MANAGER")))
				model.addAttribute("isManager", true);
			if(auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN")))
				model.addAttribute("isAdmin", true);
		}
        return "category";
    }
}
