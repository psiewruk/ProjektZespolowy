package pl.foodtalk.account.service;

import pl.foodtalk.account.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
