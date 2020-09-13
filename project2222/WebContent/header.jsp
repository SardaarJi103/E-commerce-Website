<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="u" class="project2222.Register12" 	/>
<jsp:setProperty name="u" property="*" />


<% 
if(request.getParameter("submit")!=null){%>

<% 
Connection conn=DbConnection.getConnection();
PreparedStatement ps=conn.prepareStatement("insert into register(firstname,lastname,email,password) values(?,?,?,?)");
ps.setString(1,u.getFirstname() );
ps.setString(2, u.getLastname());
ps.setString(3, u.getEmail());
ps.setString(4, u.getPassword());
ps.executeUpdate();
}%>


<% if(request.getParameter("login")!=null){%>

<% 
Connection conn=DbConnection.getConnection();
PreparedStatement ps=conn.prepareStatement("select * from register where email=? and password=?");
ps.setString(1,u.getEmail());
ps.setString(2, u.getPassword());
ResultSet rs=ps.executeQuery();
if(rs.next()){
	session.setAttribute("id", rs.getInt("id"));
	session.setAttribute("name",rs.getString("firstname"));
}
else{
	out.print("wrong email or password");
}



} %>


<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="project2222.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
	<title></title>




</head>

<body>


<link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="css/owl.theme.css">

<link href="https://fonts.googleapis.com/css?family=Acme&display=swap" rel="stylesheet">

  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>


<!--uppersection-->
<div class="container-fluid uppersection">
	<h4 class="colorr pull-left">Offer Zone Top Deals & Discounts</h4>

		
<% if(session.getAttribute("id")==null){%>



		<button type="button" style="height:100%;" class="btn btn-lg  nav-links register pull-right login" id="btn2" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Register
	</button>

		<button type="button" style="height:100%;" class="btn btn-lg    pull-right login1"  id="btn1" data-toggle="modal" data-target="#myModal1"><span class="glyphicon glyphicon-log-in"></span> Login
	</button>

	


		<button type="button" style="height:100%;" class="btn btn-lg  nav-links register pull-right btn-success loc" id="btn3" data-toggle="modal" data-target="#myModal111"><span class=" fas fa-map-marker-alt icons"></span> Select Location


	</button>

<% }else{ %>
<div class="btn-group pull-right">
<% Connection conn=DbConnection.getConnection();
PreparedStatement ps5=conn.prepareStatement("select * from register where id=" + session.getAttribute("id"));
ResultSet rs5=ps5.executeQuery();
rs5.next();
%>
  <button type="button" class="btn btn-lg login pull-right  btn-danger dropdown-toggle" style="height:100%;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  <span class=" fas fa-user"></span><span class="caret"></span>
  </button>
  <p style="color:white;margin-right:60px;margin-top:10px;text-transform:capitalize;" class="pull-right">Welcome  <%= rs5.getString("firstname") %><%= rs5.getString("lastname") %></p>
  
  <ul class="dropdown-menu">
    <li><a href="logout.jsp">Logout</a></li>
    <li><a href="profile.jsp">Profile</a></li>
  
  </ul>
</div>	
<%} %>	

</div>




<!--Login modal-->

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModal1Label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h1 class="modal-title" id="myModal1Label" style="color: #f71804">Login</h1>
      </div>
      <div class="modal-body">
        <form method='post'>
	<div class="form-group">
		<label>Username</label>
		<input type="email" name="email" class="form-control">
	</div>
	<div class="form-group">
		<label>Password</label>
		<input type="Password" name="password" class="form-control">
	</div>
 <button type="submit" class="btn btn-block" name="login" style="background-color: #f71804;color: white">Login</button>


</form>
      </div>
      <div class="modal-footer">
       <h3 class="text-center">Don't have an account  <button type="button" class="btn btn-lg btn-warning"  id="btn1" style="color: white"  data-toggle="modal" data-target="#myModal">Create Account
	</button></h3>
      </div>
    </div>
  </div>
</div>


<!--Regisrtre  Modalssss-->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h1 class="modal-title" id="myModalLabel" style="color: #f71804">Register</h1>
      </div>
      <div class="modal-body">
            
<form method="post">

  <div class="form-group">
    <label for="email">First Name:</label>
    <input type="text" name="firstname" class="form-control">
  </div>
  <div class="form-group">
    <label for="pwd">Last Name</label>
    <input type="text" name="lastname" class="form-control">
  </div>

    <div class="form-group">
    <label for="pwd"> Set Email</label>
    <input type="email" name="email" class="form-control">
  </div>
    <div class="form-group">
    <label for="pwd">Set Password</label>
    <input type="password" name="password" class="form-control">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <button type="submit" class="btn btn-block" name="submit" style="background-color: #f71804;color: white " >Submit</button>


</form>


      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>


<!--locationmodel-->

<div class="modal fade" id="myModal111" tabindex="-1" role="dialog" aria-labelledby="myModal111Label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h1 class="modal-title text-center" id="myModal111Label" style="color: #f71804"><span class=" fas fa-map-marker-alt icons"></span>    Select Your Location</h1>
      </div>
      <div class="modal-body">
       <div class="form-group">
  <label for="sel1">Select list:</label>
  <select class="form-control" id="sel1">
    <optgroup label="Popular Cities">
					<option selected style="display:none;color:#eee;">Select City</option>
					<option>Birmingham</option>
					<option>Anchorage</option>
					<option>Phoenix</option>
					<option>Little Rock</option>
					<option>Los Angeles</option>
					<option>Denver</option>
					<option>Bridgeport</option>
					<option>Wilmington</option>
					<option>Jacksonville</option>
					<option>Atlanta</option>
					<option>Honolulu</option>
					<option>Boise</option>
					<option>Chicago</option>
					<option>Indianapolis</option>
				</optgroup>
				<optgroup label="Alabama">
					<option>Birmingham</option>
					<option>Montgomery</option>
					<option>Mobile</option>
					<option>Huntsville</option>
					<option>Tuscaloosa</option>
				</optgroup>
				<optgroup label="Alaska">
					<option>Anchorage</option>
					<option>Fairbanks</option>
					<option>Juneau</option>
					<option>Sitka</option>
					<option>Ketchikan</option>
				</optgroup>
				<optgroup label="Arizona">
					<option>Phoenix</option>
					<option>Tucson</option>
					<option>Mesa</option>
					<option>Chandler</option>
					<option>Glendale</option>
				</optgroup>
				<optgroup label="Arkansas">
					<option>Little Rock</option>
					<option>Fort Smith</option>
					<option>Fayetteville</option>
					<option>Springdale</option>
					<option>Jonesboro</option>
				</optgroup>
				<optgroup label="California">
					<option>Los Angeles</option>
					<option>San Diego</option>
					<option>San Jose</option>
					<option>San Francisco</option>
					<option>Fresno</option>
				</optgroup>
				<optgroup label="Colorado">
					<option>Denver</option>
					<option>Colorado</option>
					<option>Aurora</option>
					<option>Fort Collins</option>
					<option>Lakewood</option>
				</optgroup>
				<optgroup label="Connecticut">
					<option>Bridgeport</option>
					<option>New Haven</option>
					<option>Hartford</option>
					<option>Stamford</option>
					<option>Waterbury</option>
				</optgroup>
				<optgroup label="Delaware">
					<option>Wilmington</option>
					<option>Dover</option>
					<option>Newark</option>
					<option>Bear</option>
					<option>Middletown</option>
				</optgroup>
				<optgroup label="Florida">
					<option>Jacksonville</option>
					<option>Miami</option>
					<option>Tampa</option>
					<option>St. Petersburg</option>
					<option>Orlando</option>
				</optgroup>
				<optgroup label="Georgia">
					<option>Atlanta</option>
					<option>Augusta</option>
					<option>Columbus</option>
					<option>Savannah</option>
					<option>Athens</option>
				</optgroup>
				<optgroup label="Hawaii">
					<option>Honolulu</option>
					<option>Pearl City</option>
					<option>Hilo</option>
					<option>Kailua</option>
					<option>Waipahu</option>
				</optgroup>
				<optgroup label="Idaho">
					<option>Boise</option>
					<option>Nampa</option>
					<option>Meridian</option>
					<option>Idaho Falls</option>
					<option>Pocatello</option>
				</optgroup>
				<optgroup label="Illinois">
					<option>Chicago</option>
					<option>Aurora</option>
					<option>Rockford</option>
					<option>Joliet</option>
					<option>Naperville</option>
				</optgroup>
				<optgroup label="Indiana">
					<option>Indianapolis</option>
					<option>Fort Wayne</option>
					<option>Evansville</option>
					<option>South Bend</option>
					<option>Hammond</option>
				</optgroup>
				<optgroup label="Iowa">
					<option>Des Moines</option>
					<option>Cedar Rapids</option>
					<option>Davenport</option>
					<option>Sioux City</option>
					<option>Waterloo</option>
				</optgroup>
				<optgroup label="Kansas">
					<option>Wichita</option>
					<option>Overland Park</option>
					<option>Kansas City</option>
					<option>Topeka</option>
					<option>Olathe </option>
				</optgroup>
				<optgroup label="Kentucky">
					<option>Louisville</option>
					<option>Lexington</option>
					<option>Bowling Green</option>
					<option>Owensboro</option>
					<option>Covington</option>
				</optgroup>
				<optgroup label="Louisiana">
					<option>New Orleans</option>
					<option>Baton Rouge</option>
					<option>Shreveport</option>
					<option>Metairie</option>
					<option>Lafayette</option>
				</optgroup>
				<optgroup label="Maine">
					<option>Portland</option>
					<option>Lewiston</option>
					<option>Bangor</option>
					<option>South Portland</option>
					<option>Auburn</option>
				</optgroup>
				<optgroup label="Maryland">
					<option>Baltimore</option>
					<option>Frederick</option>
					<option>Rockville</option>
					<option>Gaithersburg</option>
					<option>Bowie</option>
				</optgroup>
				<optgroup label="Massachusetts">
					<option>Boston</option>
					<option>Worcester</option>
					<option>Springfield</option>
					<option>Lowell</option>
					<option>Cambridge</option>
				</optgroup>
				<optgroup label="Michigan">
					<option>Detroit</option>
					<option>Grand Rapids</option>
					<option>Warren</option>
					<option>Sterling Heights</option>
					<option>Lansing</option>
				</optgroup>
				<optgroup label="Minnesota">
					<option>Minneapolis</option>
					<option>St. Paul</option>
					<option>Rochester</option>
					<option>Duluth</option>
					<option>Bloomington</option>
				</optgroup>
				<optgroup label="Mississippi">
					<option>Jackson</option>
					<option>Gulfport</option>
					<option>Southaven</option>
					<option>Hattiesburg</option>
					<option>Biloxi</option>
				</optgroup>
				<optgroup label="Missouri">
					<option>Kansas City</option>
					<option>St. Louis</option>
					<option>Springfield</option>
					<option>Independence</option>
					<option>Columbia</option>
				</optgroup>
				<optgroup label="Montana">
					<option>Billings</option>
					<option>Missoula</option>
					<option>Great Falls</option>
					<option>Bozeman</option>
					<option>Butte-Silver Bow</option>
				</optgroup>
				<optgroup label="Nebraska">
					<option>Omaha</option>
					<option>Lincoln</option>
					<option>Bellevue</option>
					<option>Grand Island</option>
					<option>Kearney</option>
				</optgroup>
				<optgroup label="Nevada">
					<option>Las Vegas</option>
					<option>Henderson</option>
					<option>North Las Vegas</option>
					<option>Reno</option>
					<option>Sunrise Manor</option>
				</optgroup>
				<optgroup label="New Hampshire">
					<option>Manchesters</option>
					<option>Nashua</option>
					<option>Concord</option>
					<option>Dover</option>
					<option>Rochester</option>
				</optgroup>
				<optgroup label="New Jersey">
					<option>Newark</option>
					<option>Jersey City</option>
					<option>Paterson</option>
					<option>Elizabeth</option>
					<option>Edison</option>
				</optgroup>
				<optgroup label="New Mexico">
					<option>Albuquerque</option>
					<option>Las Cruces</option>
					<option>Rio Rancho</option>
					<option>Santa Fe</option>
					<option>Roswell</option>
				</optgroup>
				<optgroup label="New York">
					<option>New York</option>
					<option>Buffalo</option>
					<option>Rochester</option>
					<option>Yonkers</option>
					<option>Syracuse</option>
				</optgroup>
				<optgroup label="North Carolina">
					<option>Charlotte</option>
					<option>Raleigh</option>
					<option>Greensboro</option>
					<option>Winston-Salem</option>
					<option>Durham</option>
				</optgroup>
				<optgroup label="North Dakota">
					<option>Fargo</option>
					<option>Bismarck</option>
					<option>Grand Forks</option>
					<option>Minot</option>
					<option>West Fargo</option>
				</optgroup>
				<optgroup label="Ohio">
					<option>Columbus</option>
					<option>Cleveland</option>
					<option>Cincinnati</option>
					<option>Toledo</option>
					<option>Akron</option>
				</optgroup>
				<optgroup label="Oklahoma">
					<option>Oklahoma City</option>
					<option>Tulsa</option>
					<option>Norman</option>
					<option>Broken Arrow</option>
					<option>Lawton</option>
				</optgroup>
				<optgroup label="Oregon">
					<option>Portland</option>
					<option>Eugene</option>
					<option>Salem</option>
					<option>Gresham</option>
					<option>Hillsboro</option>
				</optgroup>
				<optgroup label="Pennsylvania">
					<option>Philadelphia</option>
					<option>Pittsburgh</option>
					<option>Allentown</option>
					<option>Erie</option>
					<option>Reading</option>
				</optgroup>
				<optgroup label="Rhode Island">
					<option>Providence</option>
					<option>Warwick</option>
					<option>Cranston</option>
					<option>Pawtucket</option>
					<option>East Providence</option>
				</optgroup>
				<optgroup label="South Carolina">
					<option>Columbia</option>
					<option>Charleston</option>
					<option>North Charleston</option>
					<option>Mount Pleasant</option>
					<option>Rock Hill</option>
				</optgroup>
				<optgroup label="South Dakota">
					<option>Sioux Falls</option>
					<option>Rapid City</option>
					<option>Aberdeen</option>
					<option>Brookings</option>
					<option>Watertown</option>
				</optgroup>
				<optgroup label="Tennessee">
					<option>Memphis</option>
					<option>Nashville</option>
					<option>Knoxville</option>
					<option>Chattanooga</option>
					<option>Clarksville</option>
				</optgroup>
				<optgroup label="Texas">
					<option>Houston</option>
					<option>San Antonio</option>
					<option>Dallas</option>
					<option>Austin</option>
					<option>Fort Worth</option>
				</optgroup>
				<optgroup label="Utah">
					<option>Salt Lake City</option>
					<option>West Valley City</option>
					<option>Provo</option>
					<option>West Jordan</option>
					<option>Orem</option>
				</optgroup>
				<optgroup label="Vermont">
					<option>Burlington</option>
					<option>Essex</option>
					<option>South Burlington</option>
					<option>Colchester</option>
					<option>Rutland</option>
				</optgroup>
				<optgroup label="Virginia">
					<option>Virginia Beach</option>
					<option>Norfolk</option>
					<option>Chesapeake</option>
					<option>Arlington</option>
					<option>Richmond</option>
				</optgroup>
				<optgroup label="Washington">
					<option>Seattle</option>
					<option>Spokane</option>
					<option>Tacoma</option>
					<option>Vancouver</option>
					<option>Bellevue</option>
				</optgroup>
				<optgroup label="West Virginia">
					<option>Charleston</option>
					<option>Huntington</option>
					<option>Parkersburg</option>
					<option>Morgantown</option>
					<option>Wheeling</option>
				</optgroup>
				<optgroup label="Wisconsin">
					<option>Milwaukee</option>
					<option>Madison</option>
					<option>Green Bay</option>
					<option>Kenosha</option>
					<option>Racine</option>
				</optgroup>
				<optgroup label="Wyoming">
					<option>Cheyenne</option>
					<option>Casper</option>
					<option>Laramie</option>
					<option>Gillette</option>
					<option>Rock Springs</option>
				</optgroup>
  </select>
</div>
      </div>
      <div class="modal-footer">
  <button type="submit" class="btn btn-success" name="btn111" style="color: white " >Submit</button>      </div>
    </div>
  </div>
</div>


<!--electro store-->
<div class="row">
	<div class="col-md-3 col-xs-12" >
		<img src="images/logo2.png" class="image">

		<h1 class="ele pull-right">Electro Store</h1>
	</div>

	<div class="col-md-6 col-xs-12" >
		

<form class="form-inline">
  <div class="form-group">
    <div class="Search">
      <input type="text" class="form-control Search" id="inputEmail3" placeholder="Search">
    </div>
  </div>
    <button type="submit" class="btn btn-lg serach">Search</button>
</form>

	</div>

	<div class="col-md-3 col-xs-12" >
      <div class="cartdiv">		<a href="cart.jsp"><span class="fas fa-cart-arrow-down	cartt"></span></a></div>
	</div>

</div>

<%  Connection conn=DbConnection.getConnection();
PreparedStatement ps,ps1,ps2,ps3,ps4,ps5;ResultSet rs,rs1,rs2,rs3,rs4,rs5;%>


<!--navbar-->
<nav class="navbar navbar-default pad">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
   <!--  <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div> -->

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      
      
      
        <li class="active"><a href="home.jsp" class="fontss">Home <span class="sr-only">(current)</span></a></li>
        
        <li class="dropdown colorrrr ">
        <%
    		 ps1=conn.prepareStatement("select * from category where id=1");
     rs1=ps1.executeQuery();
    	while(rs1.next()){
    		
    	
    		%>
          <a href="electronics.html" class="dropdown-toggle fontss" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= rs1.getString("cat_name") %><span class="caret"></span></a>
      
          <ul class="dropdown-menu">
          <% 
          ps2=conn.prepareStatement("select * from subcategory limit 0,3");
          rs2=ps2.executeQuery();
          while(rs2.next()){
          
          %>
            <li><a class="fontss" href="electronics.jsp?sid=<%= rs2.getInt("id") %>"><%= rs2.getString("subcat_name") %></a></li>
           <!--  <li><a href="electronics.jsp">Computers And Laptops</a></li>
            <li><a href="electronics.jsp">Smart Watches</a></li> -->
<%} %>
          </ul>
                    <%} %>
          
        </li>

<li class="dropdown colorrrr">
 <%
    		 ps3=conn.prepareStatement("select * from category where id=2");
     rs3=ps3.executeQuery();
    	while(rs3.next()){
    		
    	
    		%>
          <a href="appliances.html" class="dropdown-toggle fontss" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= rs3.getString("cat_name") %><span class="caret"></span></a>
          <ul class="dropdown-menu">
             <% 
          ps4=conn.prepareStatement("select * from subcategory limit 3,3");
          rs4=ps4.executeQuery();
          while(rs4.next()){
          
          %>
           <li><a class="fontss" href="appliances.jsp?aid=<%= rs4.getInt("id") %>"><%= rs4.getString("subcat_name") %></a></li>
           
  
<%} %>
          </ul>
           
            <%} %>
        </li> 
         
            
<li class="colorrrr fontss"><a class="fontss" href="about.jsp">About Us</a></li>

 <%
    		 ps5=conn.prepareStatement("select * from category where id=3");
     rs5=ps5.executeQuery();
    		
rs5.next();{   	
    		%>
<li class="colorrrr"><a href="new_arrivals.jsp" class="fontss"><%= rs5.getString("cat_name") %></a></li>
<% } %>
<li class="colorrrr"><a href="contact.jsp" class="fontss">Contact Us</a></li>

      </ul>
     
     
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<script type="text/javascript">
	
$(document).ready(function(){


	/* $(".colorrrr").focusin(function(){
		$(this).addClass("licolor");
			});
	$(".colorrrr").focusout(function(){
		$(this).css("background-color", "rgb(247, 248, 250)");
			}); */
	
	
	$(".colorrrr").mouseenter(function(){
		$(this).css("background-color", "lightgray");
			});
	$(".colorrrr").mouseleave(function(){
		$(this).css("background-color", "rgb(247, 248, 250)");
			});
});


</script>

</body>
</html>