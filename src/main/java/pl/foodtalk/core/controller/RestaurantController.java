package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Restaurant;
import pl.foodtalk.core.model.User;
import pl.foodtalk.core.repository.RestaurantRepository;
import pl.foodtalk.core.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class RestaurantController {

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private AddressRepository addressRepository;
    
    @GetMapping("/addresses/{addressId}/restaurants")
    public Page<Restaurant> getAllRestaurantsByAddressId(@PathVariable (value = "addressId") Long addressId, 
    		Pageable pageable) {
    	return restaurantRepository.findByAddressId(addressId, pageable);
    }
    
    @GetMapping("/restaurants/{restaurantId}")
    public Restaurant getRestaurantById(@PathVariable(value = "restaurantId") Long restaurantId) {
    	return restaurantRepository.findById(restaurantId)
    			.orElseThrow(() -> new ResourceNotFoundException("RestaurandId" + restaurantId + "not found"));
    }
    
    @GetMapping("/restaurants")
    public Page<Restaurant> getAllRestaurants(Pageable pageable) {
    	return restaurantRepository.findAll(pageable);
    }
    
    @PostMapping("/address/{addressId}/restaurants")
    public Restaurant createRestaurant(@PathVariable (value = "addressId") Long addressId,
                                 @Valid @RequestBody Restaurant restaurant) {
        return addressRepository.findById(addressId).map(address -> {
            restaurant.setAddress(address);
            return restaurantRepository.save(restaurant);
        }).orElseThrow(() -> new ResourceNotFoundException("AddressId " + addressId + " not found"));
    }
    
    @PutMapping("/addresses/{addressId}/restaurants/{restaurantId}")
    public Restaurant updateRestaurant(@PathVariable (value = "addressId") Long addressId,
                                 @PathVariable (value = "restaurantId") Long restaurantId,
                                 @Valid @RequestBody Restaurant restaurantRequest) {
        if(!addressRepository.existsById(addressId)) {
            throw new ResourceNotFoundException("AddressId " + addressId + " not found");
        }

        return restaurantRepository.findById(restaurantId).map(restaurant -> {
        	restaurant.setName(restaurantRequest.getName());
        	
            return restaurantRepository.save(restaurant);
        }).orElseThrow(() -> new ResourceNotFoundException("RestaurantId " + restaurantId + " not found"));
    }
    
    @DeleteMapping("/addresses/{addressId}/restaurants/{restaurantId}")
    public ResponseEntity<?> deleteRestaurant(@PathVariable (value = "addressId") Long addressId,
                              @PathVariable (value = "restaurantId") Long restaurantId) {
        if(!addressRepository.existsById(addressId)) {
            throw new ResourceNotFoundException("AddressId " + addressId + " not found");
        }

        return restaurantRepository.findById(restaurantId).map(restaurant -> {
             restaurantRepository.delete(restaurant);
             return ResponseEntity.ok().build();
        }).orElseThrow(() -> new ResourceNotFoundException("RestaurantId " + restaurantId + " not found"));
    }
}