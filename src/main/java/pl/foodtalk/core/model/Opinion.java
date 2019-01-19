package pl.foodtalk.core.model;

import javax.persistence.*;
import java.math.BigInteger;

@Entity
@Table(name = "opinion")
public class Opinion {

    private Long id;
    private BigInteger star;
    private String name;
    private String description;
    private Restaurant restaurant;
    private User user;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public BigInteger getStar() { return star; }

    public void setStar(BigInteger star) { this.star = star; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "restaurant_id")
    public Restaurant getRestaurant() { return restaurant; }

    public void setRestaurant(Restaurant restaurant) { this.restaurant = restaurant; }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }
}