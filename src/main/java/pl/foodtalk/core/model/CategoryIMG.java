package pl.foodtalk.core.model;

import javax.persistence.*;

@Entity
@Table(name = "categoryIMG")
public class CategoryIMG {
    private Long id;
    private String name;
    private byte[] img;
    private String encoded;
    

    public CategoryIMG() { super(); }

    public CategoryIMG(String name, byte[] img) {
        super();
        this.name = name;
        this.img = img;
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

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}
	
	@Transient
	public String getEncoded() {
		return encoded;
	}

	public void setEncoded(String encoded) {
		this.encoded = encoded;
	}
}
