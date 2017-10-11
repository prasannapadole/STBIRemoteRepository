<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="sigDashboard" ng-controller="sigctrldashboard">
 <head>
	    <title>Incubation Project Update Progress </title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/update_progress.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/city-navbar.js"></script>
	    <script src="js/sig-dashboard.js"></script>
    </head>
	<body>
	<%!Connection con;
	   PreparedStatement p,p1,ps,ps1,pst,pst1,pst2,pst3,pst4,pst5,pst6,pst7,pst8;
       ResultSet r,r1,rr,rr1,rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8;
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
		<div class="containers top">
			 <form name="milestoneForm" action="./Incubation_Project_upgradeProcess" method="post">
				    <div class="panel panel-default panels card">
				       <h3 class="text-center">Update Progress</h3>
				    	<div class="panel-body">
				    	     <div class="container">
				    	         <div class="panel panel-default card">
				                	<div class="panel-body">
							    	    <div class="row">
							    	        <div class="col-sm-4">
									    		<input type="text" class="form-control" name="date" ng-model="today | date" readonly>
									    	</div>
									    	<div class="col-sm-4">
										    	<input type="text" class="form-control" placeholder="Milstone Name" name="mname" ng-model="mname" required> 
									    	</div>
									    	 <div class="col-sm-4">
								    			<select class="form-control" name="response" ng-model="response" required/>
								    			    <option value="" ng-show="false">Milestone Type</option>
								    				<option value="Product Release">Product Release</option>
								    				<option value="Funding">Funding</option>
								    				<option value="Media Coverage">Media Coverage</option>
								    				<option value="Business Performance">Business Performance</option>
								    				<option value="Strategy Update">Strategy Update</option>
								    				<option value="Angel Help Needed">Angel Help Needed</option>
								    			</select>
									    	</div>
							           </div><br>
							           <div>
							           		<textarea class="form-control" name="description" ng-model="description" required></textarea>
							           </div><br>
							            <div class="fload_right">
							                <a button class="btn btn-info btn-md active" href="incubation-dashboard.jsp">Back</a>
							           		<button class="btn btn-info btn-md active">Upload</button>
							            </div>
							       </div>
							   </div>
							  <%
							   String query1="select * from incubation_project_upgrade_process where incubationId=?";
							   pst1=con.prepareStatement(query1);
							   pst1.setLong(1,dbincubutionid);
							   rs1=pst1.executeQuery();
							   long dbincubationprojectupgradeId=0;
							   String dbcurrentdate="",dbmilestonename="",dbmilestonetype="",dbmilestonedescription="";
							   while(rs1.next())
							   {
								   dbincubationprojectupgradeId=rs1.getLong("incubationprojectupgradeId");
								   dbcurrentdate=rs1.getString("currentdate");
								   dbmilestonename=rs1.getString("milestonename");
								   dbmilestonetype=rs1.getString("milestonetype");
								   dbmilestonedescription=rs1.getString("milestonedescription");
								   %>
								   			   <div class="inner-container">
								   <div class="panel panel-default card">
					                	<div class="panel-body">
					                		<div class="row">
					                			<div class="col-sm-12">
					                				<label class="name-heading font-heading"><%=dbmilestonename %></label>
					                				<label class="name-type"><%=dbmilestonetype %></label>
					                				<button data-toggle="modal" data-target="#delete" class="fload_right buttons"><i class="fa fa-trash-o " style="font-size:24px"></i></button>
					                				<br><small class="date"><%=dbcurrentdate %></small>
					                			</div>
					                			<div class="col-sm-12">
					                				<p class="informations"><%=dbmilestonedescription %></p>
					                			</div>
					                		</div>
								       </div>
								   </div>
								   <!----------------------------Deleting---------------------------- -->
								    <div class="modal fade" id="delete" role="dialog">
									    <div class="modal-dialog modal-md">
									      <div class="modal-content">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h5 class="modal-title">Say reason for deleting your idea.</h5>
									        </div>
									        <div class="modal-body">
									          <textarea rows="" cols="" class="form-control"></textarea>
									        </div>
									        <div class="modal-footer">
									          <button type="Submit" class="btn btn-warning active" data-dismiss="modal">Submit</button>
									          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									        </div>
									      </div>
									    </div>
									</div>
						       </div>
							   <%}
							   
							   
							   
							   %>
						  </div>
				     </div> 
				  </div>
			  </form>
		</div>
	</body>
</html>
