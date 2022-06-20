package unused.controller;

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
 * Servlet implementation class UpdateStaffController
 */
@WebServlet("/UpdateStaffControllerAdmin")
public class UpdateStaffControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StaffDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStaffControllerAdmin() {
        super();
        dao = new StaffDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = request.getParameter("sid");
		request.setAttribute("s", StaffDAO.getStaffByID(sid));
		RequestDispatcher view = request.getRequestDispatcher("updateStaffInfo.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Staff s =new Staff();
		s.setStaffID(request.getParameter("sid"));
		s.setStaffName(request.getParameter("sname"));
		s.setStaffPassword(request.getParameter("spassword"));
		s.setStaffPosition(request.getParameter("sposition"));
		s.setStaffEmail(request.getParameter("semail"));
		s.setStaffAddress(request.getParameter("saddress"));
		dao.updateStaffInformation(s);
		response.sendRedirect("ListStaffController");
	}

}
