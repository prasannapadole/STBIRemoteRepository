<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="scaleupDashboard" ng-controller="scaleupctrldashboard">
	<head>
	    <title>Scaleup Project Response</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/scaleupdashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/scaleup-dashboard.js"></script>
	    <script src="js/city-navbar.js"></script>
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
		<div class="container">
			<div class="top">
			    <h3 class="text-center">Responses</h3><hr>
				<table class="table table-hover">
				    <thead>
				     <tr>
				        <th class="table-fent-gray">SIG GroupName:</th> 
				        <th class="table-fent-gray">Group LeaderName:</th>
				        <th class="table-fent-gray">SIG GroupType:</th>
				        <th class="table-dark-gray">Mobile Number:</th>
				        <th class="table-fent-gray">Email Id:</th>
				        <th class="table-dark-gray"></th>
				       </tr>
				    </thead>
				    
				    <%
				    
				    long projectid=Long.parseLong(request.getParameter("projectId"));
				    // String query2=" select sigregi.siggroupname,sigregi.groupleadername,sigregi.siggrouptype,sigregi.mobilenumber,sigregi.emailid from sig_appliedfor_project,sigregi where sigregi.sigId=sig_appliedfor_project.sigId and sig_appliedfor_project.projectId=?";
				 
				    String query2=" select sigregi.siggroupname,sigregi.groupleadername,sigregi.siggrouptype,sigregi.mobilenumber,sigregi.emailid from sig_appliedfor_project,sigregi where sigregi.sigId=sig_appliedfor_project.sigId and sig_appliedfor_project.projectId=?";
				     
				     
				    pst2=con.prepareStatement(query2);
				    pst2.setLong(1,projectid);
				    rs2=pst2.executeQuery();
				    String dbsiggroupname="",dbgroupleadername="",dbsiggrouptype="", dbmobilenumber="",dbemailid="";
				    while(rs2.next())
				    {
				    	dbsiggroupname=rs2.getString(1);
				    	dbgroupleadername=rs2.getString(2);
				    	dbsiggrouptype=rs2.getString(3);
				    	dbmobilenumber=rs2.getString(4);
				    	dbemailid=rs2.getString(5);
				    %>
				      <tbody>
					      <tr>
					        <td><p class="text-center"><%=dbsiggroupname %></p></td>
					        <td><p class="text-center"><%=dbgroupleadername %></p></td>
					        <td><p class="text-center"><%=dbsiggrouptype %></p></td>
					        <td><p class="text-center"><%=dbmobilenumber %></p></td>
					          <td><p class="text-center"><%=dbemailid %></p></td> 
					        <td><p class="text-center"><button class="btn btn-info btn-xs active ">View</button></p></td>
					      </tr>
					    </tbody>
				    
				    
				    <%}%>
				   
				  </table>
			</div>
		</div>
	</body>
</html>