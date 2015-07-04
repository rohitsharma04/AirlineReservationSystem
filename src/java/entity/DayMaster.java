/*
 DayName field contain the name of the weekdays .
 */
package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class DayMaster implements Serializable {

    @Id
    private int dayId;
    private String dayName;

    @ManyToMany
    @JoinTable(name = "FlightDayMap", joinColumns = {
        @JoinColumn(name = "dayId")}, inverseJoinColumns = {
        @JoinColumn(name = "flightNumber")})
    private List<FlightMaster> flights;

    public DayMaster() {
    }

    public int getDayId() {
        return dayId;
    }

    public String getDayName() {
        return dayName;
    }

    public void setDayId(int dayId) {
        this.dayId = dayId;
    }

    public void setDayName(String dayName) {
        this.dayName = dayName;
    }

    public List<FlightMaster> getFlights() {
        return flights;
    }

    public void setFlights(List<FlightMaster> flights) {
        this.flights = flights;
    }

}
