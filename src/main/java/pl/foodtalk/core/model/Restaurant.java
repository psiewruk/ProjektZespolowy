package pl.foodtalk.core.model;

import javax.persistence.*;

@Entity
@Table(name = "restaurant")
public class Restaurant {
    private Long id;
    private String name;
    private Address address;
    private String description;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="address_id")
    public Address getAddress() {
    	return address;
    }
    
    public void setAddress(Address address) {
    	this.address = address;
    }

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
