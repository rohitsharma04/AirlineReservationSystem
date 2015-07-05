package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.AerodrumMaster;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AeroDrumMasterDataFilling {

    public static void main(String[] args) {
        int aerodrumId;
        String aerodrumName;
        String city;
        String state;
        Scanner in = new Scanner(System.in);
        Boolean flag = true;
        Session session = HibernateDAOLayer.getSession();
        while (flag) {
            try {
                System.out.println("Enter the Aerodrum details :");
                System.out.print("ID :");
                aerodrumId = Integer.parseInt(in.nextLine());
                System.out.print("Name :");
                aerodrumName = in.nextLine();
                System.out.print("State :");
                state = in.nextLine();
                System.out.print("City :");
                city = in.nextLine();

                AerodrumMaster aerodrum = new AerodrumMaster();
                aerodrum.setAerodrumId(aerodrumId);
                aerodrum.setAerodrumName(aerodrumName);
                aerodrum.setState(state);
                aerodrum.setCity(city);

                Transaction transaction = session.beginTransaction();
                session.save(aerodrum);
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
