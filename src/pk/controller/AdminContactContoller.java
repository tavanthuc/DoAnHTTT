package pk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pk.constant.Defines;
import pk.model.bean.Contact;
import pk.model.dao.ContactDao;

@Controller
@RequestMapping("admin/contact")
public class AdminContactContoller {
	@Autowired
	private ContactDao contactDao;

	@GetMapping({  "index" })
	public String index( ModelMap modelMap) {
		List<Contact> lcontact= contactDao.getitems();
		modelMap.addAttribute("lcontact", lcontact);
		return "cland.admin.contact.index";
	}

	

	@GetMapping("del/{cid}")
	public String del(@PathVariable(name = "cid") int cid, RedirectAttributes ra) {
		if (contactDao.delitem(cid) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);

		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
		}
		return "redirect:/admin/contact/index";
	}
}
