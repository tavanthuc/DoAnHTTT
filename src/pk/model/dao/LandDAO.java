package pk.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import pk.constant.Defines;
import pk.model.bean.Category;
import pk.model.bean.Land;

@Repository
public class LandDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private String FIND_ALL1="SELECT l.*,cname FROM lands AS l  INNER JOIN categories AS c ON l.cid=c.cid ORDER BY lid DESC LIMIT ?,?";
	private String FIND_ALL="SELECT l.*,cname FROM lands AS l  INNER JOIN categories AS c ON l.cid=c.cid ORDER BY lid DESC ";
	private String FIND_byid="SELECT l.*,cname FROM lands AS l  INNER JOIN categories AS c ON l.cid=c.cid  WHERE c.cid=? ORDER BY l.lid DESC ";
	private String FIND_BY_ID="SELECT * FROM lands WHERE lid=?";
	private String INSERT="INSERT INTO lands(lname,cid,picture,area,address,description) VALUE(?,?,?,?,?,?)";
	private String UPDATE ="UPDATE lands SET lname=?,cid=?,picture=?,area=?,address=?,description=? WHERE lid=? ";
	private String DELETE="DELETE FROM lands WHERE lid=?";
	
	public List<Land> getitems() {
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(Land.class));
	}
	public List<Land> getitems1(int offset) {
		return jdbcTemplate.query(FIND_ALL1,new Object[] {offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<>(Land.class));
	}
	public int additem(Land land) {
		return jdbcTemplate.update(INSERT,new  Object[] {land.getLname(),land.getCid(),land.getPicture(),land.getArea(),land.getAddress(),land.getDescription()});
	}
	public int delitem(int cid) {
		
		return jdbcTemplate.update(DELETE, new Object[] {cid});
	}
	public Land getItem(int lid) {
		return jdbcTemplate.queryForObject(FIND_BY_ID, new Object[] {lid},new BeanPropertyRowMapper<>(Land.class));
	}
	public int Update(Land land,int lid) {
		return jdbcTemplate.update(UPDATE, new Object[] {land.getLname(),land.getCid(),land.getPicture(),land.getArea(),land.getAddress(),land.getDescription(),lid});
	}
	public int totalItems() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS dem from lands", Integer.class);
	}
	public List<Land> getitems(Integer id) {
		
		return jdbcTemplate.query(FIND_byid,new Object[] {id}, new BeanPropertyRowMapper<>(Land.class));
	}
}
