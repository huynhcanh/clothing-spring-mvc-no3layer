package ptithcm.bean;

import org.hibernate.validator.constraints.NotBlank;

public class UpdateInfo {
	
	@NotBlank(message="Name is not empty !")
	private String name;
	
	@NotBlank(message="Phone is not empty !")
	private String phone;

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

	public UpdateInfo(String name, String phone) {
		super();
		this.name = name;
		this.phone = phone;
	}
	public UpdateInfo() {
		super();
		
	}
}
