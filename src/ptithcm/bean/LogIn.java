package ptithcm.bean;

import org.hibernate.validator.constraints.NotBlank;

public class LogIn {
	
	@NotBlank(message="Email is not empty !")
	private String email;
	
	@NotBlank(message="Password is not empty !")
	private String password;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
