package pk.controller;

import java.util.List;

import javax.servlet.ServletContext;
import java.io.File;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pk.constant.Defines;
import pk.model.bean.Category;
import pk.model.bean.Land;
import pk.model.bean.Student;
import pk.model.dao.Categorydao;
import pk.model.dao.LandDAO;
import pk.model.dao.StudentDAO;

@Controller
@RequestMapping("admin/student")
public class AdminStudentController {
	@Autowired
	private StudentDAO studentdao;
	@Autowired
	private Categorydao catdao;
	@Autowired
	private ServletContext servletContext;
	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<Student> lStudent=studentdao.getitems();
		modelMap.addAttribute("lStudent", lStudent);
		return "cland.admin.student.index";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		return "cland.admin.student.add";
	}
	@PostMapping("add")
	public String add(@ModelAttribute("objstudent") Student objstudent,RedirectAttributes ra) {
		if(studentdao.additem(objstudent)>0) {
			ra.addFlashAttribute("msg",Defines.MSG_UPDATE_SUCCESS);
		}else {
			ra.addFlashAttribute("msg",Defines.MSG_ERROR);
		}
		
		return "redirect:/admin/student/index?msg=0";
		
	}

	@GetMapping("edit/{id}")
	public String add(@PathVariable(name="id")  Integer id,ModelMap modelMap) {
		Student stitem=studentdao.getItem(id);
		modelMap.addAttribute("stitem", stitem);
		return "cland.admin.student.edit";
	}
	@PostMapping("edit")
	public String edit(@ModelAttribute("objstudent") Student objstudent,RedirectAttributes ra) {
		
		if(studentdao.additem(objstudent)>0) {
			ra.addFlashAttribute("msg",Defines.MSG_UPDATE_SUCCESS);
		}else {
			ra.addFlashAttribute("msg",Defines.MSG_ERROR);
		}
		
		return "redirect:/admin/student/index";
		
	}
	@GetMapping("del/{id}")
	public String del(@PathVariable(name = "lid") int id, RedirectAttributes ra) {
		if (studentdao.delitem(id) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);

		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}
		return "redirect:/admin/student/index";
	}
	
	
}
