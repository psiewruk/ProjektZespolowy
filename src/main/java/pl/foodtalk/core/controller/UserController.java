package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.User;
import pl.foodtalk.core.repository.UserRepository;
import pl.foodtalk.core.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/roles/{roleId}/users")
    public Page<User> getAllUsersByRoleId(@PathVariable (value = "roleId") Long roleId,
                                                Pageable pageable) {
        return userRepository.findByRoleId(roleId, pageable);
    }
    
    @GetMapping("/users/{userId}")
    public User getUserById(@PathVariable(value = "userId") Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("UserId " + userId + " not found"));
    }
    
    @GetMapping("/users")
    public Page<User> getAllUsers(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @PostMapping("/roles/{roleId}/users")
    public User createUser(@PathVariable (value = "roleId") Long roleId,
                                 @Valid @RequestBody User user) {
        return roleRepository.findById(roleId).map(role -> {
            user.setRole(role);
            return userRepository.save(user);
        }).orElseThrow(() -> new ResourceNotFoundException("RoleId " + roleId + " not found"));
    }

    @PutMapping("/roles/{roleId}/users/{userId}")
    public User updateUser(@PathVariable (value = "roleId") Long roleId,
                                 @PathVariable (value = "userId") Long userId,
                                 @Valid @RequestBody User userRequest) {
        if(!roleRepository.existsById(roleId)) {
            throw new ResourceNotFoundException("RoleId " + roleId + " not found");
        }

        return userRepository.findById(userId).map(user -> {
            user.setLogin(userRequest.getLogin());
            user.setPassword(userRequest.getPassword());
            user.setEmail(userRequest.getEmail());
            return userRepository.save(user);
        }).orElseThrow(() -> new ResourceNotFoundException("UserId " + userId + " not found"));
    }
    
    @PutMapping("/users/{userId}")
    public User updateUser(@PathVariable Long userId, @Valid @RequestBody User userRequest) {
        return userRepository.findById(userId).map(user -> {
        	user.setLogin(userRequest.getLogin());
            user.setPassword(userRequest.getPassword());
            user.setEmail(userRequest.getEmail());

            return userRepository.save(user);
        }).orElseThrow(() -> new ResourceNotFoundException("UserId " + userId + " not found"));
    }

    @DeleteMapping("/roles/{roleId}/users/{userId}")
    public ResponseEntity<?> deleteUser(@PathVariable (value = "roleId") Long roleId,
                              @PathVariable (value = "userId") Long userId) {
        if(!roleRepository.existsById(roleId)) {
            throw new ResourceNotFoundException("RoleId " + roleId + " not found");
        }

        return userRepository.findById(userId).map(user -> {
             userRepository.delete(user);
             return ResponseEntity.ok().build();
        }).orElseThrow(() -> new ResourceNotFoundException("UserId " + userId + " not found"));
    }
}
