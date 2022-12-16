package net.diana.taxi.model;

import javax.persistence.*;

@Entity
@Table(name = "travel_books")
public class TravelBook
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "travel_id")
    private int travelId;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "name")
    private String name;

    @Column(name = "phone_number")
    private int phoneNumber;

    @Column(name = "seats_number")
    private  int numberOfSeats;

    @Column(name = "message")
    private String message;

    @Column(name = "is_approved")
    private Boolean isApproved;

    @Column(name = "is_rejected")
    private Boolean isRejected;

    /*@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "travel_travelBook", joinColumns = @JoinColumn(name = "id"), inverseJoinColumns = @JoinColumn(name = "travel_id"))
    private Travel travel;*/

    public TravelBook()
    {

    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getNumberOfSeats() { return numberOfSeats; }
    public void setNumberOfSeats(int numberOfSeats) { this.numberOfSeats = numberOfSeats; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(int phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Boolean getApproved() { return isApproved; }
    public void setApproved(Boolean approved) { isApproved = approved; }

    /*public Travel getTravel() { return travel; }

    public void setTravel(Travel travel) {this.travel = travel; }*/

    public int getTravelId() { return travelId; }

    public void setTravelId(int travelId) { this.travelId = travelId; }

    public Boolean getRejected() { return isRejected; }

    public void setRejected(Boolean rejected) { isRejected = rejected; }
}
