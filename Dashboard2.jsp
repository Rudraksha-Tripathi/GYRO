<!doctype html>
<html lang="en">
 <head>
  <title>Dashboard</title>
     
      <%@include file="LinkTags.jsp" %>
  <link href="static/css/dashboard2.css" type="text/css" rel="stylesheet"/>

 </head>
 <body>
    <%@include file="header.jsp" %>
     <main style="background-image: url(bgimg.jpg); height: 250vh;">
        <div class="container">
		
		
           <%@include file="Navbar.jsp" %>
<!--              <h2 class="text-warning font-weight-bold">Dashboard</h2>-->
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="model.*" %>
               <div class="alert alert-warning">For Seekers</div>
               <div class="jumbotron" id="seeker_page">
                       
                        <div id="sidenav" class="sidenav">
                            <a href="" id="find">Find</a>    
                            <a href="" id="bm">Bookmarks</a>    
                            <a href="" id="map">Map</a>
                       </div>
                <div class="jumbotron dash-rec-box">   
                    <h2 class="text-info text-center font-weight-bold bg-secondary title">Find By Locations</h2>
                     <div class="srch">
                            <input class="form-control srch-bar" id="srch" type="text" placeholder="Search by location">
                        <button class="btn btn-success" type="submit" style="cursor: pointer;" onclick="searchRecord()" id="srchbtn"><img src="static/imgs/srch2.png" height="20px" width="25px" style="filter: grayscale(10)">Search</button>
                        </div>
                   <div class="jumbotron user-view All-locations">
						<div class="row">
						<% HttpSession session1 = request.getSession();
							ArrayList<Rooms> rooms = (ArrayList)session1.getAttribute("rooms"); 
							System.out.println(rooms.size());
							for(int i=0;i<rooms.size();i++){
							
						%>
                        <div class="col">
                            <img src="roompics.do?path=<%=rooms.get(i).getHostel_pic_path()%>"><br><span class="bg-dark text-warning font-weight-bold"><%=rooms.get(i).getHname()%></span>
							<br><span class="bg-dark text-warning font-weight-bold loc"><%=rooms.get(i).getLocation()%></span><br>
                        </div>
						<%}%>
                    </div>      
                   <br>
				   <!--
						div_col.onclick = roomdescription.show?userId=1;

                   <div class="row">
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Karmeta</span><br>
                       </div>
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Tripuri chock</span><br>
                       </div>
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Napier town</span><br>
                       </div>
                          <div class="col"><img src="static/imgs/hdbg.jpeg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                       <br><span class="bg-dark text-warning font-weight-bold loc">Wright town</span><br>
                       </div>
                   </div><br>
                    <div class="row">
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Vijay nagar</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Karmeta</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">Wright town</span><br>
                        </div>
                          <div class="col"><img src="static/imgs/wp1810523.jpg"><br><span class="bg-dark text-warning font-weight-bold">XYZ hostal</span>
                        <br><span class="bg-dark text-warning font-weight-bold loc">deendayal</span><br>
                        </div>
                   </div>-->
                </div>
                    <div class="jumbotron user-view bookmarks">
                       
                    </div>
                    <div class="jumbotron user-view gmap">
                        <h4>Your location</h4>

                            <div id="googleMap" style="width:100%;height:400px;"></div>

                    </div>
            </div>    
        </div>
            
     </main>
    <%@include file="footer.jsp" %>
        
        <script src="static/JS/dashboard2.js">
        </script>
		<script>
		
const searchRecord = ()=>{
    let filter = document.getElementById('srch').value.toUpperCase();
    let datas = document.getElementsByClassName('loc');

    let rows = document.getElementsByClassName('row')

    let cols = document.getElementsByClassName('col')
     console.log(cols)

for(var j=0;j<rows.length;j++){        
    for(var i=0;i<cols.length;i++){
        let rec = cols[j][i];
        let loc = cols[i].getElementsByClassName('loc')[0];    
        let txtvalue = loc.textContent;
        if(txtvalue.toUpperCase().indexOf(filter) > -1){
                cols[i].style.display = "";
        }else{
            cols[i].style.display = "none";
        }
    }
}
};
</script>
        
 </body>
</html>
