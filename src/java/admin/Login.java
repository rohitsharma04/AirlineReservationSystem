package admin;

import daolayer.HibernateDAOLayer;
import encryption.Encrypt;
import entity.AdminDetails;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class Login extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(Login.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        try {
            if (checkLogin(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                if (rememberme != null) {
                    session.setMaxInactiveInterval(60 * 60 * 24 * 30);
                }
                response.sendRedirect("admin");
            } else {
                String message = "Invalid Username or Password";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            LOG.info("Decryption Error !!!");
        }

    }

    private boolean checkLogin(String username, String password) throws Exception {
        Session session = HibernateDAOLayer.getSession();
        Criteria criteria = session.createCriteria(AdminDetails.class);
        criteria.add(Restrictions.eq("adminName", username));
        List<AdminDetails> list = criteria.list();
        if (list.isEmpty()) {
            return false;
        } else if (!Encrypt.decrypt(list.get(0).getPassword()).equals(password)) {
            return false;
        } else {
            return true;
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
