package pl.foodtalk.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Opinion;

public interface OpinionRepository extends JpaRepository<Opinion, Long>{
    List<Opinion> findByRestaurantName(String name);
    List<Opinion> findByUserId(Long id);
}
