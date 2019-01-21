package pl.foodtalk.core.service;

import pl.foodtalk.core.model.User;

import java.util.List;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
    User findById(Long id);
    List<User> findAll();
    Long deleteById(Long id);
}
