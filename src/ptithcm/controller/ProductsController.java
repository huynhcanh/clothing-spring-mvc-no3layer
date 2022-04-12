package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.SortByPrice;
import ptithcm.entity.CategoriesEntity;
import ptithcm.entity.CustomersEntity;
import ptithcm.entity.ProductsEntity;
import ptithcm.entity.SizesEntity;

@Transactional
@Controller
@RequestMapping("products/")
public class ProductsController {
	
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("categories")
	public List<CategoriesEntity> getCategories(){
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CategoriesEntity";
		Query query = session.createQuery(hql);
		List<CategoriesEntity> list = query.list();
		list.add(0, new CategoriesEntity(0, "All")); // mac dinh All (0,"All")
		return list;
	}
	@ModelAttribute("sortbyprices")
	public List<SortByPrice> getSortByPrice(){
		List<SortByPrice> list = new ArrayList<>();
		list.add(new SortByPrice(0,"Default"));
		list.add(new SortByPrice(1,"Ascending"));
		list.add(new SortByPrice(2,"Descending"));
		return list;
	}
	public CustomersEntity getCustomer(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CustomersEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomersEntity customer = (CustomersEntity)query.list().get(0);
		return customer;
	}
	public List<ProductsEntity> getProducts(Integer categoryid, Integer sortbypriceid, String product_name){
		
		Session session = factory.getCurrentSession();
		String hql = null;
		
		String order = "";
		if (sortbypriceid == 1) {
			order =" ORDER BY salePrice ASC ";
		}else if (sortbypriceid == 2){
			order =" ORDER BY salePrice DESC ";
		}
		
		if(categoryid == 0) {
			hql = "FROM ProductsEntity where name LIKE :product_name " + order;
		}else {
			hql = "FROM ProductsEntity where name LIKE :product_name and categories.id = " + categoryid + order;
		}
		Query query = session.createQuery(hql);
		query.setParameter("product_name", "%" +  product_name + "%");
		List<ProductsEntity> list = query.list();
		return list;
		
	}
	
	
	@RequestMapping(value="index/{id}/{categoryid}/{sortbypriceid}/{searchtext}")
	public String showproducts(ModelMap model, HttpServletRequest request, @PathVariable("id") Integer id,
			@PathVariable("categoryid") Integer categoryid, @PathVariable("sortbypriceid") Integer sortbypriceid,
			@PathVariable("searchtext") String searchtext){
		
		model.addAttribute("name", getCustomer(id).getName());
		
		model.addAttribute("category", new CategoriesEntity(categoryid));
		model.addAttribute("sortbyprice", new SortByPrice(sortbypriceid));
		
		List<ProductsEntity> products = this.getProducts(categoryid, sortbypriceid, searchtext);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);// trang hiện tại
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3); //3 link page
		pagedListHolder.setPageSize(4);// 4 cột trong 1 link
		model.addAttribute("pagedListHolder", pagedListHolder);

		return "products/index";
	}


	@RequestMapping(value="index/{id}/{categoryid}/{sortbypriceid}", method=RequestMethod.POST)
	public String searchProduct(ModelMap model, HttpServletRequest request, @PathVariable("id") Integer id
			, @PathVariable("categoryid") Integer categoryid, @PathVariable("sortbypriceid") Integer sortbypriceid){
		
		return "redirect:/products/index/" + id + "/" + categoryid + "/" + sortbypriceid
				+ "/" + request.getParameter("searchtext") +  ".htm";
	}

}

