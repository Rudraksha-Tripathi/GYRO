package model;

public class Services{
	private Integer services_id;
	private User userId;
	private Boolean tiffin;
	private Boolean ac;
	private Boolean hygine;
	private Boolean security;

	public Services(Integer services_id){
		this.services_id = services_id;
	}

	public Services(User userId){
		this.userId = userId;
	}

	public Services(){
	
	}
	///////////////////////////////////////////////

	public Integer getServices_id(){
		return services_id;
	}

	public void setServices_id(Integer services_id){
		this.services_id = services_id;
	}

	
}