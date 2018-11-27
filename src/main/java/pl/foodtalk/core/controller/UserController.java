package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.User;
import pl.foodtalk.core.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    UserRepository userRepository;

    // Get All Notes
    @GetMapping("/users")
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    // Create a new Note
    @PostMapping("/users")
    public User createUser(@Valid @RequestBody User user) {
        return userRepository.save(user);
    }
    // Get a Single Note
    @GetMapping("/users/{id}")
    public User getUserById(@PathVariable(value = "id") Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
    }
    // Update a Note
    @PutMapping("/users/{id}")
    public User updateUser(@PathVariable(value = "id") Long userId,
                                            @Valid @RequestBody User userDetails) {

    	User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));

    	user.setLogin(userDetails.getLogin());
    	user.setPassword(userDetails.getPassword());
    	user.setEmail(userDetails.getEmail());
    	user.setRole_id(userDetails.getRole_id());

        User updatedUser = userRepository.save(user);
        return updatedUser;
    }
    
    // Delete a User
    @DeleteMapping("/users/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable(value = "id") Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));

        userRepository.delete(user);

        return ResponseEntity.ok().build();
    }
}
