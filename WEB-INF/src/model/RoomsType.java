package model;

public class RoomsType{
	private Integer rooms_type_id;
	private String rooms_type;

	public RoomsType(Integer rooms_type_id,String rooms_type){
		this.rooms_type_id = rooms_type_id;
		this.rooms_type = rooms_type;
	}

	public RoomsType(String rooms_type){
		this.rooms_type = rooms_type;
	}

	public RoomsType(){
	
	}
	///////////////////////////////////////

	public Integer getrooms_type_id(){
		return rooms_type_id;
	}

	public void setrooms_type_id(Integer rooms_type_id){
		this.rooms_type_id = rooms_type_id;
	}

	public String getrooms_type(){
		return rooms_type;
	}

	public void setrooms_type(String rooms_type){
		this.rooms_type = rooms_type;
	}
}