package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CustomerDetails implements Serializable {
    @Id
    @GeneratedValue
    private int pnrNumber;
    private String passportId;
    private String customerName;
    private int age;
    private String gender;
    private String city;
    private String emailId;
    private String contactNumber;
    @ManyToOne
    @JoinColumn(name="classId")
    private ClassMaster classId;
    @ManyToOne
    @JoinColumn(name="flightNumber")
    private FlightMaster flightNumber;

    public CustomerDetails() {
    }

    public CustomerDetails(int pnrNumber, String passportId, String customerName, int age, String gender, String city, String emailId, String contactNumber, ClassMaster classId, FlightMaster flightNumber) {
        this.pnrNumber = pnrNumber;
        this.passportId = passportId;
        this.customerName = customerName;
        this.age = age;
        this.gender = gender;
        this.city = city;
        this.emailId = emailId;
        this.contactNumber = contactNumber;
        this.classId = classId;
        this.flightNumber = flightNumber;
    }

    public int getPnrNumber() {
        return pnrNumber;
    }

    public String getPassportId() {
        return passportId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getCity() {
        return city;
    }

    public String getEmailId() {
        return emailId;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public ClassMaster getClassId() {
        return classId;
    }

    public FlightMaster getFlightNumber() {
        return flightNumber;
    }

    public void setPnrNumber(int pnrNumber) {
        this.pnrNumber = pnrNumber;
    }

    public void setPassportId(String passportId) {
        this.passportId = passportId;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public void setClassId(ClassMaster classId) {
        this.classId = classId;
    }

    public void setFlightNumber(FlightMaster flightNumber) {
        this.flightNumber = flightNumber;
    }
    
}
