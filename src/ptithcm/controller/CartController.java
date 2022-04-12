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
import ptithcm.entity.ProductsEntity;
import ptithcm.entity.ProductsSizesEntity;
import ptithcm.entity.SizesEntity;

@Transactional
@Controller
@RequestMapping("cart/")
public class CartController {
	
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("sizes")
	public List<SizesEntity> getSizes(){
		Session session = factory.getCurrentSession(); 
		String hql = "FROM SizesEntity";
		Query query = session.createQuery(hql);
		List<SizesEntity> list = query.list();
		return list;
	}
	public List<CartsEntity> getCarts(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CartsEntity where customer.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<CartsEntity> carts = query.list();
		return carts;
	}
	@RequestMapping("index/{id}")
	public String showCart(ModelMap model, @PathVariable("id") Integer id){
		model.addAttribute("name", getCustomer(id).getName());
		List<CartsEntity> carts = this.getCarts(id);
		model.addAttribute("carts", carts);
		
		model.addAttribute("statusEdit", false);
		
		Float total = new Float(0);
		for (CartsEntity cart : carts) {
		    total +=cart.getTotalMoney();
		}
		model.addAttribute("total", total);
		return "cart/index";
	}
	
	
	

	public CustomersEntity getCustomer(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CustomersEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomersEntity customer = (CustomersEntity)query.list().get(0);
		return customer;
	}
	public ProductsSizesEntity getProductSize(Integer idproduct, Integer idsize){
		
		Session session = factory.getCurrentSession();  
		String hql = "FROM ProductsSizesEntity where product.id = :idproduct AND size.id = :idsize";
		Query query = session.createQuery(hql);
		query.setParameter("idproduct", idproduct);
		query.setParameter("idsize", idsize);
		ProductsSizesEntity productsize = (ProductsSizesEntity)query.list().get(0);
		return productsize;
	}
	public Integer insertCart(CartsEntity cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public ProductsEntity getProductEntity(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM ProductsEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ProductsEntity p = (ProductsEntity)query.list().get(0);
		return p;
	}
	@RequestMapping(value="index/{id}/{idproduct}", method=RequestMethod.GET)
	public String insertProductForCart(ModelMap model, @PathVariable("id") Integer id,
			@PathVariable("idproduct") Integer idproduct){
		
		
		
		
		
		
		model.addAttribute("name", getCustomer(id).getName());
		model.addAttribute("message", "<div style='color:red'> Product quantity is not enough" + "</div>");
		ProductsEntity product = getProductEntity(idproduct);
		model.addAttribute("product", product);
		model.addAttribute("check",product.getSmallphotos().size());
		
		model.addAttribute("cart", new CartsEntity());
		return "products/detal/product";
		
	}
	@RequestMapping(value="index/{id}/{idproduct}", method=RequestMethod.POST)
	public String insertProductForCart(ModelMap model, @PathVariable("id") Integer id,
			@PathVariable("idproduct") Integer idproduct, @ModelAttribute("cart") CartsEntity cart){
		
		CustomersEntity customer = getCustomer(id);
		model.addAttribute("name", customer.getName());
		
		
		ProductsSizesEntity productsize = this.getProductSize(idproduct,cart.getProductsize().getSize().getId());
		
		
		if(productsize.getQuantity() < cart.getQuantity()) {
			return "redirect:" + idproduct + ".htm";
		}
		
		cart.setCustomer(customer);
		cart.setProductsize(productsize);
		cart.setTotalMoney(cart.getProductsize().getProduct().getSalePrice() *
				(100-cart.getProductsize().getProduct().getDiscount())/100 * cart.getQuantity());
		Integer temp = this.insertCart(cart);
		if (temp != 0) {
			System.out.println("Add Success");
		} else {
			System.out.println("Add Fail");
		}
		showCart(model,id);
		return "cart/index";
	}
	
	
	
	
	
	
	
	
	
	public CartsEntity getCart(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CartsEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CartsEntity cart = (CartsEntity)query.list().get(0);
		return cart;
	}
	public Integer deleteCart(CartsEntity cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	@RequestMapping(value="product/remove/{id}/{idcart}")
	public String deleteCart(HttpServletRequest request, ModelMap model, @PathVariable("id") Integer id,
			 @PathVariable("idcart") Integer idcart){
		
		model.addAttribute("name", getCustomer(id).getName());
		
		Integer temp = this.deleteCart(this.getCart(idcart));
		if (temp != 0) {
			System.out.println("Delete Success");
		} else {
			System.out.println("Delete Fail");
		}
		showCart(model,id);
		return "cart/index";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="product/showFormEdit/{id}/{idcart}")
	public String showFormEditCart(HttpServletRequest request, ModelMap model, @PathVariable("id") Integer id,
			 @PathVariable("idcart") Integer idcart){
		
		model.addAttribute("name", getCustomer(id).getName());
		
		model.addAttribute("statusEdit", true);
		CartsEntity cart = getCart(idcart);
		model.addAttribute("cart", cart);
		
		List<CartsEntity> carts = this.getCarts(id);
		model.addAttribute("carts", carts);
		
		
		Double total = 0.0;
		for (CartsEntity c : carts) {
		    total +=c.getTotalMoney();
		}
		model.addAttribute("total", total);
		return "cart/index";
	}
	public Integer editCart(CartsEntity cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	@RequestMapping(value="product/edit/{id}/{idcart}", method=RequestMethod.POST)
	public String EditCart(HttpServletRequest request, ModelMap model, @PathVariable("id") Integer id,
			@PathVariable("idcart") Integer idcart, @ModelAttribute("cart") CartsEntity cart){
		
		model.addAttribute("name", getCustomer(id).getName());
		
		CartsEntity c = getCart(idcart);
		
		cart.setId(c.getId());
		cart.setCustomer(c.getCustomer());
		ProductsSizesEntity productsize = this.getProductSize(c.getProductsize().getProduct().getId(),
				cart.getProductsize().getSize().getId());
		cart.setProductsize(productsize);
		cart.setTotalMoney(cart.getProductsize().getProduct().getSalePrice() *
				(100-cart.getProductsize().getProduct().getDiscount())/100 * cart.getQuantity());
		
		Integer temp = this.editCart(cart);
		if (temp != 0) {
			System.out.println("Edit Success");
		} else {
			System.out.println("Edit Fail");
		}
		
		return "redirect:/cart/index/" +  id + ".htm";
	}
}