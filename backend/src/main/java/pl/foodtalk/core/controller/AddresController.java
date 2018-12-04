package pl.foodtalk.core.controller;

import pl.foodtalk.core.exception.ResourceNotFoundException;
import pl.foodtalk.core.model.Address;
import pl.foodtalk.core.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

@RestController
public class AddresController {

	@Autowired
    AddressRepository addressRepository;

    @GetMapping("/addresses")
    public Page<Address> getAllAdresses(Pageable pageable) {
        return addressRepository.findAll(pageable);
    }
    
    @GetMapping("/addresses/{addressId}")
    public Address getAddressById(@PathVariable(value = "addressId") Long addressId) {
        return addressRepository.findById(addressId)
                .orElseThrow(() -> new ResourceNotFoundException("AddressId " + addressId + " not found"));
    }

    @PostMapping("/addresses")
    public Address createAddress(@Valid @RequestBody Address address) {
        return addressRepository.save(address);
    }

    @PutMapping("/addresses/{addressId}")
    public Address updateAddress(@PathVariable Long addressId, @Valid @RequestBody Address addressRequest) {
        return addressRepository.findById(addressId).map(address -> {
        	address.setStreet(addressRequest.getStreet());
        	address.setNumber(addressRequest.getNumber());
        	address.setPostCode(addressRequest.getPostCode());
        	address.setCity(addressRequest.getCity());
        	
            return addressRepository.save(address);
        }).orElseThrow(() -> new ResourceNotFoundException("AddressId " + addressId + " not found"));
    }


    @DeleteMapping("/addresses/{addressId}")
    public ResponseEntity<?> deleteAddress(@PathVariable Long addressId) {
        return addressRepository.findById(addressId).map(address -> {
            addressRepository.delete(address);
            return ResponseEntity.ok().build();
        }).orElseThrow(() -> new ResourceNotFoundException("AddressId " + addressId + " not found"));
    }
}
