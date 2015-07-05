package fillingdata;

import daolayer.HibernateDAOLayer;
import entity.ClassMaster;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ClassMasterDataFilling {

    public static void main(String[] args) {
       
        ClassMaster c1 = new ClassMaster();
        c1.setClassId(1);
        c1.setClassName("First");
        
        ClassMaster c2 = new ClassMaster();
        c2.setClassId(2);
        c2.setClassName("Business");
        
        ClassMaster c3 = new ClassMaster();
        c3.setClassId(3);
        c3.setClassName("Economic");
        
        Session session = HibernateDAOLayer.getSession();
        Transaction transaction = session.beginTransaction();

        session.save(c1);
        session.save(c2);
        session.save(c3);
        
        transaction.commit();

        HibernateDAOLayer.stopConnectionProvider();
    }

}
