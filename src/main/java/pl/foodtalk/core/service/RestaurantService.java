package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Restaurant;

public interface RestaurantService {
    void save(Restaurant restaurant);
    Restaurant findByName(String name);
    Restaurant findByUserUsername(String name);
    List<Restaurant> findAll();
}
