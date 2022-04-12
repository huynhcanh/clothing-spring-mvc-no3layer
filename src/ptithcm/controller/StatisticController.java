package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.OrderDetailsEntity;
import ptithcm.service.IOrderDetailsService;

@Controller
@RequestMapping("admin/report/")
public class StatisticController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	IOrderDetailsService order;
	
	public int countProduct() {
		List<OrderDetailsEntity> list = order.findAll();
		int tong = 0;
		for (OrderDetailsEntity orderDetailsEntity : list) {
			tong = tong + orderDetailsEntity.getQuantity();
		}
		return tong;
	}
	
	public String sumMoney() {
		List<OrderDetailsEntity> list = order.findAll();
		float tong = 0;
		for (OrderDetailsEntity orderDetailsEntity : list) {
			tong = tong + orderDetailsEntity.getTotalMoney();
		}
		String total= String.valueOf(tong/1000000)+"trVND";
		return total;
	}
	
	@RequestMapping("index")
	public String index(Model model,HttpServletRequest request) {
		model.addAttribute("count",countProduct());
		model.addAttribute("money",sumMoney());
		return("admin_v1/report/index");
	}
}