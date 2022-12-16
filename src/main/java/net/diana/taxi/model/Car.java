package net.diana.taxi.model;

import javax.persistence.*;

@Entity
@Table(name = "cars")
public class Car
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private  int carId;

    @Column(name = "name", length = 24)
    private String name;

    @Column(name = "model", length = 24)
    private String model;

    @Column(name = "year")
    private int year;

    public Car()
    {

    }

    public int getCarId() {
        return carId;
    }
    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

}