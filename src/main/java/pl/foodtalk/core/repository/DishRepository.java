package pl.foodtalk.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Dish;

public interface DishRepository extends JpaRepository<Dish, Long>{
	List<Dish> findByCategory_id(long id);
}
