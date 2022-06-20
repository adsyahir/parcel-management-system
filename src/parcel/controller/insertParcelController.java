package parcel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StaffDAO;

/**
 * Servlet implementation class insertParcelController
 */
@WebServlet("/insertParcelController")
public class insertParcelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertParcelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = request.getParameter("sid");
		request.setAttribute("sta", StaffDAO.getAllStaff());
		request.setAttribute("s", StaffDAO.getStaffByID(sid) );
		RequestDispatcher view = request.getRequestDispatcher("insertParcelAdmin.jsp");
        view.forward(request, response);
	}
	

	

}
