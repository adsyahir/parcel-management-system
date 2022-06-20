package DAO;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.connection.ConnectionManager;
import model.User;

public class UserDAO {

	
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String sid, semail,position, password;

	//method for login
	public static User login(User bean) throws NoSuchAlgorithmException{
		//get email and password
		sid = bean.getSid();
		password = bean.getSpassword();
		
		String query = "select * from staff where sid='" + sid + "'AND spassword='" + password + "'";

		try {
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(query);
			boolean more = rs.next();

			// if user exists set the isValid variable to true
			if (more) {
				String sid = rs.getString("sid");
				String sposition = rs.getString("sposition");
				bean.setSid(sid);
				bean.setSposition(sposition);
				
				System.out.println(sposition);
				bean.setValid(true);
			}
			// if user does not exist set the isValid variable to false
			else if (!more) {
				bean.setValid(false);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bean;
		
		
	}
	
	//method to get user
		public static User getUser(User bean)  {   
			//get email
			sid = bean.getSid();
			String searchQuery = "select * from staff where sid='" + sid + "'";
			try {
				//create connection
				currentCon = ConnectionManager.getConnection();
				//create statement
				stmt = currentCon.createStatement();
				//execute statement
				rs = stmt.executeQuery(searchQuery);

				boolean more = rs.next();

				// if user exists set the isValid variable to true
				if (more) {
					String sid = rs.getString("sid");
					bean.setSid(sid);
					bean.setValid(true);
				}
				// if user does not exist set the isValid variable to false
				else if (!more) {
					bean.setValid(false);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			return bean;
		}
		
		//get user by email
		public static User getUserBySid(String sid) {
			User us = new User();
			try {
				currentCon = ConnectionManager.getConnection();
				ps=currentCon.prepareStatement("select * from staff where sid=?");

				ps.setString(1, sid);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {	            
					us.setSid(rs.getString("sid"));
					us.setSname(rs.getString("sname"));
					us.setSposition(rs.getString("sposition"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return us;
		}

}
