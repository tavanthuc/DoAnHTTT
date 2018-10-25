package pk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pk.constant.Defines;
import pk.model.bean.Category;
import pk.model.dao.Categorydao;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	@Autowired
	private Categorydao catDAO;

	@GetMapping({ "index/{page}", "index" })
	public String index(@PathVariable(name = "page", required = false) Integer page, ModelMap modelMap) {
		List<Category> list = null;
		int tongsodm = catDAO.total();
		int tongsopage = (int) Math.ceil(((float) tongsodm / 2));

		int offset = 0;
		if (page != null) {
			if (page < 1 || page > tongsopage) {
				list = catDAO.getitems(0);
				modelMap.addAttribute("sopage", page);
			} else {
				offset = (page - 1) * 2;
				list = catDAO.getitems(offset);
			}
		} else {
			list = catDAO.getitems(0);
		}
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("offset", offset);
		modelMap.addAttribute("tongsopage", tongsopage);
		modelMap.addAttribute("page", page);
		return "cland.admin.cat.index";
	}

	@GetMapping("add")
	public String add() {
	

		return "cland.admin.cat.add";
	}

	@GetMapping("edit/{cid}")
	public String edit(@PathVariable(name = "cid") int cid, RedirectAttributes ra, ModelMap modelMap) {

		Category cat = catDAO.getItem(cid);
		modelMap.addAttribute("cat", cat);
		return "cland.admin.cat.edit";
	}

	@PostMapping("add")
	public String add(@ModelAttribute("objcat") Category objcat, RedirectAttributes ra) {
		// xu ly vali ve nha
		if (catDAO.additem(objcat) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/admin/cat/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}

		return "redirect:/admin/cat/add";
	}

	@PostMapping("edit/{cid}")
	public String edit(@ModelAttribute("objcat") Category objcat, RedirectAttributes ra) {
		// xu ly vali ve nha
		if (catDAO.editItem(objcat) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
			return "redirect:/admin/cat/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}

		return "redirect:/admin/cat/edit/" + objcat.getCid();
	}

	@GetMapping("del/{cid}")
	public String del(@PathVariable(name = "cid") int cid, RedirectAttributes ra) {
		if (catDAO.delitem(cid) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);

		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}
		return "redirect:/admin/cat/index";
	}
}
