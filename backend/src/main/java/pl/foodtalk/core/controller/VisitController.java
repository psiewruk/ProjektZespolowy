package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Opinion;
import pl.foodtalk.core.model.Visit;
import pl.foodtalk.core.repository.VisitRepository;
import pl.foodtalk.core.repository.UserRepository;
import pl.foodtalk.core.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class VisitController {

    @Autowired
    private VisitRepository visitRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RestaurantRepository restaurantRepository;

    @GetMapping("users/{userId}/visits")
    public Page<Visit> getAllVisitsByUserId(@PathVariable(value = "userId") Long userId, Pageable pageable) {
        return visitRepository.findByUserId(userId, pageable);
    }

    @GetMapping("restaurants/{restaurantId}/visits")
    public Page<Visit> getAllOpinionsByRestaurantId(@PathVariable(value = "restaurantId") Long restaurantId, Pageable pageable) {
        return visitRepository.findByRestaurantId(restaurantId, pageable);
    }

    @GetMapping("/visits")
    public Page<Visit> getAllOpinions(Pageable pageable) {
        return visitRepository.findAll(pageable);
    }
}