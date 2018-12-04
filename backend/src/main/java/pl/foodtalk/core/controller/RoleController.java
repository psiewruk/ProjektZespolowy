package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Role;
import pl.foodtalk.core.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

@RestController
public class RoleController {

    @Autowired
    RoleRepository roleRepository;

    @GetMapping("/roles")
    public Page<Role> getAllRoles(Pageable pageable) {
        return roleRepository.findAll(pageable);
    }
    
    @GetMapping("/roles/{roleId}")
    public Role getRoleById(@PathVariable(value = "roleId") Long roleId) {
        return roleRepository.findById(roleId)
                .orElseThrow(() -> new ResourceNotFoundException("RoleId " + roleId + " not found"));
    }

    @PostMapping("/roles")
    public Role createRole(@Valid @RequestBody Role role) {
        return roleRepository.save(role);
    }

    @PutMapping("/roles/{roleId}")
    public Role updateRole(@PathVariable Long roleId, @Valid @RequestBody Role roleRequest) {
        return roleRepository.findById(roleId).map(role -> {
            role.setName(roleRequest.getName());

            return roleRepository.save(role);
        }).orElseThrow(() -> new ResourceNotFoundException("RoleId " + roleId + " not found"));
    }


    @DeleteMapping("/roles/{roleId}")
    public ResponseEntity<?> deleteRole(@PathVariable Long roleId) {
        return roleRepository.findById(roleId).map(role -> {
            roleRepository.delete(role);
            return ResponseEntity.ok().build();
        }).orElseThrow(() -> new ResourceNotFoundException("RoleId " + roleId + " not found"));
    }

}