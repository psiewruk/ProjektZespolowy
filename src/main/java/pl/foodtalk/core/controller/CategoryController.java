package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.repository.CategoryRepository;
import pl.foodtalk.core.repository.MenuRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class CategoryController {

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private MenuRepository menuRepository;

	@GetMapping("/menus/{menuId}/categories")
	public Page<Category> getAllCategoriesByMenuId(@PathVariable(value = "menuId") Long menuId, Pageable pageable) {
		return categoryRepository.findByMenuId(menuId, pageable);
	}

	@GetMapping("/categories/{categoryId}")
	public Category getCategoryById(@PathVariable(value = "categoryId") Long categoryId) {
		return categoryRepository.findById(categoryId)
				.orElseThrow(() -> new ResourceNotFoundException("CategoryId " + categoryId + " not found"));
	}

	@GetMapping("/categories")
	public Page<Category> getAllCategories(Pageable pageable) {
		return categoryRepository.findAll(pageable);
	}

	@PostMapping("/menus/{menuId}/categories")
	public Category createCategory(@PathVariable(value = "menuId") Long menuId, @Valid @RequestBody Category category) {
		return menuRepository.findById(menuId).map(menu -> {
			category.setMenu(menu);
			return categoryRepository.save(category);
		}).orElseThrow(() -> new ResourceNotFoundException("MenuId " + menuId + " not found"));
	}

	@PutMapping("/menus/{menuId}/categories/{categoryId}")
	public Category updateCategory(@PathVariable(value = "menuId") Long menuId,
			@PathVariable(value = "categoryId") Long categoryId, @Valid @RequestBody Category categoryRequest) {
		if (!menuRepository.existsById(menuId)) {
			throw new ResourceNotFoundException("MenuId " + menuId + " not found");
		}

		return categoryRepository.findById(categoryId).map(category -> {
			category.setName(categoryRequest.getName());
			return categoryRepository.save(category);
		}).orElseThrow(() -> new ResourceNotFoundException("CategoryId " + categoryId + " not found"));
	}

	@PutMapping("/categories/{categoryId}")
	public Category updateCategory(@PathVariable Long categoryId, @Valid @RequestBody Category categoryRequest) {
		return categoryRepository.findById(categoryId).map(category -> {
			category.setName(categoryRequest.getName());

			return categoryRepository.save(category);
		}).orElseThrow(() -> new ResourceNotFoundException("CategoryId " + categoryId + " not found"));
	}

	@DeleteMapping("/menus/{menuId}/categories/{categoryId}")
	public ResponseEntity<?> deleteCategory(@PathVariable(value = "menuId") Long menuId,
			@PathVariable(value = "categoryId") Long categoryId) {
		if (!menuRepository.existsById(menuId)) {
			throw new ResourceNotFoundException("RestaurantId " + menuId + " not found");
		}

		return categoryRepository.findById(categoryId).map(category -> {
			categoryRepository.delete(category);
			return ResponseEntity.ok().build();
		}).orElseThrow(() -> new ResourceNotFoundException("CategoryId " + categoryId + " not found"));
	}
}