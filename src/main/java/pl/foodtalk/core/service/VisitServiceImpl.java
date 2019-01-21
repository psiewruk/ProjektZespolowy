package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Visit;
import pl.foodtalk.core.repository.VisitRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VisitServiceImpl implements VisitService {
    @Autowired
    private VisitRepository visitRepository;

    @Override
    public void save(Visit visit) { visitRepository.save(visit); }

    @Override
    public List<Visit> findByRestaurantName(String name) { return visitRepository.findByRestaurantName(name); }

    @Override
    public List<Visit> findByUserId(Long id) { return visitRepository.findByUserId(id); }

    @Override
    public List<Visit> findAll() { return visitRepository.findAll(); }

    @Override
    public Long deleteById(Long id) { return visitRepository.deleteById(id); }
}
