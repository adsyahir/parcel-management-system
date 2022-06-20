package tracking.java;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ParcelDAO;
import DAO.StaffDAO;
import DAO.trackDAO;
import model.tracking;

/**
 * Servlet implementation class updateTrackingController
 */
@WebServlet("/updateTrackingController")
public class updateTrackingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private trackDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateTrackingController() {
        super();
        dao = new trackDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid =request.getParameter("pid");
        String sid= request.getParameter("sid");
        request.setAttribute("p", ParcelDAO.getParcelByPid(pid));
			request.setAttribute("s", StaffDAO.getStaffByID(sid));
			RequestDispatcher view = request.getRequestDispatcher("updateTrackingAdmin.jsp");
	        view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		tracking t = new tracking();
		String sid = request.getParameter("sid");
        t.setPid(request.getParameter("pid"));
    	t.setTevent(request.getParameter("tevent"));
    	t.setTprocess(request.getParameter("tprocess"));
    	t.setTtime(request.getParameter("ttime"));
    	t.setTevent(request.getParameter("tevent"));
    	t.setTid(request.getParameter("tid"));
    	String tdate = request.getParameter("tdate");
	    Date dt;
        try {
        	dt= new SimpleDateFormat("yyyy-MM-dd").parse(tdate);
        	java.sql.Date sqlDate= new java.sql.Date(dt.getTime());
        	t.setTdate(sqlDate);
        	
        }
        catch(ParseException e)
        {
        	e.printStackTrace();
        }
        
        dao.updateTracking(t);
        request.setAttribute("s", StaffDAO.getStaffByID(sid) );
        request.setAttribute("parcel", ParcelDAO.getAllParcel());
		RequestDispatcher view = request.getRequestDispatcher("listParcelAdmin.jsp");
        view.forward(request, response);
       
	}

}
