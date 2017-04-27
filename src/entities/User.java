package entities;

public class User {
	private String email;
	private String id;
	private String username;
	private String password;
	private boolean isLogin;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public User(){
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isLogin() {
		return isLogin;
	}
	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	} 
	
}
