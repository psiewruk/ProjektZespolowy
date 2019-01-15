package pl.foodtalk.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Menu;

public interface MenuRepository extends JpaRepository<Menu, Long>{
}
