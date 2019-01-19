package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Menu;
import pl.foodtalk.core.repository.MenuRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuRepository menuRepository;

    @Override
    public void save(Menu menu) {
        menuRepository.save(menu);
    }

    @Override
    public List<Menu> findByRestaurantName(String name) { return menuRepository.findByRestaurantName(name); }
    
    @Override
    public List<Menu> findAll() {
        return menuRepository.findAll();
    }
}
