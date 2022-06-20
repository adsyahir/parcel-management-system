package unused.controller;

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
@WebServlet("/InsertParcelControllerStaff")
public class InsertParcelControllerStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertParcelControllerStaff() {
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
		RequestDispatcher view = request.getRequestDispatcher("insertParcel.jsp");
        view.forward(request, response);
	}
	

	

}
