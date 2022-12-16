package net.diana.taxi.model;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "username", nullable = false, unique = true)
    private String username;
    
    @Column(name = "email", nullable = false, unique = true)
    private String email;
    
    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "phone_number", unique = true)
    private String phoneNumber;

    @Column(name = "name")
    private String name;

    @Column(name = "birth_date")
    private Date birthDate;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "users_roles", joinColumns = @JoinColumn(name = "id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @Column(name = "car_id")
    private int carId;

    @OneToMany(mappedBy = "user")
    private List<Travel> travels;

    @OneToMany(mappedBy = "user")
    private List<CityTaxi> cityTaxis;

    public User() {
    }

    public User(User user)
    {
        this.email = user.getEmail();
        this.roles = user.getRoles();
        this.username = user.getUsername();
        this.id = user.getId();
        this.password = user.getPassword();
        this.phoneNumber = user.getPhoneNumber();
        this.name = user.getName();
        this.birthDate = user.getBirthDate();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoneNumber() { return phoneNumber; }

    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public User(List<CityTaxi> cityTaxis) {
        this.cityTaxis = cityTaxis;
    }

    public List<CityTaxi> getCityTaxis() {
        return cityTaxis;
    }

    public void setCityTaxis(List<CityTaxi> cityTaxis) {
        this.cityTaxis = cityTaxis;
    }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public Date getBirthDate() { return birthDate; }

    public void setBirthDate(Date birthDate) { this.birthDate = birthDate; }

    public int getCarId() { return carId; }

    public void setCarId(int carId) { this.carId = carId; }
}