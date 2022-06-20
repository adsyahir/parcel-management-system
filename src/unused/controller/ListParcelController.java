package unused.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ParcelDAO;
import DAO.StaffDAO;
import DAO.UserDAO;
import model.User;

/**
 * Servlet implementation class ListParcelController
 */
@WebServlet("/ListParcelController")
public class ListParcelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
    
	/**
     * Default constructor. 
     */
    public ListParcelController() {
    	 super();
         new ParcelDAO();
         dao = new UserDAO();
    	
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String sid= request.getParameter("sid");
         request.setAttribute("s", StaffDAO.getStaffByID(sid));
			request.setAttribute("parcel", ParcelDAO.getAllParcel());
			RequestDispatcher view = request.getRequestDispatcher("listParcel.jsp");
	        view.forward(request, response);	
		
				
	}
							
		
}
