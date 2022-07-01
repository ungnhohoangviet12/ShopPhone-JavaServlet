/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import connection.DbCon;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (password.equals(confirmPassword)) {
//            return 
    //             send a attribute name as "message" to register-user.jsp page
                request.setAttribute("message", "Password not equals");
                //forward to register-user.jsp page
                            RequestDispatcher dispatcher
                        = this.getServletContext().getRequestDispatcher("/register.jsp");

                dispatcher.forward(request, response);
        }
        // check exist email
        // set data for user
        User user = new User(userName, email, password);
        UserDao userDao = new UserDao(DbCon.getConnetion());
        
        User userDB = userDao.getUserByEmail(email);
        if (userDB != null) {
            request.setAttribute("message", "Email already exist");
                //forward to register-user.jsp page
                            RequestDispatcher dispatcher
                        = this.getServletContext().getRequestDispatcher("/register.jsp");

                dispatcher.forward(request, response);
        } else {
            if (userDao.registerUser(user)) {
                // send a attribute name as "userRegister" to register-user-process.jsp page
                HttpSession session = request.getSession();
                session.setAttribute("userRegister", user);
                
                response.sendRedirect(request.getContextPath() + "/login");

            } else {
    //             send a attribute name as "message" to register-user.jsp page
                request.setAttribute("message", "Register fail");
                //forward to register-user.jsp page
                            RequestDispatcher dispatcher
                        = this.getServletContext().getRequestDispatcher("/register.jsp");

                dispatcher.forward(request, response);
            }
        }
        
    
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
