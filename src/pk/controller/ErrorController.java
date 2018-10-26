package pk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	@GetMapping("404.html")
	public String index() {
		return "error/404";
	}
}
