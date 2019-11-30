package com.gzf.bean;

public class StudentBean {
	private int id ;//
	private int sid;
	private int dormID;
	private String sname;
	private String ssex;
	private String sbirthday;
	private String smajor;
	private String scollege;
	private int sentranceT;
	private String stelephone;
	private String img;
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getDormID() {
		return dormID;
	}
	public void setDormID(int dormID) {
		this.dormID = dormID;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSbirthday() {
		return sbirthday;
	}
	public void setSbirthday(String sbirthday) {
		this.sbirthday = sbirthday;
	}
	public String getSmajor() {
		return smajor;
	}
	public void setSmajor(String smajor) {
		this.smajor = smajor;
	}
	public String getScollege() {
		return scollege;
	}
	public void setScollege(String scollege) {
		this.scollege = scollege;
	}
	public int getSentranceT() {
		return sentranceT;
	}
	public void setSentranceT(int sentranceT) {
		this.sentranceT = sentranceT;
	}
	public String getStelephone() {
		return stelephone;
	}
	public void setStelephone(String stelephone) {
		this.stelephone = stelephone;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public StudentBean(int id, int sid, int dormID, String sname, String ssex, String sbirthday, String smajor,
			String scollege, int sentranceT, String stelephone, String img, int status) {
		super();
		this.id = id;
		this.sid = sid;
		this.dormID = dormID;
		this.sname = sname;
		this.ssex = ssex;
		this.sbirthday = sbirthday;
		this.smajor = smajor;
		this.scollege = scollege;
		this.sentranceT = sentranceT;
		this.stelephone = stelephone;
		this.img = img;
		this.status = status;
	}
	public StudentBean() {
		this.id = 0;
		this.sid = 0;
		this.dormID = 0;
		this.sname = "";
		this.ssex = "";
		this.sbirthday = "";
		this.smajor = "";
		this.scollege = "";
		this.sentranceT = 0;
		this.stelephone = "";
		this.img = "";
		this.status = 0;
	}
	@Override
	public String toString() {
		return "StudentBean [id=" + id + ", sid=" + sid + ", dormID=" + dormID + ", sname=" + sname + ", ssex=" + ssex
				+ ", sbirthday=" + sbirthday + ", smajor=" + smajor + ", scollege=" + scollege + ", sentranceT="
				+ sentranceT + ", stelephone=" + stelephone + ", img=" + img + ", status=" + status + "]";
	}
	public static void main(String[] args) {
		StudentBean studentBean = new StudentBean();
		System.out.println(studentBean);
	}
}
