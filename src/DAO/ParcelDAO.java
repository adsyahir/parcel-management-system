package DAO;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import db.connection.ConnectionManager;
import model.Parcel;

public class ParcelDAO {

	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stat = null;
	static Statement stmt = null;
	
	String psendname, psendadd, psendphone, psendemail, preceivername, preceiveradd, preceiverphone, preceiveremail, pdetail, pcouriername;
	Integer  ppostcode;
	double pweight;
	Date pdate;
	String pid;
	
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
	
	//Add Parcel
	public void add (Parcel p) {
		
		generateUniqueid("select count(pid)+1 from parcel");
		psendname= p.getPsendname();
		psendadd= p.getPsendadd();
		psendphone= p.getPsendphone();
		psendemail = p.getPsendemail();
		preceivername = p.getPreceivername();
		preceiveradd = p.getPreceiveradd();
		preceiverphone = p.getPreceiverphone();
		preceiveremail = p.getPreceiveremail();
		ppostcode = p.getPpostcode();
		pweight = p.getPweight();
		pdate = (Date) p.getPdate();
		pdetail = p.getPdetail();
		pcouriername = p.getPcouriername();
		String unique="P"+ppostcode+new SimpleDateFormat("ddMMyyy").format(pdate)+getValue;

		
		try {
			con = ConnectionManager.getConnection();			
			ps = con.prepareStatement("insert into parcel (pid,psendname, psendadd, psendphone, psendemail, preceivername, preceiveradd, preceiverphone, preceiveremail, ppostcode, pweight, pdate, pdetail, pcouriername) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, unique);
			ps.setString(2, psendname);
			ps.setString(3, psendadd);
			ps.setString(4, psendphone);
			ps.setString(5, psendemail);
			ps.setString(6, preceivername);
			ps.setString(7, preceiveradd);
			ps.setString(8, preceiverphone);
			ps.setString(9, preceiveremail);
			ps.setInt(10, ppostcode);
			ps.setDouble(11, pweight);
			ps.setDate(12, pdate);
			ps.setString(13, pdetail);
			ps.setString(14, pcouriername);
			
			ps.executeUpdate();
			System.out.println("Parcel add sucess");
		}
		catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Parcel add fail");
		}
	}
	
	//View parcel by their parcelID
	public static Parcel getParcelByPid(String parcelID) {
		Parcel p = new Parcel();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("select * from parcel where pid=?");
			ps.setString(1, parcelID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				p.setPid(rs.getString("pid"));
				p.setPsendname(rs.getString("psendname"));
				p.setPsendadd(rs.getString("psendadd"));
				p.setPsendphone(rs.getString("psendphone"));
				p.setPsendemail(rs.getString("psendemail"));
				p.setPreceivername(rs.getString("preceivername"));
				p.setPreceiveradd(rs.getString("preceiveradd"));
				p.setPreceiverphone(rs.getString("preceiverphone"));
				p.setPreceiveremail(rs.getString("preceiveremail"));
				p.setPpostcode(rs.getInt("ppostcode"));
				p.setPweight(rs.getDouble("pweight"));
				p.setPdate(rs.getDate("pdate"));
				p.setPdetail(rs.getString("pdetail"));
				p.setPcouriername(rs.getString("pcouriername"));
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return p;
	}
	
	
	//List all parcel
	public static List<Parcel> getAllParcel() {
		List<Parcel> parcel = new ArrayList<Parcel>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from parcel");

			while (rs.next()) {
				Parcel p = new Parcel();
				p.setPid(rs.getString("pid"));
				p.setPsendname(rs.getString("psendname"));
				p.setPreceivername(rs.getString("preceivername"));
				p.setPpostcode(rs.getInt("ppostcode"));
				p.setPdate(rs.getDate("pdate"));
				p.setPcouriername(rs.getString("pcouriername"));

				parcel.add(p);
				System.out.println("list masuk");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return parcel;
	}
	
	//Delete parcel
	public void deleteParcel(String pid) {
		try {
			con = ConnectionManager.getConnection(); //2. establish connection
			ps = con.prepareStatement("delete from parcel where pid=?"); //3. create statement
			ps.setString(1, pid);
			ps.executeUpdate();//3. execute statement
			System.out.println("Delete parcel success");
	
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
