package fillingdata;

import java.sql.Date;

public class RandomTest {

    public static void main(String[] args) {
           Date d = Date.valueOf("1992-11-03");
           Date d2 = Date.valueOf("1970-01-01");
           System.out.println("Date :"+(new java.util.Date()).getYear());
//           Date d1 = Date.valueOf((new java.util.Date()).toString());
//         System.out.println("Age :"+(d1.getYear() - d.getYear()));
//        Session s = HibernateDAOLayer.getSession();
//        Criteria c = s.createCriteria(CompanyMaster.class);
//        c.add(Restrictions.eq("companyId", 1));
//        List<CompanyMaster> list = c.list();
//        CompanyMaster cm = list.get(0);
//        System.out.println("Company id :" + cm.getCompanyId());
//        System.out.println("Company name :" + cm.getCompanyName());
//        for (FlightMaster fm : cm.getFlights()) {
//            System.out.println("flights :" + fm.getFlightName());
//        }
//        HibernateDAOLayer.stopConnectionProvider();
    }
}
