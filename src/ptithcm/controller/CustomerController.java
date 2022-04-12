package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptithcm.entity.CustomersEntity;
import ptithcm.model.SearchBody;

@Transactional
@Controller
@RequestMapping("Customer/")
public class CustomerController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("index")
	public String index(HttpServletRequest request, ModelMap model, @ModelAttribute("customer") CustomersEntity customer) {
		List<CustomersEntity> customers = this.getCustomers();
		PagedListHolder pagedListHolder = new PagedListHolder(customers);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(3);
		model.addAttribute("btnStatus", "btnAdd");
		model.addAttribute("pagedListHolder", pagedListHolder);

		return ("Customer/index");
	}
	
	@RequestMapping(value = "index", params = "btnAdd")
	public String addcustomer(HttpServletRequest request,ModelMap model, 
			@ModelAttribute("customer") CustomersEntity customer,BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng không bỏ trống các trường bên trên");
			return "admin_v1/product/index";
		}
		Integer temp = this.insertCustomer(customer);
		if (temp != 0) {
			model.addAttribute("message", "Thêm thành công");
		} else {
			model.addAttribute("message", "Thêm thất bại");
		}
		
		PagedListHolder pagedListHolder = new PagedListHolder(this.getCustomers());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "Customer/index";
	}
	
	@RequestMapping(value = "/index/{id}.htm", params = "linkDelete")
	public String deletecustomer(HttpServletRequest request, ModelMap model, @ModelAttribute("customer") CustomersEntity customer,
			@PathVariable("id") Integer id) {
		
		 
		Integer temp = this.deleteCustomer(this.getCustomer(id));
		if (temp != 0) {
			model.addAttribute("message", "Delete thành công");
		} else {
			model.addAttribute("message", "Delete thất bại!");
		}
		
		PagedListHolder pagedListHolder = new PagedListHolder(this.getCustomers());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);		
		pagedListHolder.setPageSize(5);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "Customer/index";
	}

	@RequestMapping(value = "index/{id}.htm", params = "linkEdit")
	public String editcustomer(HttpServletRequest request, ModelMap model,
			@ModelAttribute("customer") CustomersEntity customer, @PathVariable("id") Integer id) {

		PagedListHolder pagedListHolder = new PagedListHolder(this.getCustomers());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);		
		pagedListHolder.setPageSize(5);

		model.addAttribute("btnStatus", "btnEdit");
		model.addAttribute("customer", this.getCustomer(id));
		model.addAttribute("pagedListHolder", pagedListHolder);

		return "Customer/index";
	}

	@RequestMapping(value="index", params = "btnsearch")
	public String searchCustomer(HttpServletRequest request, ModelMap model,
			@ModelAttribute("customer") CustomersEntity customer) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.searchCustomer(request.getParameter("searchInput")));
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		
		pagedListHolder.setPageSize(5);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		 return "Customer/index";
	}
	@RequestMapping(value = "index", params = "btnEdit")
	public String edit_customer(HttpServletRequest request, ModelMap model,
			@ModelAttribute("customer") CustomersEntity customer) {

		Integer temp = this.updateCustomer(customer);
		if (temp != 0) {
			model.addAttribute("message", "Update thành công!");
		} else {
			model.addAttribute("message", "Update thất bại!");
		}

		PagedListHolder pagedListHolder = new PagedListHolder(this.getCustomers());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);

		return "Customer/index";
	}

	public List<CustomersEntity> getCustomers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomersEntity as pr order by pr.id desc";
		Query query = session.createQuery(hql);
		List<CustomersEntity> list = query.list();
		return list;
	}

	public CustomersEntity getCustomer(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomersEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomersEntity list = (CustomersEntity) query.list().get(0);

		return list;
	}

	public List<CustomersEntity> searchCustomer(String customer_name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomersEntity where name LIKE :customer_name";
		Query query = session.createQuery(hql);
		query.setParameter("customer_name", "%" +  customer_name + "%");
		List<CustomersEntity> list = query.list();
		return list;
	}

	public Integer insertCustomer(CustomersEntity pd) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pd);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer updateCustomer(CustomersEntity pd) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(pd);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer deleteCustomer(CustomersEntity pd) {
		Session session = factory.getCurrentSession();
		try {
			session.delete(pd);
			return 1;
		} catch (Exception e) {
			return 0;
		}
		
	}

	@RequestMapping(value="test",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public List<CustomersEntity> test(){
		List<CustomersEntity> lstcustomer = this.getCustomers();
		return lstcustomer;
	}
}
