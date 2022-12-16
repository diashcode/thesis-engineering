package net.diana.taxi.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "travels")
public class Travel
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int travelId;

    @ManyToOne
    private User user;

    @Column(name = "pickup")
    private String pickup;

    @Column(name = "destination")
    private String destination;

    @Column(name = "travel_date")
    private Date travelDate;

    @Column(name = "price")
    private int price;

    @Column(name = "seats")
    private int seats;

    @Column(name = "booked_seats")
    private int bookedSeats;

    @Column(name = "is_canceled")
    private int isCanceled;

    public Travel()
    {

    }

    public int getTravelId() {
        return travelId;
    }

    public void setTravelId(int travelId) {
        this.travelId = travelId;
    }

    public Travel(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPickup() {
        return pickup;
    }

    public void setPickup(String pickup) {
        this.pickup = pickup;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(Date travelDate) {
        this.travelDate = travelDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public int getBookedSeats() {
        return bookedSeats;
    }

    public void setBookedSeats(int bookedSeats) {
        this.bookedSeats = bookedSeats;
    }

    public int getIsCanceled() { return isCanceled; }

    public void setIsCanceled(int isCanceled) { this.isCanceled = isCanceled; }
}

