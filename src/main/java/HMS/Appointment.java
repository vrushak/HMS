package HMS;

public class Appointment {
private String pid;
private String pname;
private String dname;
private String appointment;
private String docid;
private String time;
private String combine;
private String fileno;
private String active;
private String flag;

public String getFlag() {
	return flag;
}
public void setFlag(String flag) {
	this.flag = flag;
}
private Patient p;

public String getActive() {
	return active;
}
public void setActive(String active) {
	this.active = active;
}
public String getFileno() {
	return fileno;
}
public void setFileno(String fileno) {
	this.fileno = fileno;
}
public String getCombine() {
	return combine;
}
public void setCombine(String combine) {
	this.combine = combine;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getPid() {
	return pid;
}
public void setPid(String pid) {
	this.pid = pid;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public String getDname() {
	return dname;
}
public void setDname(String dname) {
	this.dname = dname;
}
public String getAppointment() {
	return appointment;
}
public void setAppointment(String appointment) {
	this.appointment = appointment;
}
public String getDocid() {
	return docid;
}
public void setDocid(String docid) {
	this.docid = docid;
}



}
