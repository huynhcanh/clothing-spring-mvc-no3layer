package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.CartsEntity;
import ptithcm.entity.CustomersEntity;
import ptithcm.entity.OrderDetailsEntity;
import ptithcm.entity.OrdersEntity;
import ptithcm.entity.ProductsSizesEntity;
import ptithcm.entity.SizesEntity;

@Transactional
@Controller
@RequestMapping("yourorders/")
public class YourOrdersController {
	
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
	public List<OrdersEntity> getOrdersByIdCustomer(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM OrdersEntity where customers.id = :id ORDER BY id DESC ";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<OrdersEntity> orders = query.list();
		return orders;
	}
	@RequestMapping("index/{id}")
	public String showOrders(ModelMap model, @PathVariable("id") Integer id){
		CustomersEntity customer = getCustomer(id);
		model.addAttribute("name", customer.getName());
		for(OrdersEntity order: customer.getOrders()) {
			System.out.println(order.getAdddress());
		}
		model.addAttribute("orders", getOrdersByIdCustomer(id));
		return "yourorders/index";
	}
	
	
	
	public OrdersEntity getOrder(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM OrdersEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		OrdersEntity order = (OrdersEntity)query.list().get(0);
		return order;
	}
	@RequestMapping("detail/{id}/{idorder}")
	public String detailOrder(ModelMap model, @PathVariable("id") Integer id, @PathVariable("idorder") Integer idorder){
		CustomersEntity customer = getCustomer(id);
		model.addAttribute("name", customer.getName());
		
		List<OrderDetailsEntity> orderdetails = (List<OrderDetailsEntity>) getOrder(idorder).getOrderdetails();
		model.addAttribute("orderdetails", getOrder(idorder).getOrderdetails());
		
		Float total = new Float(0);
		for (OrderDetailsEntity od : orderdetails) {
		    total +=od.getTotalMoney();
		}
		model.addAttribute("total", total);
		
		return "yourorders/detail";
	}
	
}