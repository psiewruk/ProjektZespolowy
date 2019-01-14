package pl.foodtalk.site.repository;

import pl.foodtalk.site.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
	Page<Category> findByMenuId(Long menuId, Pageable pageable);
}