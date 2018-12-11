package pl.foodtalk.core.repository;

import pl.foodtalk.core.model.Opinion;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OpinionRepository extends JpaRepository<Opinion, Long> {
    Page<Opinion> findByRestaurantId(Long restaurantId, Pageable pageable);
    Page<Opinion> findByUserId(Long userId, Pageable pageable);
}