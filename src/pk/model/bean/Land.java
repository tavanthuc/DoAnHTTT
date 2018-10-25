package pk.model.bean;

import java.sql.Timestamp;

public class Land {
	private int lid;
	private String lname;
	private String description;
	private Timestamp date_create;
	private int cid;
	private String picture;
	private String area;
	private String address;
	private String count_views;
	private String cname;
	
	public String getcname() {
		return cname;
	}
	public void setcname(String cname) {
		this.cname = cname;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCount_views() {
		return count_views;
	}
	public void setCount_views(String count_views) {
		this.count_views = count_views;
	}
	public Land() {
		// TODO Auto-generated constructor stub
	}
	public Land(int lid, String lname, String description, Timestamp date_create, int cid, String picture, String area,
			String address, String count_views) {
		super();
		this.lid = lid;
		this.lname = lname;
		this.description = description;
		this.date_create = date_create;
		this.cid = cid;
		this.picture = picture;
		this.area = area;
		this.address = address;
		this.count_views = count_views;
	}
	public Land(int lid, String lname, String description, Timestamp date_create, int cid, String picture, String area,
			String address, String count_views, String cname) {
		super();
		this.lid = lid;
		this.lname = lname;
		this.description = description;
		this.date_create = date_create;
		this.cid = cid;
		this.picture = picture;
		this.area = area;
		this.address = address;
		this.count_views = count_views;
		this.cname = cname;
	}
	public Land(String lname, String description, int cid, String picture, String area, String address) {
		super();
		this.lname = lname;
		this.description = description;
		this.cid = cid;
		this.picture = picture;
		this.area = area;
		this.address = address;
	}
	
	
	
}
