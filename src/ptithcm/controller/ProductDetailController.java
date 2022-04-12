package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.CartsEntity;
import ptithcm.entity.CustomersEntity;
import ptithcm.entity.ProductsEntity;
import ptithcm.entity.SizesEntity;
import ptithcm.entity.SmallPhotosEntity;

@Transactional
@Controller
@RequestMapping("products/")
public class ProductDetailController {
	
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
	@ModelAttribute("sizes")
	public List<SizesEntity> getSizes(){
		Session session = factory.getCurrentSession(); 
		String hql = "FROM SizesEntity";
		Query query = session.createQuery(hql);
		List<SizesEntity> list = query.list();
		return list;
	}
	public ProductsEntity getProduct(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductsEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ProductsEntity list = (ProductsEntity) query.list().get(0);
		return list;
	}
	@RequestMapping(value="detail/{id}/{idproduct}")
	public String products_detal(HttpServletRequest request, ModelMap model, @PathVariable("id") Integer id,
			@PathVariable("idproduct") Integer idproduct){
		model.addAttribute("name", getCustomer(id).getName());
		
		ProductsEntity product = getProduct(idproduct);
		model.addAttribute("product", product);
		model.addAttribute("check",product.getSmallphotos().size());
		
		model.addAttribute("cart", new CartsEntity());
		return "products/detal/product";
	}
	
	
}
