package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.CartsEntity;
import ptithcm.entity.CustomersEntity;
import ptithcm.entity.ProductsEntity;
import ptithcm.entity.SizesEntity;
@Transactional
@Controller
public class HomeController {
	
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
	public List<ProductsEntity> getProducts(){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM ProductsEntity";
		Query query = session.createQuery(hql);
		List<ProductsEntity> list = query.list();
		
		return list;
	}
	
	@RequestMapping("home/index/{id}")
	public String home(ModelMap model, @PathVariable("id") Integer id){
		List<ProductsEntity> products = this.getProducts();
		model.addAttribute("name", getCustomer(id).getName());
		model.addAttribute("products", products);
	
		return "home/index";
	}
	

}
