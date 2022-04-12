package ptithcm.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
	@RequestMapping("/admin/home/index")
	public String home() {
		return "admin_v1/layout";
	}

}
