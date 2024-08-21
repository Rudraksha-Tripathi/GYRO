package model;

import java.sql.*;
import java.io.*;
import org.jasypt.util.password.StrongPasswordEncryptor;

public class User{
	private Integer userId;
	private String userName;
	private String email;
	private String password;
	private String mobile;
	private String activationCode;
	private String whatsapp;
	private UserType userType;
	private String address;
	private Status statusId;
	private String gender;

	public User(){
		
	}

	public User(Integer userId){
		this.userId = userId;
	}

	//############ OTHER-METHODS #########
		public void saveProfpic(String profpic){
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "update user set profpic=? where id=?";

			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,profpic);
			pst.setInt(2,this.userId);

			pst.executeUpdate();			

		}catch(SQLException|ClassNotFoundException e){/* |FileExistsException */
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}

	public static boolean activateUser(String email){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
				String query = "update user set status_id=1 where email=?";

			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,email);
			int rs = pst.executeUpdate();
			
			if(rs==1){
				flag = true;
			}
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}
		try{ con.close(); }catch(SQLException e){ e.printStackTrace(); }

		return flag;
	}

	public static boolean checkActivationCode(String email,String activationCode){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
				String query = "select activation_code from user where email=?";

			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,email);
			ResultSet rs = pst.executeQuery();
			System.out.println(rs+"____________"+activationCode);
			
			while(rs.next()){
				String ac = rs.getString(1);
				System.out.println(activationCode+"____________"+ac);
				if(activationCode.equals(ac)){
					flag = true;
				}
			}
			System.out.println("***"+flag);
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}
		try{ con.close(); }catch(SQLException e){ e.printStackTrace(); }

		return flag;
	}


	public boolean signupUser(){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
			String query = "insert into user (name,email,password,address,mobile,whatsapp,user_type,activation_code,gender) value (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1,userName);
			pst.setString(2,email);
			pst.setString(3,password);
			pst.setString(4,address);
			pst.setString(5,mobile);
			pst.setString(6,whatsapp);
			pst.setInt(7,userType.getUserTypeId());
			pst.setString(8,activationCode);
			pst.setString(9,gender);

			int rs = pst.executeUpdate();
			System.out.println("~~~~~"+rs);
			if(rs == 1){
				flag = true;
			}
			
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();}
		}
		return flag;
	 }

	public String loginUser(String email,String password){
		String msg = "Incorrect Email";
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
			String query = "select password,id,name,mobile,whatsapp,user_type,address,status_id from user where email=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,email);

			String dbpassword = "";
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				dbpassword = rs.getString(1);
				StrongPasswordEncryptor spe = new StrongPasswordEncryptor();
				if(spe.checkPassword(password,dbpassword)){
					this.email = email;
					if(rs.getInt(8)==1){
						userId = rs.getInt(2);
						userName = rs.getString(3);
						mobile = rs.getString(4);
						whatsapp = rs.getString(5);
						userType = new UserType(rs.getInt(6));
						address = rs.getString(7);

						msg = "Succesful";
					}else{
						msg = "Not Active User";
					}
				}else{
					msg = "Incorrect Password";
				}
			}
			
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();}
		}
		return msg;
	 }

	 
	
	public String getProfpic(){
		String picPath = null;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
			String query = "select profpic from user where id=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1,this.userId);

			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				picPath = rs.getString(1);
			}
			
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();}
		}
		return picPath;
	 }

	public static boolean updateUser(Integer userId,String name,String mobile,String whatsapp,String address){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
				String query = "update user set name=?,mobile=?,whatsapp=?,address=? where id=?";

			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,name);
			pst.setString(2,mobile);
			pst.setString(3,whatsapp);
			pst.setString(4,address);
			pst.setInt(5,userId);
			int rs = pst.executeUpdate();
			
			if(rs==1){
				flag = true;
			}
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}
		try{ con.close(); }catch(SQLException e){ e.printStackTrace(); }

		return flag;
	}

	
	//############ SETTER-GETTER #########
	public void setUserId(Integer userId){
		this.userId=userId;
	}

	public Integer getUserId(){
		return userId;
	}

	public void setUserName(String userName){
		this.userName=userName;
	}

	public String getUserName(){
		return userName;
	}

	public void setEmail(String email){
		this.email=email;
	}

	public String getEmail(){
		return email;
	}

	public void setPassword(String password){
		this.password=password;
	}

	public String getPassword(){
		return password;
	}
//////////////////////////////////
	public void setUser(UserType userType){
		this.userType=userType;
	}

	public UserType getUser(){
		return userType;
	}
////////////////////////////
	public void setMobile(String mobile){
		this.mobile = mobile;
	}
	public String getMobile(){
		return mobile;
	}

	public void setActivationCode(String activationCode){
		this.activationCode = activationCode;
	}

	public String getActivationCode(){
		return activationCode;
	}

	public void setWhatsapp(String whatsapp){
		this.whatsapp = whatsapp;
	}
	public String getWhatsapp(){
		return whatsapp;
	}

	public void setAddress(String address){
		this.address = address;
	}
	public String getAddress(){
		return address;
	}

	public void setStatusId(Status statusId){
		this.statusId = statusId;
	}
	public Status getStatusId(){
		return statusId;
	}
	public void setGender(String gender){
		this.gender = gender;
	}
	public String getGender(){
		return gender;
	}
}