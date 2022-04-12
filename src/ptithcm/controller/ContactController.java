package ptithcm.controller;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.CustomersEntity;

@Transactional
@Controller
public class ContactController {
	
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
	@RequestMapping("contact/index/{id}")
	public String index(ModelMap model, @PathVariable("id") Integer id){
		
		model.addAttribute("name", getCustomer(id).getName());

		return "contact/index";
	}
}
