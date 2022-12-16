package net.diana.taxi.model;

import javax.persistence.*;

@Entity
@Table(name = "city_taxi")
public class CityTaxi
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int cityTaxiId;

    @ManyToOne
    private User user;

    /*@Column(name = "user_id")
    private int userId;*/

    @Column(name = "city")
    private String city;

    public CityTaxi()
    {
    }

    public int getCityTaxiId() { return cityTaxiId; }

    public void setCityTaxiId(int cityTaxiId) { this.cityTaxiId = cityTaxiId; }

    /*public int getUserId() { return userId; }

    public void setUserId(int user_id) { this.userId = user_id; }*/

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCity() { return city; }

    public void setCity(String city) { this.city = city; }
}
