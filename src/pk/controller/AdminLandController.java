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
import pk.model.dao.Categorydao;
import pk.model.dao.LandDAO;

@Controller
@RequestMapping("admin/land")
public class AdminLandController {
	@Autowired
	private LandDAO landdao;
	@Autowired
	private Categorydao catdao;
	@Autowired
	private ServletContext servletContext;
	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<Land> lland=landdao.getitems();
		modelMap.addAttribute("lland", lland);
		return "cland.admin.land.index";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Category> lcat= catdao.getitems();
		modelMap.addAttribute("lcat", lcat);
		return "cland.admin.land.add";
	}
	@PostMapping("add")
	public String add(@ModelAttribute("objland") Land objLand,@RequestParam("pt") CommonsMultipartFile cmf,RedirectAttributes ra) {
		
		String filePath = null;
		String filename = cmf.getOriginalFilename();

		String fileextention = FilenameUtils.getExtension(filename);
		String baseName = FilenameUtils.getBaseName(fileextention);
		filename = baseName + "-" + System.nanoTime() + "." + fileextention;
		// ------------------

		// -----------------
		System.out.println("loi me no rồi");
		try {
			String dirPath = servletContext.getRealPath("") + Defines.DIR_UPLOAD;
			// tao duong dan thu muc /keim tra co hoac ko
			// tao duong dan file
			System.out.println("da toi day");
			File dirFile = new File(dirPath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			// duong dẫn file
			try {
				filePath = dirPath + File.separator + filename;
			} catch (Exception e) {
				System.out.println("da td");
			}

			// ghi file
			cmf.transferTo(new File(filePath));
			ra.addFlashAttribute("filename", filename);
			
			System.out.println("filepath: " + filePath);

		} catch (Exception e) {
			
			return "redirect:/admin/land/add";
		}
		Land land= new Land(objLand.getLname(), objLand.getDescription(), objLand.getCid(), filename, objLand.getArea(), objLand.getAddress());
		landdao.additem(land);
		return "redirect:/admin/land/index";
		
	}
	@GetMapping("del/{lid}")
	public String del(@PathVariable(name = "lid") int lid, RedirectAttributes ra) {
		Land objland= landdao.getItem(lid);
		String filename=objland.getPicture();
		if(!"".equals(filename)) {
			String filePath=servletContext.getRealPath("") + Defines.DIR_UPLOAD +File.separator + filename;
			File file= new File(filePath);
			file.delete();
		}
		if (landdao.delitem(lid) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);

		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}
		return "redirect:/admin/land/index";
	}
	//-----------------------------------------
	//edit
	@GetMapping("edit/{lid}")
	public String edit(@PathVariable(name="lid") Integer lid, ModelMap modelMap) {
		List<Category> lcat= catdao.getitems();
		Land llandd=landdao.getItem(lid);
		modelMap.addAttribute("lcat", lcat);
		modelMap.addAttribute("llandd", llandd);
		return "cland.admin.land.edit";
	}
	@PostMapping("edit/{lid}")
	public String edit(@PathVariable(name="lid") Integer lid,@ModelAttribute("objland") Land objLand,@RequestParam("pt") CommonsMultipartFile cmf,RedirectAttributes ra) {
		
		String filePath = null;
		String filename = cmf.getOriginalFilename();

		String fileextention = FilenameUtils.getExtension(filename);
		String baseName = FilenameUtils.getBaseName(fileextention);
		filename = baseName + "-" + System.nanoTime() + "." + fileextention;
		// ------------------

		// -----------------
		System.out.println("loi me no rồi");
		try {
			String dirPath = servletContext.getRealPath("") + Defines.DIR_UPLOAD;
			// tao duong dan thu muc /keim tra co hoac ko
			// tao duong dan file
			System.out.println("da toi day");
			File dirFile = new File(dirPath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			// duong dẫn file
			try {
				filePath = dirPath + File.separator + filename;
			} catch (Exception e) {
				System.out.println("da td");
			}

			// ghi file
			cmf.transferTo(new File(filePath));
			ra.addFlashAttribute("filename", filename);
			
			System.out.println("filepath: " + filePath);

		} catch (Exception e) {
			
			return "redirect:/admin/land/edit";
		}
		Land land= new Land(objLand.getLname(), objLand.getDescription(), objLand.getCid(), filename, objLand.getArea(), objLand.getAddress());
		landdao.Update(land, lid);
		return "redirect:/admin/land/index";
		
	}
	
	
}
