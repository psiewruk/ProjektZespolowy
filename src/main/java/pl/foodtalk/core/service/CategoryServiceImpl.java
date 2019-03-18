package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Category;
import pl.foodtalk.core.model.CategoryIMG;
import pl.foodtalk.core.repository.CategoryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public void save(Category category) {
        categoryRepository.save(category);
    }
    
    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Long deleteById(Long id) { 
    	return categoryRepository.deleteById(id); }

	@Override
	public Category findByName(String name) {
		return categoryRepository.findByName(name);
	}

	@Override
	public Category findById(Long id) {
		return categoryRepository.findById(id);
	}

}
