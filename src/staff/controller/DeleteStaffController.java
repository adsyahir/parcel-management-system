package staff.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StaffDAO;

/**
 * Servlet implementation class DeleteStaffController
 */
@WebServlet("/DeleteStaffController")
public class DeleteStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StaffDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStaffController() {
        super();
        dao = new StaffDAO();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String sid = request.getParameter("sid");
    	String staffid = request.getParameter("staffid");
		dao.deleteStaff(staffid);
		
		request.setAttribute("sta", StaffDAO.getAllStaff());
		
		request.setAttribute("s", StaffDAO.getStaffByID(sid));
		RequestDispatcher view = request.getRequestDispatcher("listStaff.jsp");
        view.forward(request, response);
	}

}
