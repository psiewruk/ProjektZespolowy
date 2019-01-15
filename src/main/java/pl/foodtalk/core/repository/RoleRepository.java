package pl.foodtalk.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.foodtalk.core.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}