<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Incubation Project</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<%!Connection con;
	   PreparedStatement pst,pst1,pst2,pst3,pst4,pst5,pst6,pst7,pst8;
       ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8;
       long dbincubutionid=0;
    %>
   <%
     session=request.getSession();
	 String incubutionemailid=(String)session.getAttribute("incubationemail");
	 con=Dao.getConnection();
	 String query="select incubationId,incubationcentername from incubationregi where emailid=?";
	 pst=con.prepareStatement(query);
     pst.setString(1,incubutionemailid);
     rs=pst.executeQuery();
     String dbincubuionname="";
     while(rs.next())
       {
	   dbincubutionid=rs.getLong(1);
	   dbincubuionname=rs.getString(2);
	   } %>
	
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
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle-o fa-icons"><br><span class="icon-fonts"><%=dbincubuionname %></span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">
													<table class="table ">
													    <tbody>
													      <tr>
													        <td>Registration Id</td>
													        <td><%=dbincubutionid %></td>
													      </tr>
													      <tr>
													        <td> Incubation Name</td>
													        <td><%=dbincubuionname %></td>
													      </tr>
													      <tr>
													        <td>Email Id</td>
													        <td><%=incubutionemailid %></td>
													      </tr>
													       <tr>
													        <td colspan="2" style="text-align:center;"><a href="IncubationLogout">SignOut</a></td>
													     
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
	</nav>
	<%
		long projectid=Long.parseLong(request.getParameter("projectid"));
	%>
<form action="./IncubationRequesttoDeleteproject" method="post" style="margin-top: 100px;">
		 <div style="padding: 30px;" >
				 <div class="form-group">
				    <label for="inputsm">Reason To Delete Project</label>
				 <textarea class="form-control input-md" id="inputsm" rows=" " cols="" name="reason" placeholder="Reason to Delete Project" required></textarea>
					  </div>
					  <div><input type="hidden" name="projectid" value="<%=projectid %>"/> </div>
					  <div class="form-group fload_right">
				      <button type="submit" class="btn btn-info btn-md active">Delete</button>
				      <a button type="button" href="incubation-dashboard.jsp" class="btn btn-default" >Back</a>
				      </div>
		</div>
	</form> 





</body>
</html>