package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.StaffDAO;
import DAO.UserDAO;
import model.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        dao = new UserDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			User user = new User();
			//retrieve and set email and password
			String sid=request.getParameter("sid");
			user.setSid(sid);
			user.setSpassword(request.getParameter("spassword"));

			user = UserDAO.login(user);
			//set user session if user is valid
			if(user.isValid()){
				System.out.println("USER VALID!!!");
				HttpSession session = request.getSession(true);
				session.setAttribute("sessionId", user.getSid());
				session.setAttribute("sessionPosition", user.getSposition());
				session.setAttribute("currentSessionUser",user);
				
				if(user.getSposition().equals("Admin")) {
					request.setAttribute("s", StaffDAO.getStaffByID(sid));   //to retrieve user info
					RequestDispatcher view = request.getRequestDispatcher("insertParcelAdmin.jsp"); 	 // logged-in page
					view.forward(request, response);
				}
				else {
					request.setAttribute("s", StaffDAO.getStaffByID(sid));   //to retrieve user info  //to retrieve user info
					RequestDispatcher view = request.getRequestDispatcher("insertParcelAdmin.jsp"); 	 // logged-in page
					view.forward(request, response);		
				}
			
							
			}
			//redirect to invalidLoggin.jsp if user is not valid
			else{
				response.sendRedirect("invalidLogin.jsp");
			}		
		}

		catch (Throwable ex) {
			System.out.println(ex);
		}
	}

	}


