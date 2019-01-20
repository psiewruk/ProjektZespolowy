/*package pl.foodtalk.core.web;

import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.model.CategoryIMG;
import pl.foodtalk.core.service.CategoryService;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategoryIMGController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String categoryIMG(Model model) throws UnsupportedEncodingException {

      	for(Category c : categoryService.findAll()) {
    		Base64 b = new Base64();
    		byte[] encodeBase64 = b.encode(c.getImg());
            String base64Encoded = new String(encodeBase64, "UTF-8");
            c.setEncoded(base64Encoded);
  
            model.addAttribute("image"+c.getId(), base64Encoded);
    	}
    	
    	model.addAttribute("category", new CategoryIMG());
		model.addAttribute("listCategories", this.categoryService.findAll());
        return "categoryIMG";
    }
}*/
