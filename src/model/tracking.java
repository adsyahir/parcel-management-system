package model;

import java.util.Date;

public class tracking {
     private String  tid,tevent,tprocess;
     private Date tdate;
     private String ttime;
     private String pid;
     private int tpostcode;
     
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTevent() {
		return tevent;
	}
	public void setTevent(String tevent) {
		this.tevent = tevent;
	}
	public String getTprocess() {
		return tprocess;
	}
	public void setTprocess(String tprocess) {
		this.tprocess = tprocess;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	public String getTtime() {
		return ttime;
	}
	public void setTtime(String ttime) {
		this.ttime = ttime;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getTpostcode() {
		return tpostcode;
	}
	public void setTpostcode(int tpostcode) {
		this.tpostcode = tpostcode;
	}
     
}
