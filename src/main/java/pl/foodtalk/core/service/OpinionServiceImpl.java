package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Opinion;
import pl.foodtalk.core.repository.OpinionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OpinionServiceImpl implements OpinionService {
    @Autowired
    private OpinionRepository opinionRepository;

    @Override
    public void save(Opinion opinion) { opinionRepository.save(opinion); }

    @Override
    public List<Opinion> findByRestaurantName(String name) { return opinionRepository.findByRestaurantName(name); }

    @Override
    public List<Opinion> findByUserId(Long id) { return opinionRepository.findByUserId(id); }

    @Override
    public List<Opinion> findAll() { return opinionRepository.findAll(); }
}
