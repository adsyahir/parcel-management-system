package parcel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ParcelDAO;
import DAO.StaffDAO;

/**
 * Servlet implementation class ViewParcelController
 */
@WebServlet("/ViewParcelController")
public class ViewParcelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewParcelController() {
    	super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid = request.getParameter("pid");
		String sid = request.getParameter("sid");
		request.setAttribute("p", ParcelDAO.getParcelByPid(pid));
		request.setAttribute("s", StaffDAO.getStaffByID(sid) );
		RequestDispatcher view = request.getRequestDispatcher("viewParcelAdmin.jsp");
        view.forward(request, response);
	}
}
