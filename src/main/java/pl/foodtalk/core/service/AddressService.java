package pl.foodtalk.core.service;

import pl.foodtalk.core.model.Address;

import java.util.List;

public interface AddressService {
    void save(Address address);
    List<Address> findAll();
    Address findById(Long id);
    Long deleteById(Long id);
}
