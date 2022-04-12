package ptithcm.bean;

import org.hibernate.validator.constraints.NotBlank;

public class Register {
	
	@NotBlank(message="Email is not empty !")
	private String email;
	
	@NotBlank(message="Name is not empty !")
	private String name;
	
	@NotBlank(message="Phone is not empty !")
	private String phone;
	
	@NotBlank(message="Password is not empty !")
	private String password;
	
	@NotBlank(message="Confirm password is not empty !")
	private String confirmpassword;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public Register(String email, String name, String phone, String password, String confirmpassword) {
		super();
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.password = password;
		this.confirmpassword = confirmpassword;
	}

	public Register() {
		super();
	}

	
	
	
}
