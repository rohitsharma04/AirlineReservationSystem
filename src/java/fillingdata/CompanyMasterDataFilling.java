package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.CompanyMaster;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CompanyMasterDataFilling {
    public static void main(String[] args) {
        int companyId;
        String companyName;
        Scanner in = new Scanner(System.in);
        Boolean flag = true;
        Session session = HibernateDAOLayer.getSession();
        while (flag) {
            try {
                System.out.println("Enter the Company details :");
                //System.out.print("ID :");
                //companyId = Integer.parseInt(in.nextLine());
                System.out.print("Name :");
                companyName = in.nextLine();

                CompanyMaster company = new CompanyMaster();
                //company.setCompanyId(companyId);
                company.setCompanyName(companyName);
                
                Transaction transaction = session.beginTransaction();
                session.save(company);
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
