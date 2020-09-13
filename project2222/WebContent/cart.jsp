


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="project2222.DbConnection"%>
<link rel="stylesheet" type="text/css" href="css/home1.css">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:include page="header.jsp"></jsp:include> 
<%
Connection conn=DbConnection.getConnection();
PreparedStatement ps,ps2,ps3,ps5,ps6;ResultSet rs,rs2,rs3,rs5,rs6;
%>

<!--  table--> -->
<% 
ps6=conn.prepareStatement("delete from cart where id=" + request.getParameter("cid"));
ps6.executeUpdate();
%>

 <% if(session.getAttribute("id")!=null) {
 ps5=conn.prepareStatement("select product_id from cart where user_id=" + session.getAttribute("id"));
 rs5=ps5.executeQuery();
 if(rs5.next()){
	 
 
 %> 


<%-- <% try { %> --%>
<div class="container">


  
  <table class="table table-bordered">
    <thead>
      <tr class="btn-primary">
        <th class="text-center">S.NO</th>
        <th class="text-center">Product</th>
        <th class="text-center">Product Name</th>
        <th class="text-center">Price</th>
         <th class="text-center">Remove</th>
      </tr>
    </thead>
    <tbody>
     
   
     
      
      
      <% 
    int c=0;
      int total=0;
      ps=conn.prepareStatement("select product_id,id from cart where user_id=" + session.getAttribute("id"));
      rs=ps.executeQuery();
      while(rs.next()){
      ps2=conn.prepareStatement("select * from products where id=" + rs.getInt("product_id"));
      rs2=ps2.executeQuery();
      rs2.next();	
  	  total += rs2.getInt("price")-rs2.getInt("discount");
      c=c+1;
      %>
      
       <tr id="rowremove">
        <td class="text-center"><%= c %></td>
        <td class="text-center"><img src="images/<%= rs2.getString("image")%>"></td>
        <td class="text-center"><%= rs2.getString("name") %></td>
         <td class="text-center">$ <% out.print(rs2.getInt("price")-rs2.getInt("discount")); %></td>
<td class="text-center"><a href="cart.jsp?cid=<%= rs.getInt("id") %>"><span class="fas fa-times"></span></a></td>   
 </tr>
 
       <% } %>
    </tbody>
  </table>
  
  
    
  <table class="table table-bordered">
    <thead>
      <tr class="btn-warning">
        <th class="text-center">Grand Total</th>
        <th class="text-center">Deliver To</th>
        
      </tr>
    </thead>
  
    <tbody>
   
   <% ps3=conn.prepareStatement("select * from register where id=" + session.getAttribute("id"));
rs3=ps3.executeQuery();
rs3.next();
%>
  <% if(rs3.getString("city") != null){%>
      <tr>
        <td class="text-center">$ <%= total  %><br><button class="btn btn-success btn-md">Pay Now</button></td>
        <td  class="text-center"><%= "City :" + rs3.getString("city") %><br><%= "State :" + rs3.getString("state") %><br><%= "Country :" + rs3.getString("country") %><br><%= "House No :" + rs3.getString("house_no") %></td>
      </tr>
     
   <% }else{ %>
       <tr>
        <td class="text-center">$ <%= total  %><br></td>
        <td  class="text-center">Please fill out your address from profile page <a href="profile.jsp">Click Here</a></td>
      </tr>
 <% } %>
    </tbody>
    </tbody>
    </table>
</div>
<%-- <% }catch(Exception e) {
out.print("exceptipn is " + e);
}
%> --%>
 <%     
 } else{
	 out.println("<script type=\"text/javascript\">");
	   out.println("alert('Your Cart Is Empty (Please select some items)');");
	  	out.println("location='home.jsp';");
	   out.println("</script>");
 }
 } else {
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Please login first');");
	  	out.println("location='home.jsp';");
	   out.println("</script>");
}%> 



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

<!-- <script type="text/javascript">

</script> -->
</body>
</html>