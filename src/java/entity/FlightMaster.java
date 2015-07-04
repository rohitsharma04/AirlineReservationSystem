package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class FlightMaster implements Serializable {

    @Id
    private int flightNumber;
    private String flightName;

    @ManyToOne
    @JoinColumn(name="companyId")
    private CompanyMaster companyId;
    @ManyToOne
    @JoinColumn(name="sourceId")
    private AerodrumMaster sourceId;
    @ManyToOne
    @JoinColumn(name="destinationId")
    private AerodrumMaster destinationId;
    private long departureTime;
    private long arrivalTime;
    @OneToOne
    @JoinColumn(name="fare")
    private FlightFareMap fare;
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

    public long getDepartureTime() {
        return departureTime;
    }

    public long getArrivalTime() {
        return arrivalTime;
    }

    public FlightFareMap getFare() {
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

    public void setDepartureTime(long departureTime) {
        this.departureTime = departureTime;
    }

    public void setArrivalTime(long arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public void setFare(FlightFareMap fare) {
        this.fare = fare;
    }

    public void setCustomers(List<CustomerDetails> customers) {
        this.customers = customers;
    }

    public void setDays(List<DayMaster> days) {
        this.days = days;
    }

}
