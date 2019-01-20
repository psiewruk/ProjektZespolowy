package pl.foodtalk.core.model;

import javax.persistence.*;

@Entity
@Table(name = "category")
public class Category {
    private Long id;
    private String name;
    private byte[] image;

    public Category() { super(); }

    public Category(String name, byte[] image) {
        super();
        this.name = name;
        this.image = image;
    }
    
    public Category(String name) {
        super();
        this.name = name;
    }

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

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
}
