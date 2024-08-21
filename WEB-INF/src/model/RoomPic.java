package model;

public class RoomPic{
	private Integer pic_path_id;
	private User userId;
	private String picPath;

	public RoomPic(){
		super();
	}

	public RoomPic(Integer pic_path_id){
		super();
		this.pic_path_id = pic_path_id;
	}

	public void setPicPath(String picPath){
		this.picPath = picPath;
	}

	public String getPicPath(){
		return picPath;
	}

	public void setPicPathId(Integer pic_path_id){
		this.pic_path_id = pic_path_id;
	}

	public Integer getPicPathId(){
		return pic_path_id;
	}
}