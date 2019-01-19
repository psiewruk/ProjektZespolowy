package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Restaurant;

public interface RestaurantService {
    void save(Restaurant restaurant);
    Restaurant findByName(String name);
    List<Restaurant> findAll();
    void addRestaurant(Restaurant r);
    void updateRestaurant(Restaurant r);
    void deleteRestaurant(int id);
}
