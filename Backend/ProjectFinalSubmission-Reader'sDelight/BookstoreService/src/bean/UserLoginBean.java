package bean;
import java.util.Date;

public class UserLoginBean {
	public String name;
	public String uname;
	public String pwd;
	public String email;
	public int failedlogin;
	
	public int getFailedlogin() {
		return failedlogin;
	}
	public void setFailedlogin(int failedlogin) {
		this.failedlogin = failedlogin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String lastlogin;
	
	public String getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
