package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
    List<User> findAll();
}
