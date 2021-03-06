<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   		 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
   		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   </head>
	<body ng-app="">
		<%!
	long sigid=0;
	Connection con=null;
	String query;
    PreparedStatement p,p1,p2,ps,ps1,pst,pst1,pst2,pst3,pst4;
    ResultSet rr,rr1,rr2,r,r1,rs,rs1,rs2,rs3,rs4;
    %>
	<%
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
 		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    	session=request.getSession();
    	String sigemail=(String)session.getAttribute("sigmail");
    	  try
          {
        if(sigemail.equals(null)|| sigemail=="")
          {
      	  response.sendRedirect("sig-login.jsp");
  	 //RequestDispatcher rd=request.getRequestDispatcher("/begin_login.jsp");
  	 // rd.forward(request,response);
  	    }
         else
         {}
        }
      catch(Exception e)
         {
      	response.sendRedirect("sig-login.jsp");
    // RequestDispatcher rd=request.getRequestDispatcher("/begin_login.jsp");
    // rd.forward(request,response);
     }
    	  con=Dao.getConnection();
  	    query="select sigId,groupleadername from sigregi where emailid=?";
  	    pst=con.prepareStatement(query);
  	    pst.setString(1,sigemail);
  	    rs=pst.executeQuery();
  	    String dbgroupleadername="";
  	    while(rs.next())
  	    {
  	    	sigid=rs.getLong(1);
  	    	dbgroupleadername=rs.getString(2);
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
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle-o fa-icons"><br><span class="icon-fonts"><%=dbgroupleadername %></span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">
													<table class="table ">
													    <tbody>
													      <tr>
													        <td>Registration Id</td>
													        <td><%=sigid %></td>
													      </tr>
													      <tr>
													        <td>Name</td>
													        <td><%=dbgroupleadername %></td>
													      </tr>
													      <tr>
													        <td>Email Id</td>
													        <td><%=sigemail %></td>
													      </tr>
													    <tr>
													        <td colspan="2" style="text-align:center;"><a href="SigLogout">SignOut</a></td>
													     
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
	long incubiteeid=Long.parseLong(request.getParameter("dbincubiteeId"));
	String query2="select * from sig_addincubitee where incubiteeId=?";
	pst2=con.prepareStatement(query2);
	pst2.setLong(1,incubiteeid);
	rs2=pst2.executeQuery();
	 long dbincubiteeId=0;
	    String dbincubittename="",dbincubiteemobilenumber="",dbincubitteemailid="";
	    while(rs2.next())
	        {
	    	dbincubiteeId=rs2.getLong("incubiteeId");
	    	dbincubittename=rs2.getString("incubittename");
	    	dbincubiteemobilenumber=rs2.getString("incubiteemobilenumber");
	    	dbincubitteemailid=rs2.getString("incubitteemailid");
	        }
	

	%>
	   <div style="padding: 30px;">
			<form name="editForm" action="./SigEditIncubitee" method="post" style="margin-top: 100px;">
				  <div class="form-group">
				    <label for="inputsm">Incubitee Name:</label>
					 <input class="form-control input-md" id="inputsm" type="text" name="incubiteename" value="<%=dbincubittename %>"  required/>
					  </div>
				 <div class="form-group">
				    <label for="inputsm">Mobile Number:</label>
				    <input class="form-control input-sm" id="inputsm" type="text" name="mobileno" value="<%=dbincubiteemobilenumber %>"  required/>
				    <input type="hidden" name="dbincubiteeId" value="<%=dbincubiteeId %>">
				  </div>
				
				  
				  <div class="form-group">
				    <label for="inputsm">Email ID:</label>
				   <input class="form-control input-sm" id="inputsm" type="text" name="emailid" value="<%=dbincubitteemailid %>"  required/>
				  </div>
				  <div class="fload_right">
				  		<button type="submit" class="btn btn-info btn-md active"
				  		        ng-disabled="editForm.dates.$error.pattern"
				  		>Update</button>
				  		<a button type="submit" class="btn btn-default" href="sig-dashboard.jsp">Back</a>
				  </div>
			</form> 
		</div>
	</body>
</html>