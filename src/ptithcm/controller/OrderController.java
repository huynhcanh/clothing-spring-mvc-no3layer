package ptithcm.controller;

import java.util.Date;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.ChangePassword;
import ptithcm.bean.UpdateInfo;
import ptithcm.entity.CartsEntity;
import ptithcm.entity.CategoriesEntity;
import ptithcm.entity.CustomersEntity;
import ptithcm.entity.OrderDetailsEntity;
import ptithcm.entity.OrdersEntity;
import ptithcm.entity.ProductsEntity;
import ptithcm.entity.ProductsSizesEntity;

@Transactional
@Controller
@RequestMapping("order/")
public class OrderController {
	
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
		CustomersEntity customer = getCustomer(id);
		model.addAttribute("name", customer.getName());
		model.addAttribute("customer", customer);
		
		Float totalorderamount = new Float(0);
		for(CartsEntity cart: customer.getCart()) {
			totalorderamount+=cart.getTotalMoney();
		}
		model.addAttribute("totalorderamount", totalorderamount);
		
		return "order/index";
	}
	
	
	public Integer insertOrder(OrdersEntity order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(order);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public Integer insertOrderDetail(OrderDetailsEntity orderDetail) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(orderDetail);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public Integer deleteCartByIdCustomer(Integer idCustomer) {
		Session session = factory.openSession();

		String hql = "DELETE FROM CartsEntity WHERE customer.id = :idCustomer";
		Query query = session.createQuery(hql);
		query.setParameter("idCustomer", idCustomer);
		int result = query.executeUpdate();
		
		return result;
	}
	void pushDataCartToOrdeDetal(CustomersEntity customer, OrdersEntity order) {
		for(CartsEntity cart: customer.getCart()) {
			OrderDetailsEntity orderDetail = new OrderDetailsEntity(cart.getQuantity(), cart.getTotalMoney(),
					order,cart.getProductsize());
			
			Integer temp1 = this.insertOrderDetail(orderDetail);
			if (temp1 != 0) {
				System.out.println("Add OrderDetail Success");
			} else {
				System.out.println("Add OrderDetail Fail");
			}
		}
	}
	public Integer updateProductSizeEntity(ProductsSizesEntity ps) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(ps);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	void reduceQuantity(CustomersEntity customer) {
		List<CartsEntity> list = (List<CartsEntity>) customer.getCart();
		for(CartsEntity cart: list) {
			ProductsSizesEntity productsizeentity = cart.getProductsize();
			productsizeentity.setQuantity(productsizeentity.getQuantity() - cart.getQuantity());
			updateProductSizeEntity(productsizeentity);
		}
	}
	@RequestMapping(value="confirm-order/{id}")
	public String confirmOrder(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest request) {
		
		CustomersEntity customer = getCustomer(id);
		model.addAttribute("name", customer.getName());
		Float totalorderamount = new Float(0);
		for(CartsEntity cart: customer.getCart()) {
			totalorderamount+=cart.getTotalMoney();
		}
		model.addAttribute("totalorderamount", totalorderamount);
		
		String address = request.getParameter("address");
		if(address.equals("")) {
			model.addAttribute("customer", customer);
			model.addAttribute("messageAddress", "<br><div style='color:red;'> Address is not empty! </div>");
			return "order/index";
		} else {
			OrdersEntity order = new OrdersEntity(new Date().toString(),totalorderamount, address, customer);	
			Integer temp = this.insertOrder(order);
			if (temp != 0) {
				System.out.println("Add Order Success");
				pushDataCartToOrdeDetal(customer,order);
				reduceQuantity(customer);
				System.out.println("Rows affected: " + deleteCartByIdCustomer(customer.getId()));
				return "order/orderSuccess";
			} else {
				System.out.println("Add Order Fail");
				return "order/index";
			}
		}
	}
}
