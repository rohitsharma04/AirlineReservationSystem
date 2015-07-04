/* 
 ClassName may be business, economic or first class. 
 */
package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class ClassMaster implements Serializable {

    @Id
    private int classId;
    private String className;
    @OneToMany(targetEntity = FlightFareMap.class, mappedBy = "classId")
    private List<FlightFareMap> fares;

    @OneToMany(targetEntity = CustomerDetails.class, mappedBy = "classId")
    private List<CustomerDetails> customers;

    public ClassMaster() {
    }

    public int getClassId() {
        return classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public List<FlightFareMap> getFares() {
        return fares;
    }

    public List<CustomerDetails> getCustomers() {
        return customers;
    }

    public void setFares(List<FlightFareMap> fares) {
        this.fares = fares;
    }

    public void setCustomers(List<CustomerDetails> customers) {
        this.customers = customers;
    }

}
