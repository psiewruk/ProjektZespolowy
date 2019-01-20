package pl.foodtalk.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.foodtalk.core.model.Application;
import pl.foodtalk.core.repository.ApplicationRepository;

import java.util.List;

@Service
public class ApplicationServiceImpl implements ApplicationService {
    @Autowired
    private ApplicationRepository applicationRepository;

    @Override
    public void save(Application application) { 
    	applicationRepository.save(application); }

    @Override
    public List<Application> findAll() { 
    	return applicationRepository.findAll(); }

    @Override
    public Application findById(Long id) { 
    	return applicationRepository.findById(id); }

    @Override
    public Long deleteById(Long id) { 
    	return applicationRepository.deleteById(id); }
}
