package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.DayMaster;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DayMasterDataFilling {
    public static void main(String[] args) {
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
        
        HibernateDAOLayer.stopConnectionProvider();
    }
}
