package model;
import java.util.Date;


public class Courier {

	String pid;
	String staffid;
	Date cdate;
	private Parcel parcel;
	private Staff staff;
	private int cpostcode;
    

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getStaffid() {
		return staffid;
	}

	public void setStaffid(String staffid) {
		this.staffid = staffid;
	}
	
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public Parcel getParcel() {
		return parcel;
	}

	public void setParcel(Parcel parcel) {
		this.parcel = parcel;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public int getCpostcode() {
		return cpostcode;
	}

	public void setCpostcode(int cpostcode) {
		this.cpostcode = cpostcode;
	}
	
	
}
