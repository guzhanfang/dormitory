package com.gzf.bean;

public class Dormbean {
	private int id;
	private String house;
	private String build;
	private String number;
	private String attribute;
	private int quantity;
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHouse() {
		
		return house;
	}
	public void setHouse(String house) {
		if (house==null) {
			this.house = "";
		}
		else {
			this.house = house;
		}
		
	}
	public String getBuild() {
		return build;
	}
	public void setBuild(String build) {
		if (build==null) {
			this.build = "";
		}
		else {
			this.build = build;
		}
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		if (number==null) {
			this.number = "";
		}
		else {
			this.number = number;
		}
	}
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		if (attribute==null) {
			this.attribute = "";
		}
		else {
			this.attribute = attribute;
		}
	}
	public Dormbean() {
		super();
		this.house = "";
		this.build = "";
		this.number = "";
		this.attribute = "";
		this.quantity = -1;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Dormbean [id=" + id + ", house=" + house + ", build=" + build + ", number=" + number
				+ ", attribute=" + attribute + ", quantity=" + quantity + ", status=" + status + "]";
	}
	
}
