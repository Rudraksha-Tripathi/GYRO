package model;

public class HostelFor{
	private Integer hostelFor_id;
	private String hostelFor;

	public HostelFor(Integer hostelFor_id){
		this.hostelFor_id = hostelFor_id;
	}

	public HostelFor(String hostelFor){
		this.hostelFor = hostelFor;
 	}

	public HostelFor(){
	
	}
	////////////////////////////////////////////////////////

	public Integer gethostelFor_id(){
		return hostelFor_id;
	}

	public void sethostelFor_id(Integer hostelFor_id){
		this.hostelFor_id = hostelFor_id; 
	}

	public String gethostelFor(){
		return hostelFor;
	}

	public void sethostelFor(String hostelFor){
		this.hostelFor = hostelFor;
	}
}