package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.repository.RestaurantRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {
    @Autowired
    private RestaurantRepository restaurantRepository;

    @Override
    public void save(Restaurant restaurant) {
        restaurantRepository.save(restaurant);
    }

    @Override
    public Restaurant findByName(String name) {
        return restaurantRepository.findByName(name);
    }

    @Override
    public List<Restaurant> findAll() {
        return restaurantRepository.findAll();
    }
}
