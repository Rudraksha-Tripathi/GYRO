package model;

public class Status{
	private Integer statusId;
	private String status;

	public Status(){
		super();
	}

	public Status(Integer statusId){
		super();
		this.statusId = statusId;
	}

	public void setStatus(String status){
		this.status = status;
	}

	public String getStatus(){
		return status;
	}

	public void setStatusId(Integer statusId){
		this.statusId = statusId;
	}

	public Integer getStatusId(){
		return statusId;
	}
}