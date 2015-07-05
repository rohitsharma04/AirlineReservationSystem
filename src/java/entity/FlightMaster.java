package entity;

import java.io.Serializable;
import java.sql.Time;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class FlightMaster implements Serializable {

    @Id
    private int flightNumber;
    private String flightName;

    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyMaster companyId;

    @ManyToOne
    @JoinColumn(name = "sourceId")
    private AerodrumMaster sourceId;

    @ManyToOne
    @JoinColumn(name = "destinationId")
    private AerodrumMaster destinationId;
    private Time departureTime;
    private Time arrivalTime;

    @OneToMany
    @JoinColumn(name = "fares")
    private List<FlightFareMap> fare;

    @OneToMany(targetEntity = CustomerDetails.class, mappedBy = "flightNumber")
    private List<CustomerDetails> customers;

    @ManyToMany
    @JoinTable(name = "FlightDayMap", joinColumns = {
        @JoinColumn(name = "flightNumber")}, inverseJoinColumns = {
        @JoinColumn(name = "dayId")})
    private List<DayMaster> days;

    public FlightMaster() {
    }

    public int getFlightNumber() {
        return flightNumber;
    }

    public String getFlightName() {
        return flightName;
    }

    public CompanyMaster getCompanyId() {
        return companyId;
    }

    public AerodrumMaster getSourceId() {
        return sourceId;
    }

    public AerodrumMaster getDestinationId() {
        return destinationId;
    }

    public Time getDepartureTime() {
        return departureTime;
    }

    public Time getArrivalTime() {
        return arrivalTime;
    }

    public List<FlightFareMap> getFare() {
        return fare;
    }

    public List<CustomerDetails> getCustomers() {
        return customers;
    }

    public List<DayMaster> getDays() {
        return days;
    }

    public void setFlightNumber(int flightNumber) {
        this.flightNumber = flightNumber;
    }

    public void setFlightName(String flightName) {
        this.flightName = flightName;
    }

    public void setCompanyId(CompanyMaster companyId) {
        this.companyId = companyId;
    }

    public void setSourceId(AerodrumMaster sourceId) {
        this.sourceId = sourceId;
    }

    public void setDestinationId(AerodrumMaster destinationId) {
        this.destinationId = destinationId;
    }

    public void setDepartureTime(Time departureTime) {
        this.departureTime = departureTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public void setFare(List<FlightFareMap> fare) {
        this.fare = fare;
    }

    public void setCustomers(List<CustomerDetails> customers) {
        this.customers = customers;
    }

    public void setDays(List<DayMaster> days) {
        this.days = days;
    }


}
