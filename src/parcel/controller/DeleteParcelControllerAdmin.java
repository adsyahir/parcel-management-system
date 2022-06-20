package parcel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CourierDAO;
import DAO.ParcelDAO;
import DAO.StaffDAO;
import DAO.trackDAO;

/**
 * Servlet implementation class DeleteParcelControllerAdmin
 */
@WebServlet("/DeleteParcelControllerAdmin")
public class DeleteParcelControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ParcelDAO pd;
	private trackDAO td;
	private CourierDAO cd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteParcelControllerAdmin() {
        super();
        pd = new ParcelDAO();
        td= new trackDAO();
        cd = new CourierDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid= request.getParameter("sid");
		 String pid = request.getParameter("pid");
		
		 td.deleteTrack(pid);
		 cd.deleteCourier(pid);
		 pd.deleteParcel(pid);
		 request.setAttribute("s", StaffDAO.getStaffByID(sid) );
	     request.setAttribute("parcel", ParcelDAO.getAllParcel());
	   RequestDispatcher view = request.getRequestDispatcher("listParcelAdmin.jsp");
	     view.forward(request, response);	}

}
