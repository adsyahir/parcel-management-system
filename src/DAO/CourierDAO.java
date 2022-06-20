package DAO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import db.connection.ConnectionManager;
import model.Courier;
import model.Parcel;


public class CourierDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	String staffid;
	Date cdate;
	int parcelid,cpostcode;
	//insert data
	int getValue;
	
	public void generateUniqueid(String passquery)
	  {
		  con=ConnectionManager.getConnection();
		  
		  try
		  {
			  stmt=con.createStatement();
			  ResultSet set=stmt.executeQuery(passquery);
			  
			  if(set.next())
			  {
				getValue=Integer.parseInt(set.getString(1)) ; 
			  }
			  System.out.println("get value success");
			  
		  }catch (Exception e)
		  {
			System.out.println("get value failed");  
		  }
		  
	  }
		public void add(Courier bean)  
		{
			generateUniqueid("select count(pid)+1 from courier");
			cdate=(Date)bean.getCdate();
			cpostcode=bean.getCpostcode();
			String unique="P"+cpostcode+new SimpleDateFormat("ddMMyyy").format(cdate)+getValue;
			staffid = bean.getStaffid();
			
			try {
				con = ConnectionManager.getConnection();
				ps  = con.prepareStatement("insert into courier (pid,sid) values(?,?)");
				ps.setString(1,  unique);
				ps.setString(2,  staffid);
				
				ps.executeUpdate();
				System.out.println("Succcesfully courier insert");
			}
			catch(Exception ex) {
				ex.printStackTrace();
				System.out.println("Insert courier failed");
				
			}
		}
	
		
		public static List<Parcel> getAllParcel() {
			List<Parcel> pr = new ArrayList<Parcel>();
			try {
				con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from parcel");

				while (rs.next()) {
					Parcel p = new Parcel();
					p.setPid(rs.getString("pid"));
					pr.add(p);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return pr;
		}
		public  void deleteCourier(String pid) {
			try {
				con = ConnectionManager.getConnection(); //2. establish connection
				ps = con.prepareStatement("delete from courier where pid=?"); //3. create statement
				ps.setString(1,pid);
				ps.executeUpdate();//3. execute statement
				System.out.println("Delete courier success");
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		public static List<Courier> getAllCourier() {
			List<Courier> psn = new ArrayList<Courier>();
			try {
				con = ConnectionManager.getConnection();
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM courier c INNER JOIN parcel p ON c.pid=p.pid INNER JOIN staff s ON c.sid=s.sid ");

				while (rs.next()) {
					Courier c = new Courier();
					c.setPid(rs.getString("pid"));
					c.setStaffid(rs.getString("sid"));
					c.setParcel(ParcelDAO.getParcelByPid(rs.getString("pid")));
					c.setStaff(StaffDAO.getStaffByID(rs.getString("sid")));
					psn.add(c);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return psn;
		}
	
		
}
