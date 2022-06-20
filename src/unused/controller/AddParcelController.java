package unused.controller;

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

import DAO.CourierDAO;
import DAO.ParcelDAO;
import DAO.StaffDAO;
import model.Courier;
import model.Parcel;

/**
 * Servlet implementation class AddParcelController
 */
@WebServlet("/AddParcelController")
public class AddParcelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ParcelDAO dao;
    private CourierDAO d;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddParcelController() {
        super();
        dao = new ParcelDAO();
        d= new CourierDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   Parcel p = new Parcel();
	        Courier c = new Courier();
	        String sid= request.getParameter("sid");
	        c.setStaffid("sid");
			p.setPsendname(request.getParameter(("psendname")));
			p.setPsendadd(request.getParameter(("psendadd")));
			p.setPsendphone(request.getParameter(("psendphone")));
			p.setPsendemail(request.getParameter(("psendemail")));
			p.setPreceivername(request.getParameter(("preceivername")));
			p.setPreceiveradd(request.getParameter(("preceiveradd")));
			p.setPreceiverphone(request.getParameter(("preceiverphone")));
			p.setPreceiveremail(request.getParameter(("preceiveremail")));
			p.setPpostcode(Integer.parseInt(request.getParameter(("ppostcode"))));
			p.setPweight(Double.parseDouble(request.getParameter(("pweight"))));
			String date = request.getParameter("pdate");
			Date dt;
			try {
				dt = new SimpleDateFormat("yyyy-MM-dd").parse(date);
				java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
				p.setPdate(sqlDate);
			}
	        catch(ParseException e){
	        	e.printStackTrace();
	        }
			p.setPdetail(request.getParameter(("pdetail")));
			p.setPcouriername(request.getParameter(("pcouriername")));
			dao.add(p);
			d.add(c);
			 request.setAttribute("s", StaffDAO.getStaffByID(sid) );
		     request.setAttribute("parcel", ParcelDAO.getAllParcel());
		   RequestDispatcher view = request.getRequestDispatcher("listParcel.jsp");
		     view.forward(request, response);
	}

}
