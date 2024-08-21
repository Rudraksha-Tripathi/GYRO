package model;

public class UserType{
	private Integer userTypeId;
	private String users;

	public UserType(String users){
		this.users = users;
	}

	public UserType(Integer userTypeId){
		this.userTypeId = userTypeId;
	}

	public UserType(){

	}
	//////////////////////////////////////////////////////
	public Integer getUserTypeId() {
		return userTypeId;
	}
	
	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}
	
	public String getUsers() {
		return users;
	}
	
	public void setUsers(String users) {
		this.users = users;
	}
		
}
