package ptithcm.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.LogIn;
import ptithcm.bean.Register;
import ptithcm.entity.CustomersEntity;

@Transactional
@Controller
@RequestMapping("account/")
public class AccountController {
	
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String login(ModelMap model){
		model.addAttribute("login", new LogIn());
		return "account/login";
	}
	
	@RequestMapping(value="index", method=RequestMethod.POST)
	public String account_login(ModelMap model, @Validated @ModelAttribute("login") LogIn login, BindingResult errors, HttpSession ss){
		
		if (errors.hasErrors()) {
			return "account/login";
		}
		
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomersEntity where email = :email and password = :password";
		try {
			Query query = session.createQuery(hql);
			query.setParameter("email", login.getEmail());
			query.setParameter("password", login.getPassword());
			
			CustomersEntity customer = (CustomersEntity) query.list().get(0);
			
			ss.setAttribute("user", "admin");
			
			if(customer.getIsAdmin() == true) {
				return "redirect:/admin/home/index.htm";
			}
			return "redirect:/home/index/" + customer.getId() + ".htm";
			
		}catch(Exception e) {
				model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Login Unsuccessful </div>");
				return "account/login";
		}
	}
			
	@RequestMapping(value="logout")
	public String Logout(HttpSession ss)
	{
		ss.removeAttribute("user");
		return "redirect:/account/index.htm";
	}
	
	@RequestMapping(value = "forgetPassword", method = RequestMethod.GET)
	public String show_forgot_password(ModelMap model) {
		return "account/forgotPassword";
	}
	
	@Autowired
	JavaMailSender mailer;
	boolean sentCodeToGmail(String from, String to, String code) {
		try {
			// tạo mail
			MimeMessage mail = mailer.createMimeMessage();
			// sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			
			helper.setFrom(from,from);
			helper.setTo(to);
			helper.setReplyTo(from,from);
			helper.setSubject("Gmail confirm");
			helper.setText(code,true); // true để nhận đúng gì đã gửi , không true nó nhận html
			
			//gửi mail
			mailer.send(mail);
			return true;
		}
		catch (Exception e){
			return false;
		}
	}
	public CustomersEntity getCustomerByEmail(String email){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CustomersEntity where email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		CustomersEntity customer = (CustomersEntity)query.list().get(0);
		return customer;
	}
	static String code = "";
	@RequestMapping(value = "forgetPassword", method = RequestMethod.POST)
	public String forgot_password(ModelMap model, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		if (email.equals("")) {
			model.addAttribute("messageEmail", "<div style='color:red;'>Email is not empty </div>");
			return "account/forgotPassword";
		}else {
			
			Session session = factory.getCurrentSession();
			String hql = "FROM CustomersEntity where email = :email";
			try {
				Query query = session.createQuery(hql);
				query.setParameter("email", email);
				CustomersEntity customer = (CustomersEntity) query.list().get(0);
				
				Random generator = new Random();
				AccountController.code = String.valueOf(generator.nextInt((9999 - 1000) + 1) + 1000);
				
				
				boolean check = sentCodeToGmail("huynhngoccanh3010@gmail.com", email, "Your code: "+ AccountController.code);
				if(check == true) {
					model.addAttribute("message", "<small style='color:green;'>1 confirmation code sent to your email</small>");
					model.addAttribute("id", getCustomerByEmail(email).getId());
					return "account/formCode-forgotPassword";
				}
				model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Try later</div>");
			}catch(Exception e) {
				model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Email is not exist</div>");
			}
		}
		return "account/forgotPassword";
	}
	
	
	public CustomersEntity getCustomer(Integer id){
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM CustomersEntity where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomersEntity customer = (CustomersEntity)query.list().get(0);
		return customer;
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
	@RequestMapping(value = "forgotPassword/confirmCode/{id}", method = RequestMethod.POST)
	public String confirmCode(ModelMap model, HttpServletRequest request,  @PathVariable("id") Integer id) {
		
		System.out.println(AccountController.code);
		
		String code = request.getParameter("code");
		if (code.equals("")) {
			model.addAttribute("messageCode", "<div style='color:red;'>Code is not empty </div>");
			return "account/formCode-forgotPassword";
		}else {
			if(code.equals(AccountController.code)) {
				CustomersEntity customer = getCustomer(id);
				
				Random generator = new Random();
				String password = String.valueOf(generator.nextInt((9999 - 1000) + 1) + 1000);
				boolean check = sentCodeToGmail("huynhngoccanh3010@gmail.com", customer.getEmail(), "Your new password: "+ password);
				
				customer.setPassword(password);
				updateCustomer(customer);
				System.out.println("New password sent to your email");
				return "account/forgotPasswordSuccess";
			}else {
				model.addAttribute("message", "<div style='color:red;margin-top:20px;'>Your code is wrong</div>");
				return "account/formCode-forgotPassword";
			}
		}
	}


	
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(ModelMap model){
		model.addAttribute("register", new Register());
		return "account/register";
	}
	static Register register;
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String account_register(ModelMap model, @Validated @ModelAttribute("register") Register register,
			BindingResult errors){
		
		if (errors.hasErrors()) {
			return "account/register";
		}
		
		try {
			getCustomerByEmail(register.getEmail());
			model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Email already exists</div>");
		} catch (Exception e) {
			if(register.getPassword().equals(register.getConfirmpassword())) {
				Random generator = new Random();
				AccountController.code = String.valueOf(generator.nextInt((9999 - 1000) + 1) + 1000);
				
				boolean check = sentCodeToGmail("huynhngoccanh3010@gmail.com", register.getEmail(), "Your code: "+ AccountController.code);
				if(check == true) {
					AccountController.register = register;
					model.addAttribute("message", "<small style='color:green;'>1 confirmation code sent to your email</small>");
					return "account/formCode-register";
				}
				model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Try later</div>");
			}else {
				model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Password is not match</div>");
			}
		}
		return "account/register";
		
		
	}
	public Integer insertCustomer(CustomersEntity customer) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(customer);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	@RequestMapping(value="register/confirmCode", method=RequestMethod.POST)
	public String confirmCode_register(ModelMap model, HttpServletRequest request){
		
		String code = request.getParameter("code");
		
		if(code.equals("")) {
			model.addAttribute("messageCode", "<div style='color:red;'>Code is not empty </div>");
			return "account/formCode-register";
		}
		if(code.equals(AccountController.code)) {
			CustomersEntity customer = new CustomersEntity();
			customer.setName(AccountController.register.getName());
			customer.setPassword(AccountController.register.getPassword());
			customer.setPhone(AccountController.register.getPhone());
			customer.setEmail(AccountController.register.getEmail());
			customer.setIsActive(true);
			customer.setIsAdmin(false);
			
			Integer temp = this.insertCustomer(customer);
			if (temp != 0) {
				System.out.println("Register Success");
				return "account/registerSuccess";
			} else {
				model.addAttribute("message", "<div style='color:red;margin-top: 25px;'>Try later</div>");
				model.addAttribute("register", new Register());
				return "account/register";
			}
		}else {
			model.addAttribute("message", "<div style='color:red;margin-top:20px;'>Your code is wrong</div>");
			return "account/formCode-register";
		}
		
	}
	

}
