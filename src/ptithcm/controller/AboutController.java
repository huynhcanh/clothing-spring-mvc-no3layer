package ptithcm.controller;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.ChangePassword;
import ptithcm.bean.UpdateInfo;
import ptithcm.entity.CustomersEntity;

@Transactional
@Controller
@RequestMapping("about/")
public class AboutController {
	
	@Autowired
	SessionFactory factory;
	
	public CustomersEntity getCustomer(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CustomersEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomersEntity customer = (CustomersEntity)query.list().get(0);
		return customer;
	}
	@RequestMapping(value="index/{id}")
	public String index(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("name", getCustomer(id).getName());
		model.addAttribute("email", getCustomer(id).getEmail());
		UpdateInfo updateinfo = new UpdateInfo(getCustomer(id).getName(), getCustomer(id).getPhone());
		model.addAttribute("updateinfo", updateinfo);
		return "about/index";
	}
	
	
	public Integer updateCustomer(CustomersEntity customer) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(customer);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	@RequestMapping(value="update/{id}", method=RequestMethod.POST)
	public String update(ModelMap model, @PathVariable("id") Integer id,
			@Validated @ModelAttribute("updateinfo") UpdateInfo updateinfo, BindingResult errors){
		
		model.addAttribute("name", getCustomer(id).getName());
		if (errors.hasErrors()) {
			return "about/index";
		}
		CustomersEntity customer = getCustomer(id);
		customer.setName(updateinfo.getName());
		customer.setPhone(updateinfo.getPhone());
		System.out.println(this.updateCustomer(customer));
		model.addAttribute("message", "<h3 style='color:green;'>Update Success</h3>");
		index(model,id);
		return "about/index";
	}
	
	
	
	@RequestMapping(value="change-password/{id}")
	public String changePassword(ModelMap model, @PathVariable("id") Integer id) {

		model.addAttribute("name", getCustomer(id).getName());
		model.addAttribute("changepassword", new ChangePassword());
		return "about/change-password";
	}
	@RequestMapping(value="change-password/{id}", method=RequestMethod.POST)
	public String changePassword(ModelMap model, @PathVariable("id") Integer id,
			@Validated @ModelAttribute("changepassword") ChangePassword changepassword, BindingResult errors){
		model.addAttribute("name", getCustomer(id).getName());
		if (errors.hasErrors()) {
			return "about/change-password";
		}
		
		String password = getCustomer(id).getPassword();
		
		String oldPassword = changepassword.getOldpassword();
		String newPassword = changepassword.getNewpassword();
		String confirmPassword = changepassword.getConfirmpassword();
		
		if(oldPassword.equals(password) && newPassword.equals(confirmPassword)) {
			Session session = factory.getCurrentSession();
			String hql = "FROM CustomersEntity where id = :id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			CustomersEntity customer = (CustomersEntity) query.list().get(0);
			customer.setPassword(confirmPassword);
			
			this.updateCustomer(customer);
			model.addAttribute("message", "<h3 style='color:green;'>Change password success</h3>");
		}else {
			model.addAttribute("message", "<h3 style='color:red;margin-top: 25px;'>Change password Unsuccessful </h3>");
		}
		return "about/change-password";
	}
}
