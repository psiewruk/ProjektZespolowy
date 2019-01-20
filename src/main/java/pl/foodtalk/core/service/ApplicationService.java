package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Application;

import java.util.List;

public interface ApplicationService {
    void save(Application application);
    List<Application> findAll();
    Application findById(Long id);
    Long deleteById(Long id);
}
