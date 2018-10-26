package pk.model.bean;

import java.sql.Date;

public class Student {
	private String NAME;
	private int CMND;
	private int ID;
	
	private String ADDRESS;
	private Date BIRTHDAY; 
	private int SEX;
	
	
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String NAME) {
		this.NAME = NAME;
	}
	public int getCMND() {
		return CMND;
	}
	public void setCMND(int CMND) {
		this.CMND = CMND;
	}
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String ADDRESS) {
		this.ADDRESS = ADDRESS;
	}
	public Date getBIRTHDAY() {
		return BIRTHDAY;
	}
	public void setBIRTHDAY(Date BIRTHDAY) {
		this.BIRTHDAY = BIRTHDAY;
	}
	public int getSEX() {
		return SEX;
	}
	public void setSEX(int SEX) {
		this.SEX = SEX;
	}
	public Student() {
		// TODO Auto-generated constructor stub
	}
	
	public Student(String NAME, int CMND, int ID,  String ADDRESS, Date BIRTHDAY, int SEX) {
		super();
		this.NAME = NAME;
		this.CMND = CMND;
		this.ID = ID;
		
		this.ADDRESS = ADDRESS;
		this.BIRTHDAY = BIRTHDAY;
		this.SEX = SEX;
	}
	
	
	
}
