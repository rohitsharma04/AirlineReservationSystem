package tableCreator;

import daolayer.HibernateDAOLayer;
import entity.ClassMaster;
import entity.CustomerDetails;
import entity.DayMaster;
import entity.FlightMaster;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class InitializeDataBase {
    
    public static void intializeFlightMaster(){
        FlightMaster flight = new FlightMaster();
        flight.setFlightNumber(1000);
        Session session = HibernateDAOLayer.getSession();
        Transaction transaction = session.beginTransaction();
        session.save(flight);
        transaction.commit();
        transaction = session.beginTransaction();
        session.delete(flight);
        transaction.commit();
        session.close();
    }
    public static void intializeCustomerDetails(){
        CustomerDetails cd = new CustomerDetails();
        cd.setPnrNumber(100000);
        Session session = HibernateDAOLayer.getSession();
        Transaction transaction = session.beginTransaction();
        session.save(cd);
        transaction.commit();
        transaction = session.beginTransaction();
        session.delete(cd);
        transaction.commit();
        session.close();
    }

    public static void initializeDayMaster() {
        DayMaster d1 = new DayMaster();
        d1.setDayId(1);
        d1.setDayName("Sunday");

        DayMaster d2 = new DayMaster();
        d2.setDayId(2);
        d2.setDayName("Monday");

        DayMaster d3 = new DayMaster();
        d3.setDayId(3);
        d3.setDayName("Tuesday");

        DayMaster d4 = new DayMaster();
        d4.setDayId(4);
        d4.setDayName("Wednesday");

        DayMaster d5 = new DayMaster();
        d5.setDayId(5);
        d5.setDayName("Thursday");

        DayMaster d6 = new DayMaster();
        d6.setDayId(6);
        d6.setDayName("Friday");

        DayMaster d7 = new DayMaster();
        d7.setDayId(7);
        d7.setDayName("Saturday");

        Session session = HibernateDAOLayer.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(d1);
        session.save(d2);
        session.save(d3);
        session.save(d4);
        session.save(d5);
        session.save(d6);
        session.save(d7);

        transaction.commit();

    }

    public static void intializeClassMaster() {
        //Intializing ClassMaster
        ClassMaster c1 = new ClassMaster();
        c1.setClassId(1);
        c1.setClassName("Business");

        ClassMaster c2 = new ClassMaster();
        c2.setClassId(2);
        c2.setClassName("First");

        ClassMaster c3 = new ClassMaster();
        c3.setClassId(3);
        c3.setClassName("Economic");

        Session session = HibernateDAOLayer.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(c1);
        session.save(c2);
        session.save(c3);

        transaction.commit();
    }
}
