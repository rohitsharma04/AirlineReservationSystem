/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import daolayer.HibernateDAOLayer;
import entity.AerodrumMaster;
import entity.ClassMaster;
import entity.CompanyMaster;
import entity.DayMaster;
import entity.FlightFareMap;
import entity.FlightMaster;
import java.io.IOException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AddFlightHandler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String company = request.getParameter("companyId");
        String flightName = request.getParameter("flightName");
        String source = request.getParameter("sourceId");
        String destination = request.getParameter("destinationId");
        String dayId[] = request.getParameterValues("dayId");
        String departure = request.getParameter("departureTime") + ":00";
        String arrival = request.getParameter("arrivalTime") + ":00";
        String fare1 = request.getParameter("fare1");
        String fare2 = request.getParameter("fare2");
        String fare3 = request.getParameter("fare3");
        String seats1 = request.getParameter("seats1");
        String seats2 = request.getParameter("seats2");
        String seats3 = request.getParameter("seats3");

        //Flight Master Data to set
        CompanyMaster companyId = new CompanyMaster();
        AerodrumMaster sourceId = new AerodrumMaster();
        AerodrumMaster destinationId = new AerodrumMaster();
        Time departureTime;
        Time arrivalTime;
        List<FlightFareMap> ffm = new ArrayList<>();
        List<DayMaster> days = new ArrayList<>();

        try {
            //Setting internal flight Master data
            companyId.setCompanyId(Integer.parseInt(company));
            sourceId.setAerodrumId(Integer.parseInt(source));
            destinationId.setAerodrumId(Integer.parseInt(destination));
            departureTime = Time.valueOf(departure);
            arrivalTime = Time.valueOf(arrival);

            //ClassMaster Object
            ClassMaster c1 = new ClassMaster();
            ClassMaster c2 = new ClassMaster();
            ClassMaster c3 = new ClassMaster();
            //Creating FlightFareMap objects
            //First Class
            c1.setClassId(1);
            FlightFareMap ffm1 = new FlightFareMap();
            ffm1.setClassId(c1);
            ffm1.setFare(Integer.parseInt(fare1));
            ffm1.setNumberOfSeats(Integer.parseInt(seats1));

            //Business Class
            c2.setClassId(2);
            FlightFareMap ffm2 = new FlightFareMap();
            ffm2.setClassId(c2);
            ffm2.setFare(Integer.parseInt(fare2));
            ffm2.setNumberOfSeats(Integer.parseInt(seats2));

            //Economy Class
            c3.setClassId(3);
            FlightFareMap ffm3 = new FlightFareMap();
            ffm3.setClassId(c3);
            ffm3.setFare(Integer.parseInt(fare3));
            ffm3.setNumberOfSeats(Integer.parseInt(seats3));

            //Adding the FlightFareMap objects to the list of flightMaster
            ffm.add(ffm1);
            ffm.add(ffm2);
            ffm.add(ffm3);

            //DayMaster Object
            for (String day : dayId) {
                DayMaster d = new DayMaster();
                d.setDayId(Integer.parseInt(day));
                //Adding day object to the list of days
                days.add(d);
            }

            //Creating FlightMasterObject and Setting All the Properties
            FlightMaster flight = new FlightMaster();
            flight.setFlightName(flightName);
            flight.setCompanyId(companyId);
            flight.setSourceId(sourceId);
            flight.setDestinationId(destinationId);
            flight.setDepartureTime(departureTime);
            flight.setArrivalTime(arrivalTime);
            flight.setFare(ffm);
            flight.setDays(days);

            //Storing the flight and ffm1,ffm2,ffm3 objects into the database
            Session session = HibernateDAOLayer.getSession();
            Transaction transaction = session.beginTransaction();
            session.save(ffm1);
            session.save(ffm2);
            session.save(ffm3);
            session.save(flight);
            transaction.commit();
        } catch (Exception e) {
            String message = "Error : " + e.getMessage();
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("addflight.jsp");
            dispatcher.forward(request, response);
        }
        String message = "Flight Added Successfully !!!";
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("addflight.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
