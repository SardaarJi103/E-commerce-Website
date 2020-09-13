

 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="project2222.DbConnection"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" type="text/css" href="css/electronics.css">
<jsp:include page="header.jsp"></jsp:include>


<%

if(request.getParameter("ac")!=null){%>

	<%
	if(session.getAttribute("id") != null){
	 Connection conn=DbConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into cart(user_id,product_id)  values(?,?)");
	ps.setInt(1,Integer.parseInt(session.getAttribute("id").toString()));
	ps.setInt(2,Integer.parseInt(request.getParameter("ac").toString()));
	ps.executeUpdate();
	
	String n=request.getParameter("sid");
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Data is added into Cart')");
	   out.print("location='electronics.jsp?sid=1'");
	   out.println("</script>");
	}else{
			out.println("<script type=\"text/javascript\">");
		   out.println("alert('Please login first incorrect');");
		  	out.println("location='home.jsp';");
		   out.println("</script>");
	}
} %>



<div class="container-fluid mobiless"></div>
<div class="container-fluid" style="background-color: lightgray;">
  <h4 style="margin-left: 50px;">Home    |    <b>Electronics</b></h4>
</div>

  <h1 class="text-center product"><span style="color:#4082ed ">M</span>obile <span style="color: #4082ed">&</span><span style="color: #4082ed">T</span>ablets</h1>



  <!--New Mobiles-->

  <div class="container">
<% Connection conn=DbConnection.getConnection();
PreparedStatement ps,ps1,ps2,ps3,ps4,ps5;ResultSet rs,rs1,rs2,rs3,rs4,rs5;
%>

    <div class="row">
      <div class="col-md-9 col-xs-12" style="margin-top: 50px;">
        


<div class="row row1">

<% if(request.getParameter("sid")!=null){ %> 

<% 
ps=conn.prepareStatement("select * from products where  product_home=2 and subcat_id=" + request.getParameter("sid") + " limit 3");
rs=ps.executeQuery();
while(rs.next()){
%>

  <div class="col-sm-6 col-md-4 botimage" >
    <div class="thumbnail">
    	<a href="single.jsp?qv=<%= rs.getInt("id") %>" class="btn btn-primary view">Quick View</a>
      <img src="images/<%= rs.getString("image") %>" alt="..." class="mobile">
      <div class="caption">
        <h3 class="text-center"><%= rs.getString("name") %></h3>
        <h3 class="text-center"><span style="color: red">$ <% out.print(rs.getInt("price")-rs.getInt("discount")) ; %></span> <del>$ <%= rs.getInt("price") %></del></h3>
      
       <p><a href="electronics.jsp?ac=<%= rs.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>
      </div>
    </div>
  </div>
  <%} %>
  </div>
  





<div class="row row2">

<% 
ps2=conn.prepareStatement("select * from products where  product_home=2 and subcat_id=" + request.getParameter("sid") + " limit 3,3");
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
      
 <p><a href="electronics.jsp?ac=<%= rs2.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>      </div>
    </div>
  </div>
  <%} %>
</div>






<div class="row row2">

<% 
ps3=conn.prepareStatement("select * from products where  product_home=2 and subcat_id=" + request.getParameter("sid") + " limit 6,3");
rs3=ps3.executeQuery();
while(rs3.next()){
%>
  
  <div class="col-sm-6 col-md-4 botimage" >
    <div class="thumbnail">
    	<a href="single.jsp?qv=<%= rs3.getInt("id") %>" class="btn btn-primary view">Quick View</a>
      <img src="images/<%= rs3.getString("image") %>" alt="..." class="mobile">
      <div class="caption">
        <h3 class="text-center"><%= rs3.getString("name") %></h3>
        <h3 class="text-center"><span style="color: red">$ <% out.print(rs3.getInt("price")-rs3.getInt("discount")) ; %></span> <del>$ <%= rs3.getInt("price") %></del></h3>
      
  <p><a href="electronics.jsp?ac=<%= rs3.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>      </div>
    </div>
  </div>
<% } %>

</div>



<div class="row row2">
  
  <% 
ps4=conn.prepareStatement("select * from products where  product_home=2 and subcat_id=" + request.getParameter("sid") + " limit 9,3");
rs4=ps4.executeQuery();
while(rs4.next()){
%>
  <div class="col-sm-6 col-md-4 botimage" >
    <div class="thumbnail">
    	<a href="single.jsp?qv=<%= rs4.getInt("id") %>" class="btn btn-primary view">Quick View</a>
      <img src="images/<%= rs4.getString("image") %>" alt="..." class="mobile">
      <div class="caption">
        <h3 class="text-center"><%= rs4.getString("name") %></h3>
        <h3 class="text-center"><span style="color: red">$ <% out.print(rs4.getInt("price")-rs4.getInt("discount")) ; %></span> <del>$ <%= rs4.getInt("price") %></del></h3>
      
 <p><a href="electronics.jsp?ac=<%= rs4.getString("id") %>" class="btn  cartbutton" role="button">Add To Cart</a></p>      </div>
    </div>
  </div>
<% }} %>

</div>


      </div>

      <div class="col-md-3 col-xs-12" style="margin-top: 50px;">
        <h3 style="color: red;margin-bottom: 20px;">Search here</h3>
        <form class="form-inline">

          <div class="form-group">
            <input type="text" name="productt" placeholder="Product name" class="form-control">
          </div>
          <button class="btn btn-primary">Go</button>
        </form>
        
<h3 id="h" style="color: red;margin-top: 100px;" class="text-center">Click Here Sort By Price</h3>
<div id="div1" style="display: none;" class="text-center">
  <div class="checkbox">
  <label><input type="checkbox" value="">$200 - $400</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">$400 - $600</label>
</div>
<div class="checkbox ">
  <label><input type="checkbox" value="">$500 - $800</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">$800 - $1000</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">$1000 - $1200</label>
</div>

</div>


<h3 id="h11" style="color: red;margin-top: 100px;" class="text-center">Click Here Sort By Brand</h3>
<div id="div11" style="display: none;" class="text-center">
  <div class="checkbox">
  <label><input type="checkbox" value="">Oppo</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">Vivo</label>
</div>
<div class="checkbox ">
  <label><input type="checkbox" value="">Samsung</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">Huwaie</label>
</div>
<div class="checkbox">
  <label><input type="checkbox" value="">Moto</label>
</div>

</div>


      </div>

    </div>
  </div>


<!--headphones-->
<div class="container-fluid backimage">
  <div class="container">
    <div class="row">
      <div class="col-md-6 Headphone">
        <div class="col-md-9">
          <h3 style="color: red;margin-top: 100px;">Smooth, Rich & Loud Audio</h3>
                 <h2>Branded Headphones</h2>
<h3 style="color: lightgray;margin-bottom: 100px;">Sale up to 25% off all in store</h3>       </div>
        <div class="col-md-3">
          <img src="images/off1.png" class="headimage">
        </div>
      </div>

        <div class="col-md-6 Headphone">
          
          <div class="col-md-9">
          <h3 style="color: red;margin-top: 100px;">A Bigger Phone</h3>
                 <h2>Smart Phone 5</h2>
<h3 style="color: lightgray;margin-bottom: 100px;">Sale up to 25% off all in store</h3>       </div>
        <div class="col-md-3">
          <img src="images/off2.png" class="headimage">
        </div>
        </div>
    </div>
  </div>

</div>


<div class="container-fluid" style="height: auto; background-color: #272b30;padding-top: 20px;padding-bottom: 20px;">
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



  <script type="text/javascript">
  
$(document).ready(function(){


  $("#h").click(function(){
    $("#div1").toggle(500); 
      })

  $("#h11").click(function(){
    $("#div11").toggle(500);  
      })

  });


</script>

</body>
</html>