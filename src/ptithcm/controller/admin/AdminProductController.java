package ptithcm.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.ProductsEntity;
import ptithcm.entity.ProductsSizesEntity;
import ptithcm.entity.SizesEntity;
import ptithcm.service.ICategoryService;
import ptithcm.service.IHttpService;
import ptithcm.service.IProductService;
import ptithcm.service.IProductSizeService;
import ptithcm.service.ISizeService;

@Controller
@RequestMapping("/admin/product/")
public class AdminProductController {
	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private ISizeService sizeService;

	@Autowired
	private IProductSizeService productSizeService;

	@Autowired
	private IHttpService http;

	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("list", productService.findAll());
		model.addAttribute("product", new ProductsEntity());
		model.addAttribute("cates", categoryService.findAll());
		model.addAttribute("sizes", sizeService.findAll());

		return "admin_v1/product/index";
	}

	@RequestMapping("edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		// Run form
		model.addAttribute("list", productService.findAll());
		model.addAttribute("cates", categoryService.findAll());

		// Get product by id
		ProductsEntity pd = productService.findById(id);
		model.addAttribute("product", pd);

		// Get list ProductSize by Product id
		Collection<ProductsSizesEntity> clPds = pd.getProductsize();
		List<ProductsSizesEntity> arPds = new ArrayList<>(clPds);
//		System.out.println(arPds.size());
		// Get list Size from List Product Size
		List<SizesEntity> listS = new ArrayList<SizesEntity>();
		for (ProductsSizesEntity productsSizesEntity : arPds) {
			listS.add(productsSizesEntity.getSize());
		}
//		System.out.println(listS.size());
		model.addAttribute("sizes", listS);
		return "admin_v1/product/index";
	}

	@RequestMapping("create")
	public String create(Model model, RedirectAttributes params, @Validated ProductsEntity form, BindingResult errors,
			@RequestParam("image_file") MultipartFile file) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng không bỏ trống các trường bên trên");
			model.addAttribute("list", productService.findAll());
			model.addAttribute("product", new ProductsEntity());
			model.addAttribute("cates", categoryService.findAll());
			model.addAttribute("sizes", sizeService.findAll());
			return "admin_v1/product/index";
		}
		File image = http.saveProductPhoto(file);
		if (image != null) {
			form.setImage(image.getName());
		}
		//Add product
		productService.add(form);
		SizesEntity size = sizeService.findById(form.getSize());
		//Add productSize match product
		ProductsSizesEntity proSize = new ProductsSizesEntity();
		proSize.setProduct(form);
		proSize.setSize(size);
		proSize.setQuantity(form.getQuantity());

		productSizeService.add(proSize);

		productService.findById(form.getSize());

		params.addAttribute("message", "Thêm mới thành công");
		return "redirect:/admin/product/index.htm";
	}

	@RequestMapping("update")
	public String update(Model model, RedirectAttributes params, @Validated ProductsEntity form, BindingResult errors,
			@RequestParam("image_file") MultipartFile file) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng không bỏ trống các trường bên trên");
			return "admin_v1/product/index";
		}
		File photo = http.saveProductPhoto(file);
		if (photo != null) {
			form.setImage(photo.getName());
		}
		else
			model.addAttribute("message", "Lỗi lưu ảnh về database");
		productService.update(form);
		System.out.println(form.getId());
		System.out.println(form.getSize());
		// tim trong productsize co cai nao chua product va size dang xoa
		List<ProductsSizesEntity> list = productSizeService.findByIdProduct(form.getId(), form.getSize());
		if (list != null && list.size() > 0) {
			list.get(0).setQuantity(form.getQuantity());
		} else {
			params.addAttribute("message", "Cập nhật không thành công");
			return "redirect:/admin/product/edit/" + form.getId() + ".htm";
		}
		productSizeService.update(list.get(0));

		params.addAttribute("message", "Cập nhật thành công");
		return "redirect:/admin/product/edit/" + form.getId() + ".htm"; // redirect giữ lại dữ liệu
	}

	@RequestMapping("delete/{id}")
	public String delete(Model model, RedirectAttributes params, @PathVariable("id") Integer id) {
		productService.delete(id);
		params.addAttribute("message", "Xóa thành công");
		return "redirect:/admin/product/index.htm";
	}
}
