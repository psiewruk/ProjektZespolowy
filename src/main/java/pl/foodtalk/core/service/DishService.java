package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Dish;

public interface DishService {
    List<Dish> findByCategoryName(String name);
    List<Dish> findAll();
    List<Dish> findByMenuId(Long id);
}
