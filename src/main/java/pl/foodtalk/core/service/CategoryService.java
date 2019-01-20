package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Category;

public interface CategoryService {
    void save(Category category);
    Category findByName(String name);
    List<Category> findAll();
    Category findById(Long id);
    Long deleteById(Long id);
}
