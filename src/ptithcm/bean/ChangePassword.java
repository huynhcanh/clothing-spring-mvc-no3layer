package ptithcm.bean;

import org.hibernate.validator.constraints.NotBlank;

public class ChangePassword {
	
	@NotBlank(message="Old password is not empty !")
	private String oldpassword;
	
	@NotBlank(message="New password is not empty !")
	private String newpassword;
	
	@NotBlank(message="Confirm password is not empty !")
	private String confirmpassword;

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	
	
	
	
}
