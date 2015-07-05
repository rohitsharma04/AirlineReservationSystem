package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class FlightFareMap implements Serializable {

    @Id
    @GeneratedValue
    private int ffid;
    @ManyToOne
    @JoinColumn(name="flightNumber")
    private FlightMaster flightNumber;
    @ManyToOne
    @JoinColumn(name="classId")
    private ClassMaster classId;
    private int numberOfSeats;
    private int fare;

    public FlightFareMap() {
    }

    public int getFfid() {
        return ffid;
    }

    public FlightMaster getFlightNumber() {
        return flightNumber;
    }

    public ClassMaster getClassId() {
        return classId;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public int getFare() {
        return fare;
    }

    public void setFfid(int ffid) {
        this.ffid = ffid;
    }

    public void setFlightNumber(FlightMaster flightNumber) {
        this.flightNumber = flightNumber;
    }

    public void setClassId(ClassMaster classId) {
        this.classId = classId;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    public void setFare(int fare) {
        this.fare = fare;
    }

}
