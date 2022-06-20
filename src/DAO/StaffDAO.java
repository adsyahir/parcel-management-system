package DAO;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import db.connection.ConnectionManager;
import model.Staff;


public class StaffDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	private String sid, sname, spassword, sposition, semail, saddress, adminid;
	int getValue = 000;

	
	public void generateUniqueStaffID(String passquery) {
		con = ConnectionManager.getConnection();
		
		try {
			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(passquery);
			
			if(set.next()) {
				getValue = Integer.parseInt(set.getString(1));
			}
			System.out.println("get value success");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public void addStaff(Staff s) { //add staff
		generateUniqueStaffID("select count(sid)+1 from staff");
		//generateUniqueAdminID("select count(adminid)+1 from staff");
		sid = "S00"+ getValue;
		sname = s.getStaffName();
		spassword = s.getStaffPassword();
		sposition = s.getStaffPosition();
		semail = s.getStaffEmail();
		saddress = s.getStaffAddress();
		
		//adminid = "M" + s.getAdminID() + getValue1;
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("insert into staff (sid, sname, spassword, sposition, semail, saddress) values (?,?,?,?,?,?)");
			ps.setString(1, sid);
			ps.setString(2, sname);
			ps.setString(3, spassword);
			ps.setString(4, sposition);
			ps.setString(5, semail);
			ps.setString(6, saddress);
		
			ps.executeUpdate();
			con.close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static Staff viewStaff(String sid) {
		Staff s = new Staff();
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from staff where sid=?");
			ResultSet rs = ps.executeQuery();
			ps.setString(1, sid);
			
			if(rs.next()) {
				s.setStaffID(rs.getString("sid"));
				s.setStaffName(rs.getString("sname"));
				s.setStaffPassword(rs.getString("spassword"));
				s.setStaffPosition(rs.getString("sposition"));
				s.setStaffEmail(rs.getString("semail"));
				s.setStaffAddress(rs.getString("saddress"));
				s.setAdminID(rs.getString("adminid"));
				
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return s;
	}
	
	public static Staff getStaffByID(String sid) { //view staff by staff id
		Staff s = new Staff();
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from staff where sid=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				s.setStaffID(rs.getString("sid"));
				s.setStaffName(rs.getString("sname"));
				s.setStaffPassword(rs.getString("spassword"));
				s.setStaffPosition(rs.getString("sposition"));
				s.setStaffEmail(rs.getString("semail"));
				s.setStaffAddress(rs.getString("saddress"));
				s.setAdminID(rs.getString("adminid"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			
		}
		return s;
	}
	
	public static List<Staff> getAllStaff() { //all staff
		List<Staff> sta = new ArrayList<Staff>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from staff");
			
			while(rs.next()) {
				Staff s = new Staff();
				s.setStaffID(rs.getString("sid"));
				s.setStaffName(rs.getString("sname"));
				s.setStaffPassword(rs.getString("spassword"));
				s.setStaffPosition(rs.getString("sposition"));
				s.setStaffEmail(rs.getString("semail"));
				s.setStaffAddress(rs.getString("saddress"));
				s.setAdminID(rs.getString("adminid"));
				
				sta.add(s);
				
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return sta;
	}
	
	public void deleteStaff(String sid) { //delete staff info
		try {
			con = ConnectionManager.getConnection(); 
			ps = con.prepareStatement("delete from staff where sid=?");
			ps.setString(1, sid);
			ps.executeUpdate();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void updateStaffInformation(Staff s) { //update staff info
		
		sid = s.getStaffID();
		sname = s.getStaffName();
		spassword = s.getStaffPassword();
		sposition = s.getStaffPosition();
		semail = s.getStaffEmail();
		saddress = s.getStaffAddress();
		adminid = s.getAdminID();
			
		
		try {
			con = ConnectionManager.getConnection();
			String query = "UPDATE staff SET sname = '" + sname + "', spassword = '" + spassword +"', sposition = '" + sposition + "', semail = '" + semail +"', saddress = '" + saddress +"', adminid = '" + adminid +"' where sid = '"+ sid +"' ";			
			stmt = con.createStatement();
			stmt.executeUpdate(query);

			System.out.println("Update information success");
		}
		catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Update information failed");
		}
	}
	
	

}
