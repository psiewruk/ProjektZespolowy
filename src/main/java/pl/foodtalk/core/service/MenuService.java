package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Menu;

public interface MenuService {
    void save(Menu menu);
    List<Menu> findByRestaurantName(String name);
    List<Menu> findAll();
    Menu findByName(String name);
    Menu findById(Long id);
    Long deleteById(Long id);
}