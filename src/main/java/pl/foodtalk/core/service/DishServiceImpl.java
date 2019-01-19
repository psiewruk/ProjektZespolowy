package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Dish;
import pl.foodtalk.core.repository.DishRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DishServiceImpl implements DishService {
    @Autowired
    private DishRepository dishRepository;

    @Override
    public List<Dish> findByCategoryName(String name) {
        return dishRepository.findByCategoryName(name);
    }

    @Override
    public List<Dish> findByMenuId(Long id) {
        return dishRepository.findByMenuId(id);
    }

    @Override
    public List<Dish> findAll() {
        return dishRepository.findAll();
    }
    
    @Override
    public void save(Dish dish) {
        dishRepository.save(dish);
    }
    
    @Override
    public Dish findById(Long id) {
        return dishRepository.findById(id);
    }
}

