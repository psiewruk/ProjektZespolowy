package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Dish;

public interface DishService {
    void save(Dish dish);
    List<Dish> findByCategoryName(String name);
    List<Dish> findAll();
}
