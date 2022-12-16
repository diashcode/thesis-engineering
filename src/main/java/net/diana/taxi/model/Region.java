package net.diana.taxi.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "regions")
public class Region
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int regionId;

    @Column(name = "name")
    private String name;

    @OneToMany(fetch = FetchType.EAGER)
    /*@JoinTable(name = "regions_cities",
            joinColumns = @JoinColumn(name = "region_id"),
            inverseJoinColumns = @JoinColumn(name = "city_id"))*/
    private Set<City> cities;

    public Region()
    {

    }

    public Region(String name)
    {
        this.name = name;
    }

    public int getRegionId() {
        return regionId;
    }
    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Set<City> getCities() {
        return cities;
    }
    public void setCities(Set<City> cities) {
        this.cities = cities;
    }
}
