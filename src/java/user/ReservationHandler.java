package user;

import daolayer.HibernateDAOLayer;
import entity.ClassMaster;
import entity.CustomerDetails;
import entity.FlightMaster;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ReservationHandler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String classId = request.getParameter("class");
        //has to be added in the database was not given in the question
        String dateOfJourney = request.getParameter("dateOfJourney");
        String passengerName = request.getParameter("passengerName");
        String gender = request.getParameter("gender");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String city = request.getParameter("city");
        String passportId = request.getParameter("passportId");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");

        try {
            ClassMaster c = new ClassMaster();
            c.setClassId(Integer.parseInt(classId));

            FlightMaster flight = new FlightMaster();
            flight.setFlightNumber(Integer.parseInt(flightNumber));

            int age = (new java.util.Date()).getYear() - Date.valueOf(dateOfBirth).getYear();

            CustomerDetails customer = new CustomerDetails();
            customer.setCustomerName(passengerName);
            customer.setPassportId(passportId);
            customer.setAge(age);
            customer.setGender(gender);
            customer.setCity(city);
            customer.setEmailId(email);
            customer.setContactNumber(contactNumber);
            customer.setClassId(c);
            customer.setFlightNumber(flight);
            customer.setReservationDate(Date.valueOf(dateOfJourney));

            Session session = HibernateDAOLayer.getSession();
            Transaction transaction = session.beginTransaction();
            session.save(customer);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            String message = "Error : " + e.toString();
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("bookings.jsp");
            dispatcher.forward(request, response);
        }
        String message = "Your Reservation was Successfully !!!";
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookings.jsp");
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
