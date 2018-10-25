package pk.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import pk.model.bean.Category;

@Repository
public class Categorydao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static final String FIND_ALL="SELECT * FROM categories ORDER BY cid DESC";
	private static final String INSERT="INSERT INTO categories(cname) VALUES(?)";
	private static final String delete = "DELETE FROM categories WHERE cid=?";
	private static final String FIND_BY_ID="SELECT * FROM categories WHERE cid=?";
	private static final String FIND_BY_PAGE="SELECT * FROM categories LIMIT ?,2";
	private static final String Update="UPDATE categories SET cname=? WHERE cid=?";
	public List<Category> getitems(){
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(Category.class));
	}
	public int additem(Category cat) {
		return jdbcTemplate.update(INSERT,new  Object[] {cat.getCname()});
	}
	public int delitem(int cid) {
		// TODO Auto-generated method stub
	 return jdbcTemplate.update(delete, new Object[] { cid });
	}
	public Category getItem(int id) {
		return jdbcTemplate.queryForObject(FIND_BY_ID, new Object[] {id},new BeanPropertyRowMapper<>(Category.class));
	}
	public int editItem(Category cat) {
		return jdbcTemplate.update(Update, new Object[] {cat.getCname(),cat.getCid()});
	}
	public int total() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS dem from categories", Integer.class);
	}
	public List<Category> getitems(int page){
		return (List<Category>) jdbcTemplate.query(FIND_BY_PAGE,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement pst) throws SQLException {
				pst.setInt(1, page);
			}
		}, new BeanPropertyRowMapper<>(Category.class));
	}
}
