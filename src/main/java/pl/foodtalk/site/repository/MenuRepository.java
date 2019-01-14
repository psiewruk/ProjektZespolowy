package pl.foodtalk.site.repository;

import pl.foodtalk.site.model.Menu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {
	Page<Menu> findByRestaurantId(Long restaurantId, Pageable pageable);
}