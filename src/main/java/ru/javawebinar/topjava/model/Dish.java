package ru.javawebinar.topjava.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "dish")
public class Dish extends NamedBaseEntity {

    @NotNull
    @Column(name = "price", nullable = false)
    private Float price;

    @NotNull
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "restaurant_id", nullable = false)
    private Restaurant restaurant;

    @Column(name = "day", nullable = false)
    @NotNull
    private LocalDate date;

    public Dish() {
    }

    public Dish(Long id, String name, float price, Restaurant restaurant, LocalDate date) {
        super(id, name);
        this.price = price;
        this.restaurant = restaurant;
        this.date = date;
    }

    public Dish(String name, float price, Restaurant restaurant, LocalDate date) {
        setName(name);
        this.price = price;
        this.restaurant = restaurant;
        this.date = date;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Dish{" +
                "name=" + getName() +
                ", price=" + getPrice() +
                ", date=" + getDate() +
                "} " + super.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        Dish dish = (Dish) o;

        return price != null ? price.equals(dish.price) : dish.price == null &&
                (date != null ? date.equals(dish.date) : dish.date == null);

    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
