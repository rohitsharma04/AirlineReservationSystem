package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.AerodrumMaster;
import entity.ClassMaster;
import entity.FlightFareMap;
import entity.FlightMaster;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class FlightFareMapDataFilling {

    public static void main(String[] args) {
        FlightMaster flightNumber = new FlightMaster();
        ClassMaster classId = new ClassMaster();
        int numberOfSeats;
        int fare;
        Scanner in = new Scanner(System.in);
        Boolean flag = true;
        Session session = HibernateDAOLayer.getSession();
        while (flag) {
            try {
                System.out.println("Enter the Fare details :");
                System.out.print("Flight Number :");
                flightNumber.setFlightNumber(Integer.parseInt(in.nextLine()));
                System.out.print("Class Id :");
                classId.setClassId(Integer.parseInt(in.nextLine()));
                System.out.print("Number of Seats :");
                numberOfSeats = Integer.parseInt(in.nextLine());
                System.out.print("Fare amount :");
                fare = Integer.parseInt(in.nextLine());

                FlightFareMap ffm = new FlightFareMap();
                ffm.setFlightNumber(flightNumber);
                ffm.setNumberOfSeats(numberOfSeats);
                ffm.setFare(fare);

                Transaction transaction = session.beginTransaction();
                session.save(ffm);
                transaction.commit();

                System.out.print("Do you want to continue(y/n) :");
                if (in.nextLine().equalsIgnoreCase("n")) {
                    flag = false;
                }
            } catch (Exception e) {
                System.err.println("Error caught :" + e.getMessage());
            }
        }
        HibernateDAOLayer.stopConnectionProvider();
    }
}
