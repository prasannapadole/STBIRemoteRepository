<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Institute Project</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%!Connection con;
	PreparedStatement p,p1,p2,ps,ps1,pst,pst1,pst2,pst3,pst4,pst5,pst6,pst7,pst8,pst50;;
	ResultSet r,r1,rr,rr1,rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs50;;
	 long dbINSTITUTEID=0;
   %>
	<%
	session=request.getSession();
	String institutoremailid=(String)session.getAttribute("institutormail");
	con=Dao.getConnection();
	String query="select instituteId,institutename,instituteprinciplename from instituteregi where emailid=?";
	pst=con.prepareStatement(query);
    pst.setString(1,institutoremailid);
    rs=pst.executeQuery();
   
    String dbinstitutename="",dbinstituteprinciplename="";
    while(rs.next())
    	{
    	dbINSTITUTEID=rs.getLong(1);
    	System.out.println("dbinstituteid"+dbINSTITUTEID);
    	dbinstitutename=rs.getString(2);
    	dbinstituteprinciplename=rs.getString(3);
  		 }
	%>
	<nav class="navbar navbar-fixed-top ">
			  <div class="navbar-conteiner">
				    <div class="navbar-header">
				     <!--  <img src="logo/Logo.jpg"> -->
				    </div>
				    <div class="collapse navbar-collapse" id="myNavbar">
					      <ul class="nav navbar-nav">
						     <img src="logo/STBILOGO.jpg" style="width: 200px;margin-top: 12px;">
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
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle-o fa-icons"><br><span class="icon-fonts"><%=dbinstituteprinciplename %></span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">
													<table class="table ">
													    <tbody>
													      <tr>
													        <td>Registration Id</td>
													        <td><%=dbINSTITUTEID %></td>
													      </tr>
													      <tr>
													        <td>Name</td>
													        <td><%=dbinstituteprinciplename %></td>
													      </tr>
													      <tr>
													        <td>Email Id</td>
													        <td><%=institutoremailid %></td>
													      </tr>
													         <tr>
													        <td colspan="2" style="text-align:center;"><a href="InstituteLogout">SignOut</a></td>
													     
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
		long projectid=Long.parseLong(request.getParameter("projectid"));
	%>
<form action="./InstituteRequesttoDeleteproject" method="post" style="margin-top: 100px;">
		 <div style="padding: 30px;" >
				 <div class="form-group">
				    <label for="inputsm">Reason To Delete Project</label>
				 <textarea class="form-control input-md" id="inputsm" rows=" " cols="" name="reason" placeholder="Reason to Delete Project" required></textarea>
					  </div>
					  <div><input type="hidden" name="projectid" value="<%=projectid %>"/> </div>
					  <div class="form-group fload_right">
				      <button type="submit" class="btn btn-info btn-md active">Delete</button>
				      <a button type="button" href="institute-dashboard.jsp" class="btn btn-default" >Back</a>
				      </div>
		</div>
	</form> 
</body>
</html>