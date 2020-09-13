

<%@page import="project2222.DbConnection"%>
<link rel="stylesheet" type="text/css" href="css/home1.css">

<jsp:include page="header.jsp"></jsp:include>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!---carousel-->

 <%

if(request.getParameter("ac")!=null){%>

	<%
	if(session.getAttribute("id") != null){
	 Connection conn=DbConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into cart(user_id,product_id)  values(?,?)");
	ps.setInt(1,Integer.parseInt(session.getAttribute("id").toString()));
	ps.setInt(2,Integer.parseInt(request.getParameter("ac").toString()));
	ps.executeUpdate();
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Data is added into Cart')");
	   out.println("</script>");
	}else{
			out.println("<script type=\"text/javascript\">");
		   out.println("alert('Please login first incorrect');");
		  	out.println("location='home.jsp';");
		   out.println("</script>");
	}
} %>

<div class="container-fluid pad">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active carimage">
      <img src="images/b1.jpg" alt="..." class="carimage">
      <div class="carousel-caption captionn">
      <h1 class="pull-left">Get flat 10% Cashback</h1><br><br><br><br>
       <h1 class="pull-left">BEST HEADPHONE</h1><br><br><br><br>
       <button class="btn btn-primary btn-lg pull-left">Shop Now</button>
      </div>
    </div>

    <div class="item carimage">
      <img src="images/b2.jpg" alt="..."  class="carimage">
      <div class="carousel-caption captionn ">
      <h1 class="pull-left">Get flat 10% Cashback</h1><br><br><br><br>
       <h1 class="pull-left">BEST HEADPHONE</h1><br><br><br><br>
       <button class="btn btn-primary btn-lg pull-left">Shop Now</button>
      </div>
    </div>


    <div class="item  carimage">
      <img src="images/b3.jpg" alt="..." class="carimage">
      <div class="carousel-caption captionn">
       <h1 class="pull-left">Get flat 10% Cashback</h1><br><br><br><br>
       <h1 class="pull-left">BEST HEADPHONE</h1><br><br><br><br>
       <button class="btn btn-primary btn-lg pull-left">Shop Now</button>
      </div>
    </div>

    <div class="item carimage">
      <img src="images/b4.jpg" alt="..." class="carimage">
      <div class="carousel-caption captionn">
        <h1 class="pull-left">Get flat 10% Cashback</h1><br><br><br><br>
       <h1 class="pull-left">BEST HEADPHONE</h1><br><br><br><br>
       <button class="btn btn-primary btn-lg pull-left">Shop Now</button>
      </div>
    </div>
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	</div>

	<h1 class="text-center product"><span style="color:#4082ed ">O</span>ur <span style="color: #4082ed">N</span>ew <span style="color: #4082ed">P</span>roducts</h1>


	<!--New Mobiles-->

	<div class="container pad">

<% 
Connection conn=DbConnection.getConnection();
PreparedStatement ps, ps2, ps3, ps4,ps5;ResultSet rs, rs2, rs3, rs4,rs5;
%>

		<div class="row">
			<div class="col-md-9 col-xs-12" style="margin-top: 50px;">
				


<div class="row row1">



	<h1 class="text-center brand">New Brand Mobiles</h1>
	
	
	
	<%
ps=conn.prepareStatement("select * from products where product_home=1 limit 0,3");
rs=ps.executeQuery();
while(rs.next()){
	
	

	

%>


  <div class="col-sm-6 col-md-4 botimage" >
    <div class="thumbnail">
    	<a href="single.jsp?qv=<%= rs.getInt("id") %>" class="btn btn-primary view">Quick View</a>
      <img src="images/<%= rs.getString("image") %>" alt="..." class="mobile">
      <div class="caption">
        <h3 class="text-center"><%= rs.getString("name") %></h3>
        <h3 class="text-center"><span style="color: red">$ <% out.print(rs.getInt("price")-rs.getInt("discount")) ; %></span> <del>$ <%= rs.getString("price") %></del></h3>
      
        <p><a href="home.jsp?ac=<%= rs.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>
      </div>
    </div>
  </div>
  <% }  %>
  
  


</div>



<div class="row row2">
	<h1 class="text-center brand">Tv & Audio</h1>
	
		
	<%
ps2=conn.prepareStatement("select * from products where product_home=1 limit 3,3");
rs2=ps2.executeQuery();
while(rs2.next()){
	

%>
  <div class="col-sm-6 col-md-4 botimage" >
    <div class="thumbnail">
    	<a href="single.jsp?qv=<%= rs2.getInt("id") %>" class="btn btn-primary view">Quick View</a>
      <img src="images/<%= rs2.getString("image") %>" alt="..." class="mobile">
      <div class="caption">
        <h3 class="text-center"><%= rs2.getString("name") %></h3>
        <h3 class="text-center"><span style="color: red">$ <% out.print(rs2.getInt("price")-rs2.getInt("discount")) ; %></span> <del>$ <%= rs2.getString("price") %></del></h3>
      
        <p><a href="home.jsp?ac=<%= rs2.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>
        </div>
    </div>
  </div>
<% } %>



</div>




<div class="row row3">

    

<div class="col-sm-6 col-md-3">
    <h1 class="summer">Summer <br>Carnival</h1>
    <div class="extra">Get Extra 10% Off</div>
  </div>

<div class="col-sm-6 col-md-9">
   <img src="images/image1.png" style="margin-left: 100px;">
  </div>


</div>


<div class="row row2">
	<h1 class="text-center brand">Large Appliances</h1>
	
		<%
ps3=conn.prepareStatement("select * from products where product_home=1 limit 6,3");
rs3=ps3.executeQuery();
while(rs3.next()){
	

%>
  <div class="col-sm-6 col-md-4 botimage" >
    <div class="thumbnail">
    	<a href="single.jsp?qv=<%= rs3.getInt("id") %>" class="btn btn-primary view">Quick View</a>
      <img src="images/<%= rs3.getString("image") %>" alt="..." class="mobile">
      <div class="caption">
        <h3 class="text-center"><%= rs3.getString("name") %></h3>
        <h3 class="text-center"><span style="color: red">$ <% out.print(rs3.getInt("price")-rs3.getInt("discount")) ; %></span> <del>$ <%= rs3.getString("price") %></del></h3>
      
        <p><a href="home.jsp?ac=<%= rs3.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>
        </div>
    </div>
  </div>
<% } %>


</div>

			</div>

			<div class="col-md-3 col-xs-12" style="margin-top: 50px;">
				<h3 style="color: red;margin-bottom: 20px;">Search here</h3>
				<form class="form-inline">

					<div class="form-group">
						<input type="text" name="productt" placeholder="Product name" class="form-control" >
					</div>
					<button class="btn btn-primary">Go</button>
				</form>
				
<h3 id="h" style="color: red;margin-top: 100px;" class="text-center">Click Here Sort By Price</h3>
<div id="div1" style="display: none;" class="text-center">
	<div class="checkbox">
  <label><input type="checkbox" value="" name="first">$150 - $200</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">$200 - $300</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="" disabled>$300 - $450</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">$500 - $1100</label>
</div>

</div>


<h3 id="h11" style="color: red;margin-top: 100px;" class="text-center">Click Here Sort By Category</h3>
<div id="div11" style="display: none;" class="text-center">
	<div class="checkbox">
  <label><input type="checkbox" value="">New Brand Mobiles</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">Tv And Audio</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="" disabled>Large Appliances</label>
</div>

</div>


			</div>

		</div>
	</div>

<!--headphones-->
<div class="container-fluid backimage pad">
	<div class="container">
		<div class="row">
			<div class="col-md-6 Headphone">
				<div class="col-md-9">
					<h3 style="color: red;margin-top: 100px;">Smooth, Rich & Loud Audio</h3>
                 <h2>Branded Headphones</h2>
<h3 style="color: lightgray;margin-bottom: 100px;">Sale up to 25% off all in store</h3>				</div>
				<div class="col-md-3">
					<img src="images/off1.png" class="headimage">
				</div>
			</div>

				<div class="col-md-6 Headphone">
					
					<div class="col-md-9">
					<h3 style="color: red;margin-top: 100px;">A Bigger Phone</h3>
                 <h2>Smart Phone 5</h2>
<h3 style="color: lightgray;margin-bottom: 100px;">Sale up to 25% off all in store</h3>				</div>
				<div class="col-md-3">
					<img src="images/off2.png" class="headimage">
				</div>
				</div>
		</div>
	</div>

</div>

<!--footer-->
<div class="container pad" style="margin-bottom: 50px;margin-top: 50px;">
	<h2><b>Electronics :</b></h2>
	<h4 style="word-spacing: 2px;letter-spacing: 1px;line-height: 30px;">If you're considering a new laptop, looking for a powerful new car stereo or shopping for a new HDTV, we make it easy to find exactly what you need at a price you can afford. We offer Every Day Low Prices on TVs, laptops, cell phones, tablets and iPads, video games, desktop computers, cameras and camcorders, audio, video and more.

</h4>
</div>


<!-- special -->
	<!-- <div class="special">
		<div class="container" style="height: auto;margin-bottom: 50px;">
			<div class="wthree-special-heading text-center">
				<h3 style="font-size: 50px;">Today Special</h3>
			</div>
			<div class="special-grids">
				<div id="owl-demo" class="owl-carousel owl-theme">
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s1.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$20</del> $15</p>
								</div>
							</div>	
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s2.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$25</del> $10</p>
								</div>
							</div>	
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s3.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$16</del> $12</p>
								</div>
							</div>	
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s4.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$32</del> $22</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s1.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$20</del> $15</p>
								</div>
							</div>	
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s2.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$25</del> $10</p>
								</div>
							</div>	
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s3.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$16</del> $12</p>
								</div>
							</div>	
						</div>
						<div class="item">
							<div class="w3-agileits-special-grid-info">
								<img src="images/s4.jpg" alt="" />
								<div class="agile-special-grid-text"> 
									<h5>Pellentesque justo enim, tempor et tellus eu, molestie viverra ligula.</h5>
									<p><del>$32</del> $22</p>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- //special -->


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

</body>
</html>