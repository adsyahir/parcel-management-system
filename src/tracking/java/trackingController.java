package tracking.java;

import java.io.IOException;
import java.sql.SQLException;
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
 * Servlet implementation class trackingController
 */
@WebServlet("/")
public class trackingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private trackDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trackingController() {
        super();
        dao = new trackDAO();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	        doGet(request, response);
    	    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	        String action = request.getServletPath();
    	        try {
    	            switch (action) {
    	                case "/search":
    	                	search(request,response);
    	                	break;
    	             
    	                
    	                	
    	                	
    	              
    	            }
    	        } catch (SQLException ex) {
    	            throw new ServletException(ex);
    	        }
    	    }
    
    
    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
   	 
             tracking t = new tracking();
             String pid= request.getParameter("pid");
             t.setPid(pid);
             
         	request.setAttribute("t", trackDAO.getAllTrackingByID(pid));
        	request.setAttribute("a", trackDAO.getTrackingByID(pid));
         	RequestDispatcher view = request.getRequestDispatcher("viewTracking.jsp");
     		view.forward(request, response);
             
    }
 
    
 
  
    
  
    
  
    
    
    
    
    
    
    
    
    
    

}
