package pk.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import pk.model.bean.Contact;

@Repository
public class ContactDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static final String FIND_ALL="SELECT * FROM contact ORDER BY cid DESC";
	private static final String INSERT="INSERT INTO contact(fullname,email,subject,content) VALUES(?,?,?,?)";
	private static final String delete = "DELETE FROM contact WHERE cid=?";
	private static final String FIND_BY_ID="SELECT * FROM contact WHERE cid=?";
	private static final String FIND_BY_PAGE="SELECT * FROM contact LIMIT ?,2";
	private static final String Update="UPDATE contact SET fullname=?,email=?,subject=?,content=? WHERE cid=?";
	public List<Contact> getitems(){
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(Contact.class));
	}
	public int additem(Contact cat) {
		return jdbcTemplate.update(INSERT,new  Object[] {cat.getFullname(),cat.getEmail(),cat.getSubject(),cat.getContent()});
	}
	public int delitem(int cid) {
		// TODO Auto-generated method stub
	 return jdbcTemplate.update(delete, new Object[] { cid });
	}
	public Contact getItem(int id) {
		return jdbcTemplate.queryForObject(FIND_BY_ID, new Object[] {id},new BeanPropertyRowMapper<>(Contact.class));
	}
	public int editItem(Contact cat) {
		return jdbcTemplate.update(Update, new Object[] {cat.getFullname(),cat.getEmail(),cat.getSubject(),cat.getContent()});
	}
	public int total() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS dem from contact", Integer.class);
	}
	public List<Contact> getitems(int page){
		return (List<Contact>) jdbcTemplate.query(FIND_BY_PAGE,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement pst) throws SQLException {
				pst.setInt(1, page);
			}
		}, new BeanPropertyRowMapper<>(Contact.class));
	}
}
