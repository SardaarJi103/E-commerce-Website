

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="project2222.DbConnection"%>

<link rel="stylesheet" type="text/css" href="css/home1.css">


 
<% if(request.getParameter("submit")!=null){%>
	<jsp:useBean id="u" class="project2222.Register12" 	/>
	<jsp:setProperty name="u" property="*" />	
<% 
Connection conn = DbConnection.getConnection();
PreparedStatement ps = conn.prepareStatement("update register set mobile= ? , alternate_email =? , house_no = ?,landmark=?,city=?,state=?,country=?,pin_code=? where id=" + session.getAttribute("id"));
ps.setString(1, u.getMobile());
ps.setString(2, u.getAlternate_email());
ps.setString(3, u.getHouse_no());
ps.setString(4, u.getLandmark());
ps.setString(5, u.getCity());
ps.setString(6, u.getState());
ps.setString(7, u.getCountry());
ps.setInt(8, u.getPin_code());
ps.executeUpdate(); // insert , update , delete

} %>

 <jsp:include page="header.jsp"></jsp:include>

<div class="container">
 <% 
  Connection conn=DbConnection.getConnection();
  PreparedStatement ps,ps2,ps3,ps4;ResultSet rs,rs2,rs3,rs4;
  
  %>

  <h1 class="text-center product"><span style="color:#4082ed ">D</span>eliver <span style="color: #4082ed">T</span>o.....</h1>
  
 
  
  <form class="form-horizontal" action="cart.jsp" method="post">
  
  <% 
  ps=conn.prepareStatement("select * from register where id=" + session.getAttribute("id"));
  rs=ps.executeQuery();
 rs.next();
 
  %>
  
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Firstname:</label>
    <div class="col-sm-10">
<p class="form-control-static"><%= rs.getString("firstname") %></p>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Lastname:</label>
    <div class="col-sm-10"> 
<p class="form-control-static"><%= rs.getString("lastname") %></p>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Email:</label>
    <div class="col-sm-10"> 
<p class="form-control-static"><%= rs.getString("email") %></p>
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">Mobile Number</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="mobile" placeholder="mobile nummber" value="<%= rs.getString("mobile")%>">
    </div>
  </div>
  
  <div class="form-group">
    <label  class="col-sm-2 control-label">Alternate Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="alternate_email" placeholder="email" value="<%= rs.getString("alternate_email") %>">
    </div>
  </div>
  
  <div class="form-group">
    <label  class="col-sm-2 control-label">House Number</label>
    <div class="col-sm-10">
 <input type="text" class="form-control" name="house_no" placeholder="house no" value="<%= rs.getString("house_no") %>">    
 </div>
    </div>
  
  
 
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">Landmark</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="landmark" placeholder="landmark" value="<%= rs.getString("landmark") %>">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">City</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="city" placeholder="city" value="<%= rs.getString("city") %>">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">State</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="state" placeholder="state"  value="<%= rs.getString("state") %>">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">Country</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="country" placeholder="country"  value="<%= rs.getString("country") %>">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">Pin Code</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="pin_code" placeholder="pin code" value="<%= rs.getInt("pin_code") %>">
    </div>
  </div>
  

  
  <div class="form-group">
    <label  class="col-sm-2 control-label"></label>
    <div class="col-sm-10">
<input type="submit" class="btn btn-success form-control" name="submit" value="Submit">
  </div>
  </div>


</form>
  
  
</div>

<div class="container-fluid pad" style="height: auto; background-color: #272b30;padding-top: 20px;padding-bottom: 20px;">
	<div class="container">
		<div class="row">
		<div class="col-xs-3">
			<h1 class="pull-left" style="color: white">Categories</h1><br><br><br><br>
			<h5 class="pull-left"><a href="" style="text-decoration: none;color: lightgray">Mobile And Tablets</a></h5><br><br>
					<h5 class="pull-left"><a href="" style="text-decoration: none;color: lightgray">Computer And Laptops</a></h5><br><br>
							<h5 class="pull-left"><a href="" style="text-decoration: none;color: lightgray">Smart Watches</a></h5><br><br>
		    <h5 class="pull-left"><a href="" style="text-decoration: none;color: lightgray">Tv And Lcd</a></h5><br><br>
		    <h5 class="pull-left"><a href="" style="text-decoration: none;color: lightgray">Speakers</a></h5><br><br>
		    <h5 class="pull-left"><a href="" style="text-decoration: none;color: lightgray">Washing machines and refrigeretors</a></h5><br><br>
		</div>

		<div class="col-xs-3">
				<h1 class="pull-left" style="color: white">Quick Links</h1><br><br><br><br>
			<h5 class="pull-left"><a href="about.html" style="text-decoration: none;color: lightgray">About Us</a></h5><br><br>
					<h5 class="pull-left"><a href="contact.html" style="text-decoration: none;color: lightgray">Contact Us</a></h5><br><br>
							<h5 class="pull-left"><a href="help.html" style="text-decoration: none;color: lightgray">Help</a></h5><br><br>
		    <h5 class="pull-left"><a href="faq.html" style="text-decoration: none;color: lightgray">Faqs</a></h5><br><br>
		    <h5 class="pull-left"><a href="terms" style="text-decoration: none;color: lightgray">Terms of use</a></h5><br><br>
		    <h5 class="pull-left"><a href="privacy" style="text-decoration: none;color: lightgray">Privacy Policy</a></h5><br><br>
		</div>

		<div class="col-xs-3">
			<h1 class="pull-left" style="color: white">Quick Links</h1><br><br><br><br>
			<h5 class="pull-left"><a href="about.html" style="text-decoration: none;color: lightgray">123 Sebastian, USA.</a></h5><br><br>
					<h5 class="pull-left"><a href="contact.html" style="text-decoration: none;color: lightgray"> 333 222 3333</a></h5><br><br>
							<h5 class="pull-left"><a href="help.html" style="text-decoration: none;color: lightgray">+222 11 4444</a></h5><br><br>
		    <h5 class="pull-left"><a href="faq.html" style="text-decoration: none;color: lightgray"> mail 1@example.com</a></h5><br><br>
		    <h5 class="pull-left"><a href="terms" style="text-decoration: none;color: lightgray"> mail 2@example.com</a></h5><br><br>
		</div>


		<div class="col-xs-3">
			<h1 class="pull-left" style="color: white">Newsletter</h1><br><br><br><br>
			<h5 class="pull-left"><a href="about.html" style="text-decoration: none;color: lightgray">Free Delivery on your first order!</a></h5><br><br>
					
						<div class="form-group">
							<input type="email" name="em" class="form-control"><br>
							<button class="btn btn-danger">Go</button>
						</div>
						   <div style="height: 50px;width: 50px;border-radius: 100%;background-color: #295db2;float: left;margin-left: 10px;"><span style="color: white;margin-left: 20px;line-height: 50px;" class="fab fa-facebook-f"></span></div>

              <div style="height: 50px;width: 50px;border-radius: 100%;float: left;background-color: red;margin-left: 10px;"><span style="color: white;margin-left: 20px;line-height: 50px;" class="  fab fa-google-plus-g"></span></div>


              <div style="height: 50px;width: 50px;border-radius: 100%;background-color: cyan;float: left;margin-left: 10px;"><span style="color: white;margin-left: 20px;line-height: 50px;" class="  fab fa-twitter"></span></div>
  
   <h1 class="pull-left" style="color: white">Follow Us</h1>
	
		</div>


	</div>
	</div>
</div>



<!-- <script type="text/javascript" src="js/owl.carousel.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script> -->

	<script type="text/javascript">
	
$(document).ready(function(){


	$("#h").click(function(){
		$("#div1").toggle(500);	
			})

	$("#h11").click(function(){
		$("#div11").toggle(500);	
			})

	// $("#owl-demo").owlCarousel({
 
	// 	autoPlay:1000, //Set AutoPlay to 3 seconds
	// 	autoPlay:true,
	// 	items : 5,
	// 	pagination:true,
	// 	itemsDesktop : [640,5],
	// 	itemsDesktopSmall : [414,4]
 
	// });

	});


</script>

