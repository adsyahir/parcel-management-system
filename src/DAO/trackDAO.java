package DAO;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import db.connection.ConnectionManager;
import model.tracking;


public class trackDAO {

	 static Connection con = null;
	  static PreparedStatement ps =null;
	  static Statement stmt = null;
	  
	  String tid,tevent,tprocess,ttime,pid;
	  Date tdate;
	  int getValue,tpostcode;
	  
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
	  
	  public void addTracking(tracking bean)
	  {
		  generateUniqueid("select count(distinct pid)+1 from tracking");
		  tevent=bean.getTevent();
		  tprocess=bean.getTprocess();
		  ttime=bean.getTtime();
		  tdate=(Date)bean.getTdate();
		  pid=bean.getPid();
		  tpostcode=bean.getTpostcode();
		  String unique="P"+tpostcode+new SimpleDateFormat("ddMMyyy").format(tdate)+getValue;
		  
		  try {
			  con=ConnectionManager.getConnection();
			  ps=con.prepareStatement("insert into tracking (tevent,tprocess,ttime,tdate,pid) value (?,?,?,?,?)");
			  ps.setString(1,"Speed Post Warehouse");
			  ps.setString(2,"Parcel Received");
			  ps.setString(3,ttime);
			  ps.setDate(4,tdate);
			  ps.setString(5,unique);
			  ps.executeUpdate();
			  System.out.println("add tracking success");
		  }
		  catch (Exception ex)
		  {
			  
			  ex.printStackTrace();
			  System.out.println("add tracking fail");
		  }  
	  }
	  
		//list data
		public static List<tracking> getAllTrackingByID(String pid) {
			List<tracking> psn = new ArrayList<tracking>();
			try {
				con = ConnectionManager.getConnection();
				ps = con.prepareStatement("select * from tracking where pid=?");
				ps.setString(1, pid );
				ResultSet rs = ps.executeQuery(); 
				while (rs.next()) {
					tracking t = new tracking();
					t.setPid(rs.getString("pid"));
					t.setTprocess(rs.getString("tprocess"));
					t.setTevent(rs.getString("tevent"));
					t.setTtime(rs.getString("ttime"));
					t.setTdate(rs.getDate("tdate"));
					System.out.println("Connected view user"); 
					psn.add(t);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return psn;
		}
		
		public static tracking getTrackingByID(String pid) {
			 tracking t = new tracking();
			try {
				con = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
				//String query = "select * from person where id=?";
				ps = con.prepareStatement("select * from tracking where pid=?");
				ps.setString(1, pid);
				ResultSet rs = ps.executeQuery(); //4. process the result
				
				if(rs.next()) {
						t.setPid(rs.getString("pid"));
						t.setTprocess(rs.getString("tprocess"));
						t.setTevent(rs.getString("tevent"));
						t.setTtime(rs.getString("ttime"));
						t.setTdate(rs.getDate("tdate"));
					System.out.println("Connected view user");   
				}
					
			}
			catch (Exception ex) {
				ex.printStackTrace();
				System.out.println("Cannot fetch data");
			}
			return t;
		}
		
		public static tracking getTrackingBypid(String pid) {
			 tracking t = new tracking();
			try {
				con = ConnectionManager.getConnection(); //2. call the method from ConnectionManager class to establish connection	
				//String query = "select * from person where id=?";
				ps = con.prepareStatement("select * from tracking where pid=?");
				ps.setString(1, pid);
				ResultSet rs = ps.executeQuery(); //4. process the result
				
				if(rs.next()) {
						t.setPid(rs.getString("pid"));
						t.setTid(rs.getString("tid"));
						t.setTprocess(rs.getString("tprocess"));
						t.setTevent(rs.getString("tevent"));
						t.setTtime(rs.getString("ttime"));
						t.setTdate(rs.getDate("tdate"));
					System.out.println("Connected view user");   
				}
					
			}
			catch (Exception ex) {
				ex.printStackTrace();
				System.out.println("Cannot fetch data");
			}
			return t;
		}
		
		public void updateTracking(tracking bean)
		  {
			  tevent=bean.getTevent();
			  tprocess=bean.getTprocess();
			  ttime=bean.getTtime();
			  tdate=(Date)bean.getTdate();
			  pid=bean.getPid();
			  
			  try {
				  con=ConnectionManager.getConnection();
				  ps=con.prepareStatement("insert into tracking (tevent,tprocess,ttime,tdate,pid) value (?,?,?,?,?)");
				  ps.setString(1,tevent);
				  ps.setString(2,tprocess);
				  ps.setString(3,ttime);
				  ps.setDate(4,tdate);
				  ps.setString(5,pid);
				  ps.executeUpdate();
				  System.out.println("Connected update tracking success");
			  }
			  catch (Exception ex)
			  {
				  
				  ex.printStackTrace();
				  System.out.println("Connected update tracking failed");
			  }  
		  }
		
		public  void deleteTrack(String pid) {
			try {
				con = ConnectionManager.getConnection(); //2. establish connection
				ps = con.prepareStatement("delete from tracking where pid=?"); //3. create statement
				ps.setString(1,pid);
				ps.executeUpdate();//3. execute statement
				 System.out.println("Delete track success");
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	
			
	   
	 
	  
}
