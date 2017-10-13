<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myDashboard" ng-controller="dashboard">
 <head>
	    <title>Update Progress </title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/update_progress.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/city-navbar.js"></script>
	    <script src="js/dashboard.js"></script>
    </head>
	<body>
	   	<%!
	long userid=0;
	Connection con=null;
	String query;
    PreparedStatement  ps,ps1,ps2,pst,pst1,pst2,pst3,pst4;
    ResultSet r,r1,r2,rs,rs1,rs2,rs3,rs4;
    %>
	   <%
	   		    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		  	    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		    	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		        response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
	    session=request.getSession();
	    String useremail=(String)session.getAttribute("useremail");
	    try
        {
      if(useremail.equals(null)|| useremail=="")
        {
    	  response.sendRedirect("begin-login.jsp");
	 //RequestDispatcher rd=request.getRequestDispatcher("/begin_login.jsp");
	 // rd.forward(request,response);
	    }
       else
       {}
      }
    catch(Exception e)
       {
    	response.sendRedirect("begin-login.jsp");
  // RequestDispatcher rd=request.getRequestDispatcher("/begin_login.jsp");
  // rd.forward(request,response);
   }
	    con=Dao.getConnection();
	    query="select userId,firstname,middlename,lastname from user where emailid=?";
	    pst=con.prepareStatement(query);
	    pst.setString(1,useremail);
	    rs=pst.executeQuery();
	    String dbfname1="",dbmname1="",dblanme1="";
	    while(rs.next())
	    {
	    userid=rs.getLong(1);
	    dbfname1=rs.getString(2);
	    dbmname1=rs.getString(3);
	    dblanme1=rs.getString(4);
	    
	    
	    }
	   %>
		<div class="containers" >
		<nav class="navbar navbar-fixed-top ">
			       <div class="navbar-conteiner">
				    <div class="navbar-header">
				     <!--  <img src="logo/Logo.jpg"> -->
				    </div>
				    
				    <div class="collapse navbar-collapse" id="myNavbar">
					      <ul class="nav navbar-nav">
						     <img src="logo/STBILOGO.jpg" style="width: 250px;margin-top: 12px;"/>
						  </ul>
					      <ul class="nav navbar-nav navbar-right navbars">
						    <li class="dropdown notification">
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-mobile fa-icons"><br><span class="icon-fonts">Contact</span></i>
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
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle-o fa-icons"><br><span class="icon-fonts"><%=dbfname1%> <%=dblanme1%></span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">
													<table class="table ">
													    <tbody>
													      <tr>
													        <td>Registration Id</td>
													        <td><%=userid %></td>
													      </tr>
													      <tr>
													        <td>Name</td>
													        <td><%=dbfname1%> <%=dbmname1%> <%=dblanme1%></td>
													      </tr>
													      <tr>
													        <td>Email Id</td>
													        <td><%=useremail %></td>
													      </tr>
													      <tr>
													        <td colspan="2" style="text-align:center;"><a href="UserLogout">SignOut</a></td>
													     
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
		
		<div class="containers top" >
			  <ul class="nav nav-tabs navs">
				    <li class="active"><a data-toggle="tab" href="#build-my-pitch" class="tab-font-grorgia">Build My Pitch</a></li>
				    <li><a data-toggle="tab" href="#update-progrss" class="tab-font-grorgia">Update Progress</a></li>
			  </ul>
			  <div class="tab-content">
				   <div id="build-my-pitch" class="tab-pane fade in active">
					    <div class="panel panel-default panels card">
					    	<div class="panel-body">
					    		<div class="user-idea-details">
					    		</div>
					    		<div class="user-idea-details">
					    			<textarea rows="6" cols="" class="form-control"></textarea>
					    		</div><br>
					    		<div class="user-idea-details">
									<button type="submit" class="btn btn-info btn-md active fload_right">Submit</button>
					    		</div>
					    	</div>
					    </div>
				  </div>
				  <%
	             	long ideaid=Long.parseLong(request.getParameter("dbideaid"));
		          %>
				  <div id="update-progrss" class="tab-pane">
				     <form action="./IdeasubmitUpdateProgress" method="post">
						    <div class="panel panel-default panels card">
						    	<div class="panel-body">
						    	     <div class="container">
						    	         <div class="panel panel-default card">
						                	<div class="panel-body">
									    	    <div class="row">
									    	        <div class="col-sm-4">
											    		<input type="text" class="form-control" name="date" ng-model="today | date" readonly="readonly">
											    	</div>
											    	<div class="col-sm-4">
												    	<input type="text" class="form-control" name="mname" placeholder="Milstone Name" required>
											    	</div>
											    	<input type="hidden" name="ideaid" value=<%=ideaid %>> 
											    	 <div class="col-sm-4">
										    			<select class="form-control" name="response" ng-model="response" required>
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
									           		<textarea class="form-control" name="description" required></textarea>
									           </div><br>
									            <div class="fload_right">
									             <a button type="button" href="begin-dashboard.jsp" class="btn btn-default" >Back</a>
									            <button class="btn btn-info btn-md active">Upload</button>
									            </div>
									       </div>
									   </div>
									   
									   <div class="inner-container">
									<%
									String query1="select * from user_ideasubmit_updateprogress where userId=? and ideaid=?";
									pst1=con.prepareStatement(query1);
									pst1.setLong(1,userid);
									pst1.setLong(2,ideaid);
									rs1=pst1.executeQuery();
									long dbideaupdateprogressId=0;
									String dbcurrentdate="",dbmilestone="",dbmilestontype="",dbmilestonedesc="";
									while(rs1.next())
									{
										dbideaupdateprogressId=rs1.getLong("ideaupdateprogressId");
										dbcurrentdate=rs1.getString("currentdate");
										dbmilestone=rs1.getString("milestonename");
										dbmilestontype=rs1.getString("milestonetype");
										dbmilestonedesc=rs1.getString("milestonedescription");%>
										  <div class="panel panel-default card">
							                	<div class="panel-body">
							                		<div class="row">
							                			<div class="col-sm-12">
							                				<label class="name-heading font-heading"><%=dbmilestone %></label>
							                				<label class="name-type"><%=dbmilestontype %></label>
							                				<a button  class="fload_right buttons" href="begin_upgradeprogress_deleterequest.jsp?ideaupdateprogressId=<%=dbideaupdateprogressId%>"><i class="fa fa-trash-o " style="font-size:24px"></i></a>
							                				<br><small class="date"><%=dbcurrentdate %></small>
							                			</div>
							                			<div class="col-sm-12">
							                				<p class="informations"><%=dbmilestonedesc %></p>
							                			</div>
							                		</div>
										       </div>
										   </div>
										   <!----------------------------Deleting---------------------------- -->
										<%--    <form action="./Hello">
										    <div class="modal fade" id="delete" role="dialog">
											    <div class="modal-dialog modal-md">
											      <div class="modal-content">
											        <div class="modal-header">
											          <button type="button" class="close" data-dismiss="modal">&times;</button>
											          <h5 class="modal-title">Say reason for deleting your Update Progress.</h5>
											        </div>
											      
											        <div class="modal-body">
											          <textarea rows="" cols="" class="form-control"></textarea>
											        </div>
											        <div class="modal-footer">
											          <button type="Submit" class="btn btn-warning active"  value="<%=dbideaupdateprogressId %>">Submit</button>
											          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											        </div>
											      
											      </div>
											     
											    </div>
											</div>
										   </form> --%>  
										
									<%} %>
									 
								       </div>
								  </div>
						     </div> 
						  </div>
					  </form>
				 </div>
			</div>
		</div>
	</body>
</html>
