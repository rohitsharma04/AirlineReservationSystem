/*
 CompanyName field contain the name of the company which flight is
 operated, like JetAirway, KingFisher etc
 */
package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class CompanyMaster implements Serializable {

    @Id
    private int companyId;
    private String companyName;
    @OneToMany(targetEntity = FlightMaster.class, mappedBy = "companyId")
    private List<FlightMaster> flights;

    public CompanyMaster() {
    }

    public void setFlights(List<FlightMaster> flights) {
        this.flights = flights;
    }

    public int getCompanyId() {
        return companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public List<FlightMaster> getFlights() {
        return flights;
    }

}
