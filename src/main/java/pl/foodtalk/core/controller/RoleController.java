package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Role;
import pl.foodtalk.core.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api")
public class RoleController {

    @Autowired
    RoleRepository roleRepository;

    // Get All Notes
    @GetMapping("/roles")
    public List<Role> getAllUsers() {
        return roleRepository.findAll();
    }
    
    // Create a new Note
    @PostMapping("/roles")
    public Role createRole(@Valid @RequestBody Role role) {
        return roleRepository.save(role);
    }
    // Get a Single Note
    @GetMapping("/roles/{id}")
    public Role getRoleById(@PathVariable(value = "id") Long roleId) {
        return roleRepository.findById(roleId)
                .orElseThrow(() -> new ResourceNotFoundException("Role", "id", roleId));
    }
    // Update a Note
    @PutMapping("/roles/{id}")
    public Role updateRole(@PathVariable(value = "id") Long roleId,
                                            @Valid @RequestBody Role roleDetails) {

    	Role role = roleRepository.findById(roleId)
                .orElseThrow(() -> new ResourceNotFoundException("Role", "id", roleId));

    	role.setName(roleDetails.getName());


        Role updatedUser = roleRepository.save(role);
        return updatedUser;
    }
    
    // Delete a User
    @DeleteMapping("/roles/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable(value = "id") Long roleId) {
        Role user = roleRepository.findById(roleId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", roleId));

        roleRepository.delete(user);

        return ResponseEntity.ok().build();
    }
}
