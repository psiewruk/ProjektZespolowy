package pl.foodtalk.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Dish;

public interface DishRepository extends JpaRepository<Dish, Long>{
}
