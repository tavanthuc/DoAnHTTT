package pk.model.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import pk.constant.Defines;
import pk.model.bean.Category;
import pk.model.bean.Land;
import pk.model.bean.Student;

@Repository
public class StudentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private String FIND_ALL1="SELECT l.*,cname FROM lands AS l  INNER JOIN categories AS c ON l.cid=c.cid ORDER BY lid DESC LIMIT ?,?";
	private String FIND_ALL="SELECT * FROM hocsinhtrungtuyen  ORDER BY id DESC ";
	private String FIND_BY_ID="SELECT * FROM hocsinhtrungtuyen WHERE id=?";
	private String INSERT="INSERT INTO hocsinhtrungtuyen(NAME,CMND,BIRTHDAY,SEX,ADDRESS) VALUE(?,?,?,?,?)";
	private String UPDATE ="UPDATE lands SET lname=?,cid=?,picture=?,area=?,address=?,description=? WHERE lid=? ";
	private String DELETE="DELETE FROM hocsinhtrungtuyen WHERE id=?";
	
	public List<Student> getitems() {
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<>(Student.class));
	}
	public List<Land> getitems1(int offset) {
		return jdbcTemplate.query(FIND_ALL1,new Object[] {offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<>(Land.class));
	}
	public int additem(Student student) {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		
		//String date = simpleDateFormat.format(new Date());
		return jdbcTemplate.update(INSERT,new  Object[] {student.getNAME(),student.getCMND(),simpleDateFormat.format(student.getBIRTHDAY()),student.getSEX(),student.getADDRESS()});
	}
	public int delitem(int id) {
		
		return jdbcTemplate.update(DELETE, new Object[] {id});
	}
	public Student getItem(int id) {
		return jdbcTemplate.queryForObject(FIND_BY_ID, new Object[] {id},new BeanPropertyRowMapper<>(Student.class));
	}
	public int Update(Land land,int lid) {
		return jdbcTemplate.update(UPDATE, new Object[] {land.getLname(),land.getCid(),land.getPicture(),land.getArea(),land.getAddress(),land.getDescription(),lid});
	}
	public int totalItems() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS dem from lands", Integer.class);
	}
}
