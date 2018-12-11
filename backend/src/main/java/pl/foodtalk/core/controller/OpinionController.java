package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Opinion;
import pl.foodtalk.core.repository.OpinionRepository;
import pl.foodtalk.core.repository.RestaurantRepository;
import pl.foodtalk.core.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class OpinionController {

    @Autowired
    private OpinionRepository opinionRepository;

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("restaurants/{restaurantId}/opinions")
    public Page<Opinion> getAllOpinionsByRestaurantId(@PathVariable(value = "restaurantId") Long restaurantId, Pageable pageable) {
        return opinionRepository.findByRestaurantId(restaurantId, pageable);
    }

    @GetMapping("users/{userId}/opinions")
    public Page<Opinion> getAllOpinionsByUserId(@PathVariable(value = "userId") Long userId, Pageable pageable) {
        return opinionRepository.findByUserId(userId, pageable);
    }
}
