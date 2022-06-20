package staff.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.StaffDAO;
import model.*;

/**
 * Servlet implementation class AddStaffController
 */
@WebServlet("/AddStaffController")

public class AddStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StaffDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStaffController() {
        super();
        dao = new StaffDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Staff s = new Staff();
		String sid = request.getParameter("sid");
		s.setStaffID(request.getParameter("sid"));
		s.setStaffName(request.getParameter("sname"));
		s.setStaffPassword(request.getParameter("spassword"));
		s.setStaffPosition(request.getParameter("sposition"));
		s.setStaffEmail(request.getParameter("semail"));
		s.setStaffAddress(request.getParameter("saddress"));
		s.setAdminID(request.getParameter("adminid"));
		dao.addStaff(s);
		request.setAttribute("s", StaffDAO.getStaffByID(sid) );
		request.setAttribute("sta", StaffDAO.getAllStaff());
		request.setAttribute("success", "Add staff success");
		RequestDispatcher view = request.getRequestDispatcher("addStaff.jsp");
        view.forward(request, response);
	}

}
