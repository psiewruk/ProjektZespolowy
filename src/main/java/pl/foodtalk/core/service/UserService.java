package pl.foodtalk.core.service;

import pl.foodtalk.core.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
