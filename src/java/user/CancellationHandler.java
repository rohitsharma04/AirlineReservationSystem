
package user;

import entity.CustomerDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CancellationHandler extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            String pnrno=request.getParameter("pnrno");
            int pnr=Integer.parseInt(pnrno);
            Session session = daolayer.HibernateDAOLayer.getSession();
            Transaction t=session.beginTransaction();
            CustomerDetails c = new CustomerDetails();
            c.setPnrNumber(pnr);
            session.delete(c);
            t.commit();
            out.println("sakshi");
            request.setAttribute("msg", "Your booking has been cancelled");
            RequestDispatcher rd = request.getRequestDispatcher("cancelmessage.jsp");
            rd.forward(request, response);
          //  response.sendRedirect("cancel.jsp");
        }
        catch (NumberFormatException e) 
        {
            e.printStackTrace();
            String message = "Error : " + e.toString();
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cancelmessage.jsp");
            dispatcher.forward(request, response);
        }
        
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
