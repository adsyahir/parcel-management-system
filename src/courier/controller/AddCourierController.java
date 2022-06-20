package courier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CourierDAO;
import model.Courier;
/**
 * Servlet implementation class AddCourierController
 */
@WebServlet("/AddCourierController")
public class AddCourierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourierDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourierController() {
        super();
        dao = new CourierDAO();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Courier c = new Courier();
		
		c.setStaffid(request.getParameter("sid"));
		c.setPid(request.getParameter("pid"));
		dao.add(c);

		RequestDispatcher view = request.getRequestDispatcher("viewCourier.jsp");
        view.forward(request, response);	
	}

}
