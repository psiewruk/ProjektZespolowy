package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.repository.MenuRepository;
import pl.foodtalk.core.repository.RestaurantRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class MenuController {

	 @Autowired
	 private MenuRepository menuRepository;

	 @Autowired
	 private RestaurantRepository restaurantRepository;

	 @GetMapping("/restaurants/{restaurantId}/menus")
	 public Page<Menu> getAllMenusByRestaurantId(@PathVariable (value = "restaurantId") Long restaurantId,
			 Pageable pageable) {
	     return menuRepository.findByRestaurantId(restaurantId, pageable);
	 }
	 
	 @GetMapping("/menus/{menuId}")
	    public Menu getMenuById(@PathVariable(value = "menuId") Long menuId) {
	        return menuRepository.findById(menuId)
	                .orElseThrow(() -> new ResourceNotFoundException("MenuId " + menuId + " not found"));
	    }
	    
	    @GetMapping("/menus")
	    public Page<Menu> getAllMenus(Pageable pageable) {
	        return menuRepository.findAll(pageable);
	    }

	    @PostMapping("/restaurants/{restaurantId}/menus")
	    public Menu createMenu(@PathVariable (value = "restaurantId") Long restaurantId,
	                                 @Valid @RequestBody Menu menu) {
	        return restaurantRepository.findById(restaurantId).map(restaurant -> {
	            menu.setRestaurant(restaurant);
	            return menuRepository.save(menu);
	        }).orElseThrow(() -> new ResourceNotFoundException("RestaurantId " + restaurantId + " not found"));
	    }

	    @PutMapping("/restaurants/{restaurantId}/menus/{menuId}")
	    public Menu updateMenu(@PathVariable (value = "restaurantId") Long restaurantId,
	                                 @PathVariable (value = "menuId") Long menuId,
	                                 @Valid @RequestBody Menu menuRequest) {
	        if(!restaurantRepository.existsById(restaurantId)) {
	            throw new ResourceNotFoundException("RestaurantId " + restaurantId + " not found");
	        }

	        return menuRepository.findById(menuId).map(menu -> {
	            menu.setName(menuRequest.getName());
	            return menuRepository.save(menu);
	        }).orElseThrow(() -> new ResourceNotFoundException("MenuId " + menuId + " not found"));
	    }
	    
	    @PutMapping("/menus/{menuId}")
	    public Menu updateMenu(@PathVariable Long menuId, @Valid @RequestBody Menu menuRequest) {
	        return menuRepository.findById(menuId).map(menu -> {
	        	menu.setName(menuRequest.getName());

	            return menuRepository.save(menu);
	        }).orElseThrow(() -> new ResourceNotFoundException("MenuId " + menuId + " not found"));
	    }

	    @DeleteMapping("/restaurants/{restaurantId}/menus/{menuId}")
	    public ResponseEntity<?> deleteMenu(@PathVariable (value = "restaurantId") Long restaurantId,
	                              @PathVariable (value = "menuId") Long menuId) {
	        if(!restaurantRepository.existsById(restaurantId)) {
	            throw new ResourceNotFoundException("RestaurantId " + restaurantId + " not found");
	        }

	        return menuRepository.findById(menuId).map(menu -> {
	             menuRepository.delete(menu);
	             return ResponseEntity.ok().build();
	        }).orElseThrow(() -> new ResourceNotFoundException("MenuId " + menuId + " not found"));
	    }
}
