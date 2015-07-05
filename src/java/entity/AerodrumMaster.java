/*
 AerodrumName field contain the name of the Aerodrum from where
 the flight will be operate, like Indra Gandhi Internation Airport,Delhi etc
 */
package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class AerodrumMaster implements Serializable {

    @Id
    @GeneratedValue
    private int aerodrumId;
    private String aerodrumName;
    private String city;
    private String state;
    @OneToMany(targetEntity = FlightMaster.class, mappedBy = "sourceId")
    private List<FlightMaster> sources;
    @OneToMany(targetEntity = FlightMaster.class, mappedBy = "destinationId")
    private List<FlightMaster> destinations;

    public AerodrumMaster() {
    }

    public int getAerodrumId() {
        return aerodrumId;
    }

    public String getAerodrumName() {
        return aerodrumName;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public void setAerodrumId(int aerodrumId) {
        this.aerodrumId = aerodrumId;
    }

    public void setAerodrumName(String aerodrumName) {
        this.aerodrumName = aerodrumName;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<FlightMaster> getSources() {
        return sources;
    }

    public List<FlightMaster> getDestinations() {
        return destinations;
    }

    public void setSources(List<FlightMaster> sources) {
        this.sources = sources;
    }

    public void setDestinations(List<FlightMaster> destinations) {
        this.destinations = destinations;
    }

}
