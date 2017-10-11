<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  ng-app="sigDashboard" ng-controller="sigctrldashboard">
	 <head>
	    <title>SIG Internship Details</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/begin-view-all-details.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/sig-dashboard.js"></script>
	    <script src="js/city-navbar.js"></script>
    </head>
	<body>
	<%!
	long sigid=0;
	Connection con=null;
	String query;
    PreparedStatement ps,ps1,pst,pst1,pst2,pst3,pst4;
    ResultSet r,r1,rs,rs1,rs2,rs3,rs4;
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
		<div class="containers">
			<div class="top">
			   <div class="panel panel-default card ">
					<div class="panel-body">
						<div class="panel panel-default panels">
							<div class="panel-body">
								<div class="idealabels">
									<label >INTERNSHIP DETAILS</label>
								</div>
									<%
									long internsid=Long.parseLong(request.getParameter("dbinternsId")); 
									String query1="select * from upgrademybusinesssinternship where internsId=?";
									pst1=con.prepareStatement(query1);
									pst1.setLong(1,internsid);
									rs1=pst1.executeQuery();
									long dbinternsid=0;
									String dbcompanyname="", dbcoursetitle="",dbinternshiplocation="",dbtypeofinternship="",dbstipend="",dbduration="",dbmonthorweek="",dbvacancies="",dbexpectedskill="",dbdescription="",dbcompanydesc="", dbstatus="",dbapplydate="";
									while(rs1.next())
									{
										dbinternsid=rs1.getLong("internsId");
										dbcompanyname=rs1.getString("companyname");
										dbcoursetitle=rs1.getString("coursetitle");
										dbinternshiplocation=rs1.getString("internshiplocation");
										dbtypeofinternship=rs1.getString("typeofinternship");
										dbstipend=rs1.getString("stipend");
										dbduration=rs1.getString("duration");
										dbmonthorweek=rs1.getString("monthorweek");
										dbvacancies=rs1.getString("vacancies");
										dbexpectedskill=rs1.getString("expectedskill");
										dbdescription=rs1.getString("description");
										dbcompanydesc=rs1.getString("companydescription");
										dbstatus=rs1.getString("status");
										dbapplydate=rs1.getString("applydate");
										%>
									<div>
									<div class="user-idea-details">
										<label>Title of Internship</label>
										<p class="font-containt"><%=dbcoursetitle %></p>
									</div>
									<div class="user-idea-details">
										<label>Industry Name</label>
										<p class="font-containt"><%=dbcompanyname %></p>
									</div>
									<div class="row">
									     <div class="col-sm-4">
											<div class="user-idea-details">
												<label>Internship location</label>
												<p class="font-containt"><%=dbinternshiplocation %></p>
									        </div>
									     </div>
									    	  <div class="col-sm-4">
								 			  <div class="user-idea-details">
												<label>Select type of internship</label>
												<p class="font-containt"><%=dbtypeofinternship %></p>
											  </div>
										      </div>
									      <div class="col-sm-4">
											    <div class="user-idea-details">
												<label>Stipend</label>
												<p class="font-containt"><%=dbstipend %> </p>
											    </div>
								   		   </div>
										   </div>
									         <div class="row">
										    <div class="col-sm-4">
											<div class="user-idea-details">
												<label>Posted on</label>
												<p class="font-containt"><%=dbapplydate %></p>
											</div>
										    </div>
										    <div class="col-sm-4">
											<div class="user-idea-details">
												<label>Internship duration</label>
												<p class="font-containt"><%=dbduration %></p>
											</div>
										    </div>
										    <div class="col-sm-4">
											<div class="user-idea-details">
												<label>Number of openings </label>
												<p class="font-containt"><%=dbvacancies %></p>
											</div>
										    </div>
									        </div>
									    <div class="user-idea-details">
										<label>Expected Skill For Applicant</label>
										<p class="font-containt"><%=dbexpectedskill %></p>
									    </div>
									    <div class="user-idea-details">
										<label>Internship Description</label>
										<p class="font-containt"><%=dbdescription %></p>
									    </div>
									    <div class="user-idea-details">
										<label>About Company</label>
										<p class="font-containt"><%=dbcompanydesc %></p>
									    </div>
								        </div>
								        <hr>
								        <div class="fload_right">
								      <%--  <a button class="btn btn-info active" href="ApplyForInternship?dbinternsId=<%=dbinternsid%>">Apply</a></button>--%> 
								        <a button class="btn btn-warning active" href="sig-dashboard.jsp">Back</a></button>
								        </div> <%}%>
			             			</div>
						       </div>
					       </div>
				     </div>
			    </div>
		   </div>
	</body>
</html>
