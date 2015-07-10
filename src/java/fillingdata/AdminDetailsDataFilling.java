/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fillingdata;

import daolayer.HibernateDAOLayer;
import encryption.Encrypt;
import entity.AdminDetails;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rohit
 */
public class AdminDetailsDataFilling {

    public static void main(String[] args) {
        String adminName;
        String password;
        Scanner in = new Scanner(System.in);
        Boolean flag = true;
        Session session = HibernateDAOLayer.getSession();
        while (flag) {
            try {
                System.out.println("Enter the Admin details :");
                System.out.print("Name :");
                adminName = in.nextLine();
                System.out.print("Password :");
                password = in.nextLine();
                AdminDetails admin = new AdminDetails();
                admin.setAdminName(adminName);
                admin.setPassword(Encrypt.encrypt(password));

                Transaction transaction = session.beginTransaction();
                session.save(admin);
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
