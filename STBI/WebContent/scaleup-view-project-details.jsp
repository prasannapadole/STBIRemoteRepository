<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  ng-app="scaleupDashboard" ng-controller="scaleupctrldashboard">
	 <head>
	    <title>Scaleup Project Details</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/begin-view-all-details.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/city-navbar.js"></script>
	    <script src="js/scaleup-dashboard.js"></script>
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
		
		long dbprojectId=Long.parseLong(request.getParameter("dbprojectId"));
		String query2="select upgrademybusiness.mybusinessId,upgrademybusiness.industryname,upgrademybusiness.companyofficeaddress,upgrademybusiness.companydescription,upgrademybusinessprojectinfo.projectId,upgrademybusinessprojectinfo.projecttitle,upgrademybusinessprojectinfo.projectdesc,upgrademybusinessprojectinfo.availableresources,upgrademybusinessprojectinfo.expectedskills,upgrademybusinessprojectinfo.allocatedfund,upgrademybusinessprojectinfo.milestone,upgrademybusinessprojectinfo.status,upgrademybusinessprojectinfo.applydate from upgrademybusiness,upgrademybusinessprojectinfo where upgrademybusiness.mybusinessId=upgrademybusinessprojectinfo.mybusinessId and upgrademybusinessprojectinfo.projectId=?";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,dbprojectId);
		rs2=pst2.executeQuery();
		long dbupgrademybusinessid=0, dbprojectid=0;
		String dbprojecttitle="",dbcompanyname="",dbcompanynameaddress="",dbprojectdesc="",dbcompanydescription="",dbavailableresources="",dbexpectedskills="",dballocatedfund="",dbmilestone="",dbstatus="",dbapplydate="";
		while(rs2.next())
		{
			dbupgrademybusinessid=rs2.getLong(1);
		    dbcompanyname=rs2.getString(2);
		    dbcompanynameaddress=rs2.getString(3);
		    dbcompanydescription=rs2.getString(4);
			dbprojectid=rs2.getLong(5);
			dbprojecttitle=rs2.getString(6);
			dbprojectdesc=rs2.getString(7);
	        dbavailableresources=rs2.getString(8);
			dbexpectedskills=rs2.getString(9);
			dballocatedfund=rs2.getString(10);
			dbmilestone=rs2.getString(11);
			dbstatus=rs2.getString(12);
			dbapplydate=rs2.getString(13);
		}
			%>
		<div class="containers" ng-app="begin-user-data" ng-controller="begin-user-Ctrl">
			<div class="top">
			   <div class="panel panel-default card ">
					<div class="panel-body">
						<div class="panel panel-default panels">
							<div class="panel-body">
								<div class="idealabels">
									<label >PROJECT DETAILS</label>
								</div>
								<div>
								<div class="user-idea-details">
										<label>PROJECT ID</label>
										<p class="idea-data-width"><%=dbprojectid %></p>
									</div>
									<div class="user-idea-details">
										<label>Project Name</label>
										<p class="idea-data-width"><%=dbprojecttitle %></p>
									</div>
									<div class="user-idea-details">
										<label>Company Name</label>
										<p class="idea-data-width"><%=dbcompanyname %></p>
									</div>
									
									<div class="user-idea-details">
										<label>Company Address</label>
										<p class="idea-data-width"><%=dbcompanynameaddress %></p>
									</div>
									<div class="user-idea-details">
										<label>Skills that you are looking for</label>
										<p class="idea-data-width"><%=dbexpectedskills %></p>
									</div>
									<div class="user-idea-details">
										<label>Allocated Fund</label>
										<p class="idea-data-width"><%=dballocatedfund %></p>
									</div>
									<div class="user-idea-details">
										<label>Milestone</label>
										<p class="idea-data-width"><%=dbmilestone %></p>
									</div>
									<div class="user-idea-details">
										<label>Available Resources</label>
										<p class="idea-data-width"><%=dbavailableresources %></p>
									</div>
									<div class="user-idea-details">
										<label>Project Description</label>
										<p class="idea-data-width"><%=dbprojectdesc %></p>
									</div>
									<div class="user-idea-details">
										<label>About Company</label>
										<p class="idea-data-width"><%=dbcompanydescription %></p>
									</div>
									  <div class="form-group">
									    <label for="inputsm">Status</label>
									    <p class="idea-data-width"><%= dbstatus%></p>
									  </div> 
									<div class="form-group">
									    <label for="inputsm">Posted On</label>
									    <p class="idea-data-width"><%= dbapplydate%></p>
									  </div> 
									
								</div>
								<hr>
								<div class="fload_right">
								    <button class="btn btn-warning active">Edit</button>
								    <button class="btn btn-info active">Delete</button>
								    <a button class="btn btn-warning active" href="scaleup-dashboard.jsp">Back</a></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
