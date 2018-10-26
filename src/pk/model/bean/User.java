package pk.model.bean;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class User {
	private int id;
	@NotEmpty(message="tên đăng nhập ko duoc rong")
	private String username;
	@NotEmpty(message="ho tên ko duoc rong")
	private String fullname;
	@NotEmpty(message=" mật khẩu ko duoc rong")
	@Size(min=10,max=50,message="chieu dai mk ko qua 50 bé hơn 10")
	private String password;
	private int role_id;
	private String name_roler;
	public int getId() {
		return id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getName_roler() {
		return name_roler;
	}
	public void setName_roler(String name_roler) {
		this.name_roler = name_roler;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(int id, String username, String fullname, int role_id, String name_roler) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.role_id = role_id;
		this.name_roler = name_roler;
	}
	
	
	
}
