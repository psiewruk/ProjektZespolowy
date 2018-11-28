package pl.foodtalk.core.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@SuppressWarnings("serial")
@Entity
@Table(name = "address")
public class Address extends AuditModel{
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Long id;
	 
	 @NotNull
	 @Lob
	 private String street;
	    
	 @NotNull
	 @Lob
	 private int number;
	    
	 @NotNull
	 @Lob
	 private String postCode;
	 
	 @NotNull
	 @Lob
	 private String city;

	 public Address(Long id, @NotNull String street, @NotNull int number, @NotNull String postCode, @NotNull String city) {
		super();
		this.id = id;
		this.street = street;
		this.number = number;
		this.postCode = postCode;
		this.city = city;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
