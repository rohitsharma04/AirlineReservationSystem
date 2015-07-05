package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.CompanyMaster;
import entity.FlightMaster;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class RandomTest {

    public static void main(String[] args) {
        Session s = HibernateDAOLayer.getSession();
        Criteria c = s.createCriteria(CompanyMaster.class);
        c.add(Restrictions.eq("companyId", 1));
        List<CompanyMaster> list = c.list();
        CompanyMaster cm = list.get(0);
        System.out.println("Company id :" + cm.getCompanyId());
        System.out.println("Company name :" + cm.getCompanyName());
        for (FlightMaster fm : cm.getFlights()) {
            System.out.println("flights :" + fm.getFlightName());
        }
        HibernateDAOLayer.stopConnectionProvider();
    }
}
