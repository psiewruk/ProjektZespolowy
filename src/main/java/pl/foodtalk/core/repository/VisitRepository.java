package pl.foodtalk.core.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Visit;

public interface VisitRepository extends JpaRepository<Visit, Long>{
    List<Visit> findByRestaurantName(String name);
    List<Visit> findByUserId(Long id);
}
