package pl.foodtalk.account.repository;

import pl.foodtalk.account.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
