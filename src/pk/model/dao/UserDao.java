package pk.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import pk.model.bean.User;



@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static final String FIND_ALL="SELECT * FROM users ORDER BY id DESC";
	private static final String INSERT="INSERT INTO users(username,fullname,password) VALUES(?,?,?)";
	private static final String delete = "DELETE FROM users WHERE id=?";
	private static final String FIND_BY_ID="SELECT * FROM users WHERE id=?";
	private static final String FIND_BY_PAGE="SELECT * FROM users LIMIT ?,2";
	private static final String Update="UPDATE users SET username=? , fullname=? , password=? WHERE id=?";
	public List<User> getitems(){
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(User.class));
	}
	public int additem(User cat) {
		return jdbcTemplate.update(INSERT,new  Object[] {cat.getUsername(),cat.getFullname(),cat.getPassword()});
	}
	public int delitem(int id) {
		// TODO Auto-generated method stub
	 return jdbcTemplate.update(delete, new Object[] { id });
	}
	public User getItem(int id) {
		return jdbcTemplate.queryForObject(FIND_BY_ID, new Object[] {id},new BeanPropertyRowMapper<>(User.class));
	}
	public int editItem(User cat,int id) {
		return jdbcTemplate.update(Update, new Object[] {cat.getUsername(),cat.getFullname(),cat.getPassword(),id});
	}
	public int total() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS dem from users", Integer.class);
	}
	
}
