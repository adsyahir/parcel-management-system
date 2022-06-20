package courier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CourierDAO;
import DAO.StaffDAO;

/**
 * Servlet implementation class ViewCourierController
 */
@WebServlet("/ViewCourierController")
public class ViewCourierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourierDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCourierController() {
        super();
        dao = new CourierDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = request.getParameter("sid");
		 request.setAttribute("s", StaffDAO.getStaffByID(sid) );
        request.setAttribute("c", CourierDAO.getAllCourier());
		RequestDispatcher view = request.getRequestDispatcher("viewCourier.jsp");
        view.forward(request, response);	
	}


}
