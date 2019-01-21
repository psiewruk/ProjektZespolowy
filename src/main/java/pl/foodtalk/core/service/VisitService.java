package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Visit;

public interface VisitService {
    void save(Visit visit);
    List<Visit> findByRestaurantName(String name);
    List<Visit> findByUserId(Long id);
    List<Visit> findAll();
    Long deleteById(Long id);
}
