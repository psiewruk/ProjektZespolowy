package pl.foodtalk.core.model;

import javax.persistence.*;

@Entity
@Table(name = "dish")
public class Dish {
    private Long id;
    private Float price;
    private String name;
    private String description;
    private Category category;
    private Menu menu;

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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="category_id")
    public Category getCategory() {
    	return category;
    }
    
    public void setCategory(Category category) {
    	this.category = category;
    }
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="menu_id")
    public Menu getMenu() {
    	return menu;
    }
    
    public void setMenu(Menu menu) {
    	this.menu = menu;
    }
}
