package pl.foodtalk.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Restaurant;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {
    Restaurant findByName(String name);
    Restaurant findByUserUsername(String name);

}
