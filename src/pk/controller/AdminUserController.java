package pk.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pk.constant.Defines;
import pk.model.bean.User;
import pk.model.dao.UserDao;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired
	private UserDao UserDao;

	@GetMapping("index")
	public String index(ModelMap modelMap) {
		List<User> listt = UserDao.getitems();
		modelMap.addAttribute("listt", listt);

		return "cland.admin.user.index";
	}

	@RequestMapping("add")
	public String add() {
		return "cland.admin.user.add";
	}

	@GetMapping("edit/{id}")
	public String edit(@PathVariable(name = "id") int id, RedirectAttributes ra, ModelMap modelMap) {

		User user = UserDao.getItem(id);
		modelMap.addAttribute("user", user);
		return "cland.admin.user.edit";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objuser") User objuser, BindingResult rs, RedirectAttributes ra) {
		// xu ly vali ve nha
		if (rs.hasErrors()) {
			
			return "cland.admin.user.add";
		}
		if (UserDao.additem(objuser) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/admin/user/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}

		return "redirect:/admin/user/add";
	}

	@PostMapping("edit/{id}")
	public String edit(@PathVariable(name = "id") Integer id, @ModelAttribute("objuser") User objuser,
			RedirectAttributes ra) {
		// xu ly vali ve nha
		if (UserDao.editItem(objuser, id) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
			return "redirect:/admin/user/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}

		return "redirect:/admin/user/edit/" + objuser.getId();
	}

	@GetMapping("del/{id}")
	public String del(@PathVariable(name = "id") int id, RedirectAttributes ra) {
		if (UserDao.delitem(id) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);

		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}
		return "redirect:/admin/user/index";
	}
}