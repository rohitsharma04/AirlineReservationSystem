package daolayer;

import entity.AdminDetails;
import entity.AerodrumMaster;
import entity.ClassMaster;
import entity.CompanyMaster;
import entity.CustomerDetails;
import entity.DayMaster;
import entity.FlightFareMap;
import entity.FlightMaster;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.spi.Stoppable;

public class HibernateDAOLayer {

    private final static SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration().
                    addAnnotatedClass(AdminDetails.class).
                    addAnnotatedClass(AerodrumMaster.class).
                    addAnnotatedClass(ClassMaster.class).
                    addAnnotatedClass(CompanyMaster.class).
                    addAnnotatedClass(CustomerDetails.class).
                    addAnnotatedClass(DayMaster.class).
                    addAnnotatedClass(FlightFareMap.class).
                    addAnnotatedClass(FlightMaster.class).
                    configure();

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().
                    applySettings(configuration.getProperties()).build();

            sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static Session getSession() {
        return sessionFactory.openSession();
    }

    public static void stopConnectionProvider() {
        final SessionFactoryImplementor sessionFactoryImplementor = (SessionFactoryImplementor) sessionFactory;
        ConnectionProvider connectionProvider = sessionFactoryImplementor.getConnectionProvider();
        if (Stoppable.class.isInstance(connectionProvider)) {
            ((Stoppable) connectionProvider).stop();
        }
    }
}
