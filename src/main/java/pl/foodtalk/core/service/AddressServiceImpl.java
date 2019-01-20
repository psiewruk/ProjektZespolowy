package pl.foodtalk.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.foodtalk.core.model.Address;
import pl.foodtalk.core.repository.AddressRepository;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressRepository addressRepository;

    @Override
    public void save(Address address) { addressRepository.save(address); }

    @Override
    public List<Address> findAll() { return addressRepository.findAll(); }

    @Override
    public Address findById(Long id) { return addressRepository.findById(id); }

    @Override
    public Long deleteById(Long id) { return addressRepository.deleteById(id); }
}
