package tracking.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StaffDAO;
import DAO.trackDAO;
import model.tracking;

/**
 * Servlet implementation class viewTrackingAdmin
 */
@WebServlet("/viewTrackingAdmin")
public class viewTrackingAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewTrackingAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		tracking t = new tracking();
		String sid = request.getParameter("sid");
        String pid = request.getParameter("pid");
        t.setPid(pid);
        
        request.setAttribute("s", StaffDAO.getStaffByID(sid) );
    	request.setAttribute("t", trackDAO.getAllTrackingByID(pid));
    	RequestDispatcher view = request.getRequestDispatcher("viewTrackingAdmin.jsp");
		view.forward(request, response);
	}

}
