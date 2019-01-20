package pl.foodtalk.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findById(Long id);
}
