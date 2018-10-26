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

import pk.constant.Defines;
import pk.model.bean.Category;
import pk.model.bean.Contact;
import pk.model.bean.Land;
import pk.model.dao.Categorydao;
import pk.model.dao.ContactDao;
import pk.model.dao.LandDAO;

@Controller
@RequestMapping("public")
public class PublicIndexController {
	@Autowired
	private LandDAO landdao;
	@Autowired
	private Categorydao catdao;
	@Autowired
	private ContactDao contactdao;
	@ModelAttribute
	public void commonObjects(ModelMap modelMap) {
		List<Category> listcat = catdao.getitems();
		List<Land> listland=landdao.getitems1(0);
		modelMap.addAttribute("listland", listland);
		modelMap.addAttribute("listcat", listcat);
		
	}
	@GetMapping({"index","index/{page}"})
	public String index(@PathVariable(name="page", required = false) Integer page, ModelMap modelMap) {
		if(page==null) {
			page=1;
		}
		int offset=(page-1)*Defines.ROW_COUNT;
		System.out.println(offset);
		List<Land> listLands = landdao.getitems1(offset);
		int total=landdao.totalItems();
		int tongsopage=(int) Math.ceil((float) total/Defines.ROW_COUNT);
		System.out.println(tongsopage);
		modelMap.addAttribute("tongsopage", tongsopage);
		modelMap.addAttribute("listLands", listLands);
		
		
		return "cland.public.index.index";
	}
	
	@GetMapping({"cat","cat/{id}"})
	public String cat(@PathVariable(name="id", required = false) Integer id,ModelMap modelMap) {
		if(id==null) {
			return "cland.public.index.index";
		}
		Category catitem=catdao.getItem(id);
		System.out.println("dtd");
		List<Land> listlandid=landdao.getitems(id);
		System.out.println("dtd2");
		modelMap.addAttribute("catitem", catitem);
		modelMap.addAttribute("listlandid", listlandid);
		return "cland.public.index.cat";
	}
	
	
	@GetMapping("/single/{name}-{id}.html")
	public String single(@PathVariable("name") String name,@PathVariable("id") int id,ModelMap modelMap) {
		Land landitem= landdao.getItem(id);
		Land item= landdao.getItem(id);
		List<Land> listrela= landdao.getitems(item.getCid());
		modelMap.addAttribute("listrela", listrela);
		modelMap.addAttribute("landitem", landitem);
		return "cland.public.index.single";
	}
	
	@GetMapping("contact")
	public String contact() {
		return "cland.public.index.contact";
	}
	@PostMapping("contact")
	public String contact(@Valid @ModelAttribute("objcontact") Contact objcontact,BindingResult br) {
		if(br.hasErrors()) {
			System.out.println("loi me no roi");
			return "cland.public.index.contact";
		}
		if(objcontact!=null) {
		contactdao.additem(objcontact);
		return "redirect:/public/index";
		}
		return "cland.public.index.index";
	}
}
