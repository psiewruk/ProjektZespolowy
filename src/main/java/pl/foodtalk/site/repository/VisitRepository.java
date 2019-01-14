package pl.foodtalk.site.repository;

import pl.foodtalk.site.model.Visit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VisitRepository extends JpaRepository<Visit, Long> {
    Page<Visit> findByUserId(Long userId, Pageable pageable);
    Page<Visit> findByRestaurantId(Long restaurantId, Pageable pageable);
}
