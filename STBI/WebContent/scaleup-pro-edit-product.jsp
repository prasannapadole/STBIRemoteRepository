<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scaleup-Product Edit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%!
	long upgrademybusinessid=0;
	Connection con=null;
	String query;
    PreparedStatement ps,ps1,ps2,ps3,pst,pst1,pst2,pst3,pst4,pst5;
    ResultSet r,r1,r2,r3,r4,rs,rs1,rs2,rs3,rs4,rs5;
    %>
              <%
	   		    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		  	    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		    	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		        response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
	    		session=request.getSession();
	    		String upgrademybusinessemail=(String)session.getAttribute("upgrademybusinessemail");
	    		try
      			  {
     			 if(upgrademybusinessemail.equals(null)|| upgrademybusinessemail=="")
      				  {
    	  				response.sendRedirect("scaleup-login.jsp");
	    			  }
       			else
       				{}
     			 }
   				 catch(Exception e)
     				  {
    			response.sendRedirect("scaleup-login.jsp");
       				 }
	    con=Dao.getConnection();
	    query="select mybusinessId,owner from upgrademybusiness where emailid=?";
	    pst=con.prepareStatement(query);
	    pst.setString(1,upgrademybusinessemail);
	    rs=pst.executeQuery();
	    String dbowner="";
	    while(rs.next())
	    {
	    	upgrademybusinessid=rs.getLong(1);
	    	
	    	dbowner=rs.getString(2);
	    }
	   %>
    	<nav class="navbar navbar-fixed-top ">
			  <div class="navbar-conteiner">
				    <div class="navbar-header">
				     <!--  <img src="logo/Logo.jpg"> -->
				    </div>
				    <div class="collapse navbar-collapse" id="myNavbar">
					      <ul class="nav navbar-nav">
						     <img src="logo/STBILOGO.jpg" style="width: 200px;margin-top: 12px;"/>
						  </ul>
					      <ul class="nav navbar-nav navbar-right navbars">
						    <li class="dropdown notification">
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-phone fa-icons"><br><span class="icon-fonts">Contact</span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">Page 1-1</a></li>
								          <li><a href="#">Page 1-2</a></li>
								          <li><a href="#">Page 1-3</a></li>
								        </ul>
					                </a>
						    </li>
					       <li class="dropdown notification">
					       		     <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-calendar-check-o fa-icons"><br><span class="icon-fonts">Event</span></i>
						       		    <span class="label badge">10</span>
						       		    <ul class="dropdown-menu">
								          <li><a href="#">Event Name <span class="badge text-center">12</span></a></li>
								        </ul>
					       		    </a>
						    </li>
					        <li class="dropdown notification">
					                <a  class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-bell-o fa-icons"><br><span class="icon-fonts">Notification</span></i>
					       				<span class="badge badges">10</span>
								        <ul class="dropdown-menu">
								          <li><a href="#">Notification <span class="badge text-center">12</span></a></li>
								        </ul>
					                </a>
						    </li>
					         <li class="dropdown notification">
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle-o fa-icons"><br><span class="icon-fonts"><%=dbowner %></span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">
													<table class="table ">
													    <tbody>
													      <tr>
													        <td>Registration Id</td>
													        <td><%=upgrademybusinessid %></td>
													      </tr>
													      <tr>
													        <td>Name</td>
													        <td><%=dbowner %></td>
													      </tr>
													      <tr>
													        <td>Email Id</td>
													        <td><%=upgrademybusinessemail %></td>
													      </tr>
													       <tr>
													        <td colspan="2" style="text-align:center;"><a href="MybusinessLogout">SignOut</a></td>
													      </tr>
													    </tbody>
													  </table>
											  </a></li>
								        </ul>
					                </a>
						    </li>
					      </ul>
				    </div>
			  </div>
		</nav>
		
		<%
		long scaleupproductid=Long.parseLong(request.getParameter("productid"));
		String query2="select * from upgrademybusinessproductinfo where productId=?";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,scaleupproductid);
		rs2=pst2.executeQuery();
		long dbproductid=0;
		String dbproductname="",dbproductdesc="";
		while(rs2.next())
		    {
			dbproductid=rs2.getLong("productId");
			dbproductname=rs2.getString("productname");
			dbproductdesc=rs2.getString("productdescription");
		    }
			%>
		
		  <form name="educationForm" action="./UpgradeMyBusinessEditProductInfo" method="post" style="margin-top: 100px;">
		          <div class="containers" >
				  <div class="form-group">
				    <label for="inputsm">Product Name</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="productname" value="<%=dbproductname %>" ng-model="name" required/>
				   <input type="hidden" name="productid" value="<%=dbproductid%>"/>
				 
				  </div>
					  </div>
				  <div class="form-group">
				    <label for="inputsm">Description</label>
				    <textarea rows="" cols="" class="form-control"name="description"><%=dbproductdesc %></textarea>
				  </div>
				  <div class="form-group fload_right">
				   <button type="submit" class="btn btn-info btn-md active "
				    			ng-disabled="educationForm.from.$dirty && educationForm.from.$invalid && educationForm.from.$error.pattern 
				    			|| educationForm.to.$dirty && educationForm.to.$invalid && educationForm.to.$error.pattern">Update</button>	
				    <a button type="button" class="btn btn-default" href="scaleup-dashboard.jsp" >Back</a>
				  </div></div></form> 
		</body>
   </html>