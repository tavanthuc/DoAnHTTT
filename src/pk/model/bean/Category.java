package pk.model.bean;

public class Category {
private int cid;
private String cname;
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getCname() {
	return cname;
}
public void setCname(String cname) {
	this.cname = cname;
}
public Category() {
	// TODO Auto-generated constructor stub
}
public Category(int cid, String cname) {
	super();
	this.cid = cid;
	this.cname = cname;
}

}
