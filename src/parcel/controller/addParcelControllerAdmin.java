package parcel.controller;

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
import DAO.trackDAO;
import model.Courier;
import model.Parcel;
import model.tracking;

/**
 * Servlet implementation class addParcelControllerAdmin
 */
@WebServlet("/addParcelControllerAdmin")
public class addParcelControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ParcelDAO pd;
    private CourierDAO cd;
    private trackDAO td;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addParcelControllerAdmin() {
        super();
        // TODO Auto-generated constructor stub
        pd = new ParcelDAO();
        cd= new CourierDAO();
        td= new trackDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        Parcel p = new Parcel();
        Courier c = new Courier();
        tracking t= new tracking();
        String sid= request.getParameter("sid");
        String ptime= request.getParameter("ptime");
        int ppostcode=Integer.parseInt(request.getParameter("ppostcode"));
        c.setStaffid(sid);
        t.setTtime(ptime);
		p.setPsendname(request.getParameter(("psendname")));
		p.setPsendadd(request.getParameter(("psendadd")));
		p.setPsendphone(request.getParameter(("psendphone")));
		p.setPsendemail(request.getParameter(("psendemail")));
		p.setPreceivername(request.getParameter(("preceivername")));
		p.setPreceiveradd(request.getParameter(("preceiveradd")));
		p.setPreceiverphone(request.getParameter(("preceiverphone")));
		p.setPreceiveremail(request.getParameter(("preceiveremail")));
		p.setPpostcode(ppostcode);
		c.setCpostcode(ppostcode);
	    t.setTpostcode(ppostcode);
		p.setPweight(Double.parseDouble(request.getParameter(("pweight"))));
		String date = request.getParameter("pdate");
		Date dt;
		try {
			dt = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
			p.setPdate(sqlDate);
			t.setTdate(sqlDate);
		    c.setCdate(sqlDate);
		}
        catch(ParseException e){
        	e.printStackTrace();
        }
		p.setPdetail(request.getParameter(("pdetail")));
		p.setPcouriername(request.getParameter(("pcouriername")));
		pd.add(p);
		cd.add(c);
		td.addTracking(t);
		 request.setAttribute("s", StaffDAO.getStaffByID(sid) );
	     request.setAttribute("parcel", ParcelDAO.getAllParcel());
	     request.setAttribute("success", "Add parcel success");
	   RequestDispatcher view = request.getRequestDispatcher("insertParcelAdmin.jsp");
	     view.forward(request, response);
	}

}
