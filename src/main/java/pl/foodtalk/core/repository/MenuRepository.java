package pl.foodtalk.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Menu;

import java.util.List;

public interface MenuRepository extends JpaRepository<Menu, Long>{
    List<Menu> findByRestaurantName(String name);
    Menu findByName(String name);
    Menu findById(Long id);
}
