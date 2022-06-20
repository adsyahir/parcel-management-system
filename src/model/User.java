package model;

public class User {
		String sid,sname,spassword,sposition,semail,saddress,adminid;
		private boolean valid;
		
		public String getSid() {
			return sid;
		}

		public void setSid(String sid) {
			this.sid = sid;
		}

		public String getSname() {
			return sname;
		}

		public void setSname(String sname) {
			this.sname = sname;
		}

		public String getSpassword() {
			return spassword;
		}

		public void setSpassword(String spassword) {
			this.spassword = spassword;
		}

		public String getSposition() {
			return sposition;
		}

		public void setSposition(String sposition) {
			this.sposition = sposition;
		}

		public String getSemail() {
			return semail;
		}

		public void setSemail(String semail) {
			this.semail = semail;
		}

		public String getSaddress() {
			return saddress;
		}

		public void setSaddress(String saddress) {
			this.saddress = saddress;
		}

		public String getAdminid() {
			return adminid;
		}

		public void setAdminid(String adminid) {
			this.adminid = adminid;
		}

		public boolean isValid() {
			return valid;
		}

		public void setValid(boolean valid) {
			this.valid = valid;
		}
}
