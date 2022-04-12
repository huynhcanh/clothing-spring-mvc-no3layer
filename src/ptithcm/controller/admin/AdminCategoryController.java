package ptithcm.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.CategoriesEntity;
import ptithcm.entity.ProductsEntity;
import ptithcm.service.ICategoryService;
import ptithcm.service.IProductService;

@Controller
@RequestMapping("/admin/category/")
public class AdminCategoryController {

	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IProductService productService;
	
	@ModelAttribute("Cates")
	public List<CategoriesEntity> listCate() {
		return categoryService.findAll();
	}
	
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("category", new CategoriesEntity());
		model.addAttribute("list", categoryService.findAll());
		return "admin_v1/category/index";
	}
	
	@RequestMapping("create")
	public String create(Model model, RedirectAttributes params, @Validated CategoriesEntity form,
			BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng không bỏ trống các trường bên trên");
			model.addAttribute("category", new CategoriesEntity());
			model.addAttribute("list", categoryService.findAll());
			return "admin_v1/category/index";
		}
		categoryService.add(form);
		params.addAttribute("message", "Thêm mới thành công");
		return "redirect:/admin/category/index.htm";
	}
	
	@RequestMapping("edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		model.addAttribute("category", categoryService.findById(id));
		model.addAttribute("list", categoryService.findAll());
		return "admin_v1/category/index";
	}

	@RequestMapping("update")
	public String update(Model model, RedirectAttributes params, @Validated CategoriesEntity form,
			BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng không bỏ trống các trường bên trên");
			model.addAttribute("category", new CategoriesEntity());
			model.addAttribute("list", categoryService.findAll());
			return "admin_v1/category/index";
		}
		categoryService.update(form);
		params.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/category/edit/" + form.getId()+".htm";
	}

	@RequestMapping("delete/{id}")
	public String delete(Model model, RedirectAttributes params, @PathVariable("id") Integer id) {
		List<ProductsEntity> pr = productService.findByCategoryId(id);
		if(pr.isEmpty() == true)
		{
			categoryService.delete(id);
			params.addAttribute("message", "Xóa thành công");
		}
		else
			params.addAttribute("message", "Xóa không thành công");
		return "redirect:/admin/category/index.htm";
	}


}

