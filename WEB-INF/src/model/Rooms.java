package model;

import java.sql.*;
import java.util.*;

public class Rooms{
	
	private static Integer room_id;
	private static User user_id;
	private static String hname;
	private static HostelFor hostelFor_id;
    private static String location;
	private static Integer availble_rooms;
	private static RoomsType rooms_type_id;
	private static Services services_id;
	private static PaymentModes payment_mode_id;
	private static String rates;
	private static Integer size_of_rooms;
	private static String description;
	private static String hostel_pic_path;

	public Rooms(){
	
	}

	public Rooms(Integer room_id){
	
	} 
	
	public Rooms(Integer room_id,User user_id,String hostel_name,HostelFor hostelFor_id,String location,Integer available_rooms,RoomsType rooms_type_id,Services services_id,PaymentModes py_mode_id,String rates,Integer size_of_rooms,String description){
		this.room_id = room_id;
		this.user_id = user_id;
		this.hname = hostel_name;
		this.hostelFor_id = hostelFor_id;
		this.location = location;
		this.availble_rooms = availble_rooms;
		this.rooms_type_id = rooms_type_id;
		this.services_id = services_id;
		this.payment_mode_id = payment_mode_id;
		this.rates = rates;
		this.size_of_rooms = size_of_rooms;
		this.description = description;
		
	}
/*
	public rooms(User user_id, HostalFor hostalFor_id, addresses address_id, availble_rooms availble_id){
		super();
		this.user_id = user_id;
		this.hostalFor_id = hostalFor_id;
		this.address_id = address_id;
		this.availble_id = availble_id;
	}

	public rooms(rooms_type rooms_type_id, services services_id, payment_modes payment_mode_id){
		super();
		this.rooms_type_id = rooms_type_id;
		this.services_id = services_id;
		this.payment_mode_id = payment_mode_id;
	}

	public rooms(String rates, String size_of_rooms, String description){
		super();
		this.rates = rates;
		this.size_of_rooms = size_of_rooms;
		this.description = description;
	}*/
	//////////////////////////////////////////////////////

	//"update products set payment_details=? where product_id=?";

	public static Boolean getRoomDescription(Integer user_id){
		Boolean flag = false;

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "select room_id,hostel_name,hostalFor_id,location,available_rooms,rooms_type_id,services_id,py_mode_id,rates,size_of_rooms,description from rooms where user_id=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1,user_id);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				room_id = rs.getInt(1);
				hname = rs.getString(2);
				hostelFor_id = new HostelFor(rs.getInt(3));
				location = rs.getString(4);
				availble_rooms = rs.getInt(5);
				if(rs.getInt(6)==1){
					rooms_type_id = new RoomsType(rs.getInt(6),"Single");
				}else{
					rooms_type_id = new RoomsType(rs.getInt(6),"Double");
				}
				services_id = new Services(rs.getInt(7));
				payment_mode_id = new PaymentModes(rs.getInt(8));
				rates = rs.getString(9);
				size_of_rooms = rs.getInt(10);
				description = rs.getString(11);

				flag = true;
			}
			
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}
		return flag;
	}



	public static void saveRoomPics(Integer userId,ArrayList<String> roomPics){
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "insert into roompic (user_id,room_pic_path) value (?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1,userId);

			for(String proPic : roomPics){
				ps.setString(2,proPic);
				ps.executeUpdate();
			}		

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}

	public static Integer saveServices(String[] services,Integer user_id){
		Integer service_id = 0;

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "insert into services_available (user_id,tiffin,ac,hygine,security) value (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			Boolean tiffin = false;
			Boolean ac = false;
			Boolean hygine = false;
			Boolean security = false;

			for(String service : services){
				if(service.equals("tiffin")){
					tiffin = true;
				}else if(service.equals("AC")){
					ac = true;
				}else if(service.equals("clean")){
					hygine = true;
				}else if(service.equals("security")){
					security = true;
				}
			}

			ps.setInt(1,user_id);
			ps.setBoolean(2,tiffin);
			ps.setBoolean(3,ac);
			ps.setBoolean(4,hygine);
			ps.setBoolean(5,security);

			int res = ps.executeUpdate();
			if(res==1){
				ResultSet rs = ps.getGeneratedKeys();
				if(rs.next()){
					service_id = rs.getInt(1);
				}
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return service_id;
	}

	public static Integer savePaymentMode(String[] payments,Integer user_id){
		Integer py_mode_id = 0;

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "insert into payment_modes (user_id,cash,paytm,googlepay_upi,net_banking) value (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			Boolean cash = false;
			Boolean paytm = false;
			Boolean googlePay = false;
			Boolean netBanking = false;

			for(String paymentMode : payments){
				if(paymentMode.equals("cash")){
					cash = true;
				}else if(paymentMode.equals("paytm")){
					paytm = true;
				}else if(paymentMode.equals("gpay")){
					googlePay = true;
				}else if(paymentMode.equals("account")){
					netBanking = true;
				}
			}

			ps.setInt(1,user_id);
			ps.setBoolean(2,cash);
			ps.setBoolean(3,paytm);
			ps.setBoolean(4,googlePay);
			ps.setBoolean(5,netBanking);

			int res = ps.executeUpdate();
			if(res==1){
				ResultSet rs = ps.getGeneratedKeys();
				if(rs.next()){
					py_mode_id = rs.getInt(1);
				}
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return py_mode_id;
	}

	public static StringBuffer getPaymentMode(Integer payment_mode_id){
		StringBuffer respTxt = new StringBuffer(); 

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "select  cash,paytm,googlepay_upi,net_banking from payment_modes where py_mode_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			
			Boolean cash = false;
			Boolean paytm = false;
			Boolean googlePay = false;
			Boolean netBanking = false;

			ps.setInt(1,payment_mode_id);

			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				cash = rs.getBoolean(1);
				paytm = rs.getBoolean(2);
				googlePay = rs.getBoolean(3);
				netBanking = rs.getBoolean(4);
			}

			if(cash == true){
				respTxt.append("Cash");
			}
			if(paytm == true){
				respTxt.append(" Paytm");
			}
			if(googlePay == true){
				respTxt.append(" GooglePay");
			}
			if(netBanking == true){
				respTxt.append(" NetBanking");
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return respTxt;
	}

	public static StringBuffer getServices(Integer service_id){
		StringBuffer respTxt = new StringBuffer(); 

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "select tiffin,ac,hygine,security from services_available where s_no=?";
			PreparedStatement ps = con.prepareStatement(query);
			
			Boolean tiffin = false;
			Boolean ac = false;
			Boolean hygine = false;
			Boolean security = false;

			ps.setInt(1,service_id);

			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				tiffin = rs.getBoolean(1);
				ac = rs.getBoolean(2);
				hygine = rs.getBoolean(3);
				security = rs.getBoolean(4);
			}

			if(tiffin == true){
				respTxt.append("Tiffin_Service");
			}
			if(ac == true){
				respTxt.append(" AC");
			}
			if(hygine == true){
				respTxt.append(" Hygine");
			}
			if(security == true){
				respTxt.append(" Security");
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return respTxt;
	}


	public static boolean setRoom(Integer user_id,String hname,Integer hostelFor_id,String location,Integer available_rooms,Integer rooms_type_id,String rates,Integer size_of_rooms,String description,String[] services,String[] payment){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
			String query = "insert into rooms (user_id,hostel_name,hostalFor_id,rooms_type_id,services_id,rates,size_of_rooms,description,py_mode_id,location,available_rooms) value (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			int services_id = saveServices(services,user_id);
			int payment_mode_id = savePaymentMode(payment,user_id);
			//pic_path_id = savePicPath();

			pst.setInt(1,user_id);
			pst.setString(2,hname);
			pst.setInt(3,hostelFor_id);
			pst.setInt(4,rooms_type_id);	
			pst.setInt(5,services_id);
			pst.setString(6,rates);
			pst.setInt(7,size_of_rooms);
			pst.setString(8,description);
			//pst.setInt(9,roomPicPathId);
			pst.setInt(9,payment_mode_id);
			pst.setString(10,location);
			pst.setInt(11,available_rooms);

			int rs = pst.executeUpdate();
			System.out.println("~~~~~"+rs);
			if(rs == 1){
				flag = true;
			}
			System.out.println("***"+flag);
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}
		try{ con.close(); }catch(SQLException e){ e.printStackTrace(); }

		return flag;
	}

	
	public static StringBuffer getPicPath(Integer user_id){
		StringBuffer picPath = new StringBuffer();
		//String picPath = null;
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "select room_pic_path from roompic where user_id=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1,user_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				picPath.append(rs.getString(1)+" ");
				//picPath = rs.getString(1);
			}
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return picPath;
	}

	public static boolean updateRoom(Integer user_id,String hname,Integer hostelFor_id,String location,Integer available_rooms,Integer rooms_type_id,String rates,Integer size_of_rooms,String description,String[] services,String[] payment){
		boolean flag = false;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");
			String query = "update rooms set hostel_name=?,hostalFor_id=?,rooms_type_id=?,rates=?,size_of_rooms=?,description=?,location=?,available_rooms=? where user_id=?";
			PreparedStatement pst = con.prepareStatement(query);
			if(services!=null){
				int services_id = updateServices(services,user_id);
			}
			if(payment!=null){
			int payment_mode_id = updatePaymentMode(payment,user_id);
			//pic_path_id = savePicPath();
			}

			
			pst.setString(1,hname);
			pst.setInt(2,hostelFor_id);
			pst.setInt(3,rooms_type_id);	
			
			pst.setString(4,rates);
			pst.setInt(5,size_of_rooms);
			pst.setString(6,description);
			
			pst.setString(7,location);
			pst.setInt(8,available_rooms);
			pst.setInt(9,user_id);

			int rs = pst.executeUpdate();
			System.out.println("~~~~~"+rs);
			if(rs == 1){
				flag = true;
			}
			System.out.println("***"+flag);
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}
		try{ con.close(); }catch(SQLException e){ e.printStackTrace(); }

		return flag;
	}

	public static Integer updateServices(String[] services,Integer user_id){
		Integer service_id = 0;

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "update services_available set tiffin=?,ac=?,hygine=?,security=? where user_id=?";
			PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			Boolean tiffin = false;
			Boolean ac = false;
			Boolean hygine = false;
			Boolean security = false;

			for(String service : services){
				if(service.equals("tiffin")){
					tiffin = true;
				}else if(service.equals("AC")){
					ac = true;
				}else if(service.equals("clean")){
					hygine = true;
				}else if(service.equals("security")){
					security = true;
				}
			}

			ps.setBoolean(1,tiffin);
			ps.setBoolean(2,ac);
			ps.setBoolean(3,hygine);
			ps.setBoolean(4,security);
			ps.setInt(5,user_id);

			int res = ps.executeUpdate();
			if(res==1){
				ResultSet rs = ps.getGeneratedKeys();
				if(rs.next()){
					service_id = rs.getInt(1);
				}
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return service_id;
	}

	public static Integer updatePaymentMode(String[] payments,Integer user_id){
		Integer py_mode_id = 0;

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "update payment_modes set cash=?,paytm=?,googlepay_upi=?,net_banking=? where user_id=?";
			PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			Boolean cash = false;
			Boolean paytm = false;
			Boolean googlePay = false;
			Boolean netBanking = false;

			for(String paymentMode : payments){
				if(paymentMode.equals("cash")){
					cash = true;
				}else if(paymentMode.equals("paytm")){
					paytm = true;
				}else if(paymentMode.equals("gpay")){
					googlePay = true;
				}else if(paymentMode.equals("account")){
					netBanking = true;
				}
			}

			ps.setBoolean(1,cash);
			ps.setBoolean(2,paytm);
			ps.setBoolean(3,googlePay);
			ps.setBoolean(4,netBanking);
			ps.setInt(5,user_id);

			int res = ps.executeUpdate();
			if(res==1){
				ResultSet rs = ps.getGeneratedKeys();
				if(rs.next()){
					py_mode_id = rs.getInt(1);
				}
			}

		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return py_mode_id;
	}

	public static ArrayList<Rooms> getAllRoomDescription(){
		ArrayList<Rooms> allRooms = new ArrayList();

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "select room_id,hostel_name,hostalFor_id,location,available_rooms,rooms_type_id,services_id,py_mode_id,rates,size_of_rooms,description,user_id from rooms";
			PreparedStatement ps = con.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData(); 
			int i=0;

			while(rs.next()){	
				
				if(rs.getInt(6)==1){
					RoomsType rooms_type_id = new RoomsType(rs.getInt(6),"Single");
				}else{
					RoomsType rooms_type_id = new RoomsType(rs.getInt(6),"Double");
				}

				allRooms.add(i,new Rooms(rs.getInt(1),new User(rs.getInt(12)),rs.getString(2),new HostelFor(rs.getInt(3)),rs.getString(4),rs.getInt(5),rooms_type_id,new Services(rs.getInt(7)),new PaymentModes(rs.getInt(8)),rs.getString(9),rs.getInt(10),rs.getString(11)));
				
				if(allRooms.size()!=0){
					System.out.println(allRooms.get(0).getHname());
				}
				i++;
			}
			
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		for(int i=0;i<allRooms.size();i++){
			System.out.println("Name of hostel---"+allRooms.get(i).getHname());
		}

		return allRooms;
	}
	/*
	<div class="row">
						<% HttpSession session1 = request.getSession();
							ArrayList<Rooms> rooms = (ArrayList)session1.getAttribute("rooms"); 
							System.out.println(rooms.size());
							for(int i=0;i<rooms.size();i++){
							
						%>
                        <div class="col">
                            <img src="static/imgs/bgimg.jpg"><br><span class="bg-dark text-warning font-weight-bold"><%=rooms.get(i).getHname()%></span>
							<br><span class="bg-dark text-warning font-weight-bold loc"><%=rooms.get(i).getLocation()%></span><br>
                        </div>
						<%}%>
                    </div>      
                   <br>
	*/

	
/*
	public static Rooms[] getAllRoomDescription(){
		Rooms[] allRooms =new Rooms[20];

		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "select room_id,hostel_name,hostalFor_id,location,available_rooms,rooms_type_id,services_id,py_mode_id,rates,size_of_rooms,description,user_id from rooms";
			PreparedStatement ps = con.prepareStatement(query);
			int j = 0;
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getFetchSize());
				
				if(rs.getInt(6)==1){
					RoomsType rooms_type_id = new RoomsType(rs.getInt(6),"Single");
				}else{
					RoomsType rooms_type_id = new RoomsType(rs.getInt(6),"Double");
				}

				//allRooms.add(new Rooms(rs.getInt(1),new User(rs.getInt(12)),rs.getString(2),new HostelFor(rs.getInt(3)),rs.getString(4),rs.getInt(5),rooms_type_id,new Services(rs.getInt(7)),new PaymentModes(rs.getInt(8)),rs.getString(9),rs.getInt(10),rs.getString(11)));
				allRooms[j] = new Rooms(rs.getInt(1),new User(rs.getInt(12)),rs.getString(2),new HostelFor(rs.getInt(3)),rs.getString(4),rs.getInt(5),rooms_type_id,new Services(rs.getInt(7)),new PaymentModes(rs.getInt(8)),rs.getString(9),rs.getInt(10),rs.getString(11));
				System.out.println(allRooms.length);
				j=j+1;
			}
		
			
		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}
		return allRooms;
	}*/

	public static Boolean deleteRoomPic(String img){
		
		Boolean flag = false;
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "delete from roompic where room_pic_path=?";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1,img);

			int res = ps.executeUpdate();
			System.out.println("+_+_+Pic_+_+_deleted"+res);
			if(res==1){
				flag=true;
			}


		}catch(SQLException|ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			try{con.close();}catch(SQLException e){e.printStackTrace();	}
		}

		return flag;
	}



	public void saveHostelpic(Integer userId,String profpic){
		Connection con = null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gyro?user=root&password=1234");

			String query = "update rooms set hostel_pic_path=? where user_id=?";

			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,profpic);
			pst.setInt(2,userId);

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


	//////////////////////////////////////////////////////

	public Integer getRoomId(){
		return room_id;
	}

	public void setRoomId(Integer room_id){
		this.room_id = room_id;
	}

	public User getUserId(){
		return user_id;
	}

	public void setUserId(User user_id){
		this.user_id = user_id;
	}

	public String getHname(){
		return hname;
	}

	public void setHname(String hname){
		this.hname = hname;
	}

	public HostelFor getHostelForId(){
		return hostelFor_id;
	}

	public void setHostelForId(HostelFor hostelFor_id){
		this.hostelFor_id = hostelFor_id; 
	}
/////////////////////////////////
	public String getLocation(){
		return location;
	}

	public void setLocation(String location){
		this.location = location;
	}

	public Integer getavailble_rooms(){
		return availble_rooms;
	}

	public void setavailble_rooms(Integer availble_rooms){
		this.availble_rooms = availble_rooms;
	}

	public RoomsType getrooms_type_id(){
		return rooms_type_id;
	}

	public void setrooms_type_id(RoomsType rooms_type_id){
		this.rooms_type_id = rooms_type_id;
	}

	public Services getServices_id(){
		return services_id;
	}

	public void setServices_id(Services services_id){
		this.services_id = services_id;
	}

	public PaymentModes getPayment_mode_id(){
		return payment_mode_id;
	}

	public void setPayment_mode_id(PaymentModes payment_mode_id){
		this.payment_mode_id = payment_mode_id;
	}

	public String getRates(){
		return rates;
	}

	public void setRates(String rates){
		this.rates = rates;
	}

	public Integer getSize_of_rooms(){
		return size_of_rooms;
	}

	public void setSize_of_rooms(Integer size_of_rooms){
		this.size_of_rooms = size_of_rooms;
	}

	public String getDescription(){
		return description;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getHostel_pic_path(){
		return hostel_pic_path;
	}

	public void setHostel_pic_path(String hostel_pic_path){
		this.hostel_pic_path = hostel_pic_path;
	}
}