<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="sigDashboard" ng-controller="sigctrldashboard">
    <head>
	    <title>Institute Project Details</title>
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
<%!Connection con;
	PreparedStatement p,p1,p2,ps,ps1,pst,pst1,pst2,pst3,pst4,pst5,pst6,pst7,pst8;
	ResultSet r,r1,rr,rr1,rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8;
	 long dbinstituteid=0;
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
    	dbinstituteid=rs.getLong(1);
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
													        <td><%=dbinstituteid %></td>
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
													<div class="fload_right"><a button class="btn btn-warning active" href="institute-dashboard.jsp">Back</a></button>
							                      	</div>	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
