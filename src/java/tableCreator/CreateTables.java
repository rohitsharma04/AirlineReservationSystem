package tableCreator;

import daolayer.HibernateDAOLayer;
import entity.AdminDetails;
import entity.AerodrumMaster;
import entity.ClassMaster;
import entity.CompanyMaster;
import entity.CustomerDetails;
import entity.DayMaster;
import entity.FlightFareMap;
import entity.FlightMaster;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class CreateTables {

    public static void main(String[] args) {
        Configuration cfg = new Configuration().
                addAnnotatedClass(AdminDetails.class).
                addAnnotatedClass(AerodrumMaster.class).
                addAnnotatedClass(ClassMaster.class).
                addAnnotatedClass(CompanyMaster.class).
                addAnnotatedClass(CustomerDetails.class).
                addAnnotatedClass(DayMaster.class).
                addAnnotatedClass(FlightFareMap.class).
                addAnnotatedClass(FlightMaster.class).
                configure();
        //Export schema to the database
        SchemaExport se = new SchemaExport(cfg);
        se.create(true, true); // (querybuild and show log , execute build query)
        System.out.println("TABLE CREATED !!");
        //Intialize Database
        InitializeDataBase.intializeClassMaster();
        InitializeDataBase.initializeDayMaster();
        InitializeDataBase.intializeFlightMaster();
        InitializeDataBase.intializeCustomerDetails();
        HibernateDAOLayer.stopConnectionProvider();
    }
}
