package pl.foodtalk.core.service;

import java.util.List;

import pl.foodtalk.core.model.Opinion;

public interface OpinionService {
    void save(Opinion opinion);
    List<Opinion> findByRestaurantName(String name);
    List<Opinion> findByUserId(Long id);
    List<Opinion> findAll();
    Opinion findById(Long id);
    Long deleteById(Long id);
}
