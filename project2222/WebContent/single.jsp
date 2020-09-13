

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="project2222.DbConnection"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" type="text/css" href="css/home1.css">

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
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Data is added into Cart')");
	   out.println("</script>");
	}else{
			out.println("<script type=\"text/javascript\">");
		   out.println("alert('Please login first incorrect');");
/* 		  	out.println("location='home.jsp';");
 */		   out.println("</script>");
	}
} %>


  <h1 class="text-center product"><span style="color:#4082ed ">P</span>roduct <span style="color: #4082ed">D</span>etails</h1>




<div class="container" style="margin-top: 50px;margin-bottom: 50px;">
<%
Connection conn=DbConnection.getConnection();
PreparedStatement ps=conn.prepareStatement("select * from products where id=" + request.getParameter("qv"));
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>

<div class="row">

<div class="col-md-12">

<div class="row">
<div class="col-md-3" id="samples">
<img id="zoom1"  onmousemove="zoomIn(event)" onmouseout="zoomOut()" src="images/<%= rs.getString("image") %>" ><!-- style="width:50%;" -->
</div>
<div class="col-md-9">
<div id="preview" onmousemove="zoomIn(event)"></div>
</div>
</div>
</div>
</div>

<div class="row">

 <div class="col-md-6">
<h1>Product Name : <%= rs.getString("name") %></h1>
<h1>Description : <%= rs.getString("description") %></h1>
<h1>Price : <%= rs.getInt("price") %></h1>
<h1>Discounted Price : <% out.print(rs.getInt("price")-rs.getInt("discount")); %></h1>

<a href="single.jsp?ac=<%= rs.getString("id") %>&qv=<%= request.getParameter("qv")  %>" class="btn cartbutton btn-block" role="button">Add To Cart</a>



<a href="cart.jsp?cj" class="btn cartbutton btn-block" role="button">View Cart</a>

          
		
</div>
<% } %>
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
          <h5 class="pull-left">
            <div class="form-group">
              <input type="email" name="em" class="form-control"><br>
              <button class="btn btn-danger">Go</button>
            </div>
              <h1 class="pull-left" style="color: white">Follow Us</h1>
  
    </div>


  </div>
  </div>
</div>


<script type="text/javascript">
	
function zoomIn(event) {
	var i=document.getElementById("zoom1").src;
	  //alert(i);
	  
	  var k = 'url('+i+')';
	  console.log(k);
	  
  var pre = document.getElementById("preview");
  pre.style.visibility = "visible";
  
  $('#zoom1').is(':hover') 
        var img = document.getElementById("zoom1");
		pre.style.background=k;
    
  /*if ($('#zoom2').is(':hover')){
		var img = document.getElementById("zoom2");
		pre.style.backgroundImage = "url('unnamed.jpg')";
  } */
  var posX = event.offsetX;
  var posY = event.offsetY;
  pre.style.backgroundPosition=(-posX*4)+"px "+(-posY*1.2)+"px";

}

function zoomOut() {
  var pre = document.getElementById("preview");
  pre.style.visibility = "hidden";
}


</script>


</body>
</html>