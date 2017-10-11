<%@page import="java.io.OutputStream"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="scaleupDashboard" ng-controller="scaleupctrldashboard">
    <head>
	    <title>Scaleup Dashboard</title>
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
		<div class="containers">
			<div class="top">
				<ul class="nav nav-tabs navs">
				    <li class="active"><a data-toggle="tab" href="#opportinity" class="tab-font-grorgia">POST MY OFFER</a></li>
				    <li><a data-toggle="tab" href="#government" class="tab-font-grorgia">MY GOVERNMENT SUPPORT</a></li>
				    <li><a data-toggle="tab" href="#myprofile" class="tab-font-grorgia">MY BUSINESS PROFILE</a></li>
				</ul>
				<div class="tab-content">
					  <!---------------------------------------------------------MY OPPORTUNITY-------------------------------------------->
					  <div id="opportinity" class="tab-pane fade in active">
				       <div class="panel panel-default card panels">
					      <div class="panel-body">
								<div class="tabbable-line">
									<ul class="nav nav-tabs container-opportunity ">
										<li class="active">
											<a href="#intern" data-toggle="tab" class="tab-sub-font-grorgia">INTERNSHIP OFFER</a>
										</li>
										<li >
											<a href="#project" data-toggle="tab" class="tab-sub-font-grorgia">PROJECT OFFER</a>
										</li>
										<li>
											<a href="#technology" data-toggle="tab" class="tab-sub-font-grorgia">CONSULTANCY OFFER</a>
										</li>
										<li>
											<a href="#mychallenge" data-toggle="tab" class="tab-sub-font-grorgia">MY CHALLENGES (HACKATHONS)</a>
										</li>
									</ul><hr>
									<div class="tab-content">
										<div class="tab-pane active" id="intern">
										   <div>
								    	   		<button  type="button" class="btn btn-info btn-md active" data-toggle="modal" data-target="#submit_new_intern">Submit Internship Offer</button>
								    	   		 <!-- Modal -->
												  <div class="modal fade" id="submit_new_intern" role="dialog">
												    <div class="modal-dialog modal-lg">
												      <!-- Modal content-->
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h4 class="modal-title">Submit Information of Internship </h4>
												        </div>
												        <form name="scaleupForm" action="./MybusinessInternshipDetails" method="post">
														        <div class="modal-body">
																	  <div class="form-group">
																	    <label for="inputsm">Title of Internship</label>
																	    <select class="form-control" name="interntitle" ng-model="about" required>
																    	    <option value="" ng-show="false">Select Primary Profile</option>
																    		<option value="Business Development (Sales)" >Business Development (Sales) </option>
																    		<option value="Web Development">Web Development </option>
																    		<option value="Graphic Design">Graphic Design  </option>
																    		<option value="Content Writing ">Content Writing  </option>
																    		<option value=" Marketing  "> Marketing  </option>
																    		<option value="Operations">Operations  </option>
																    		<option value="Mobile App Development">Mobile App Development </option>
																    		<option value="Digital Marketing">Digital Marketing  </option>
																    		<option value="Human Resources (HR)"> Human Resources (HR) </option>
																    		<option value="Law/ Legal">Law/ Legal  </option>
																    		<option value="Campus Ambassador">Campus Ambassador </option>
																    		<option value="other">Other</option>
																    		<option></option>
																    	</select>
																	  </div>
																	  <div ng-switch="about">
																	  		<div ng-switch-when="other">
																			    <input class="form-control input-md" name="other" type="text">
																	  		</div>
																	   </div>
																	  <div class="row">
																	       <div class="col-sm-4">
																			   <div class="form-group">
																			    <label for="inputdefault">Internship location</label>
																			    <input class="form-control input-md"  type="text" name="location" ng-model="location" required>
																			  </div>
																		   </div>
																		    <div class="col-sm-4">
																			  <div class="form-group">
																			    <label for="inputlg">Select type of Internship</label>
																			    	<select class="form-control" name="typeinter" ng-model="typeinter" required>
																			    	    <option value="" ng-show="false">Select</option>
																			    		<option value="Full Time">Full Time</option>
																			    		<option value="Part Time">Part Time</option>
																			    	</select>
																			  </div>
																		   </div>
																		   <div class="col-sm-4">
																			  <div class="form-group">
																			    <label for="inputlg">Stipend (In Rs.)</label>
																			    <input class="form-control input-md"  type="text" name="stipend" ng-model="stipend" ng-pattern="/^[0-9]{1,6}$/" required>
																			 	<span ng-show="scaleupForm.stipend.$error.pattern" style="color:red">Enter only number.</span>
																			  </div>
																		   </div>
																      </div>
																       <div class="form-group">
																          <label>Internship Duration <small>(Shorter the duration, more the applications)</small></label>
																          <div class="row">
																               <div class="col-sm-8">
																			   		 <select class="form-control" name="interduration" ng-model="interduration" required>
																			    	    <option value="" ng-show="false">Choose Duration</option>
																			    		<option value="1">1</option>
																			    		<option value="2">2</option>
																			    		<option value="3">3</option>
																			    		<option value="4">4</option>
																			    		<option value="5">5</option>
																			    		<option value="6">6</option>
																			    	</select>
																			   </div>
																			    <div class="col-sm-4">
																			   		  <select class="form-control" name="month" ng-model="month" required>
																			    	    <option value="" ng-show="false">Select Months/Weeks</option>
																			    		<option value="Months">Months</option>
																			    		<option value="Weeks">Weeks</option>
																			    	</select>
																			   </div>
																	      </div>
																	   </div>
																	   <div class="form-group">
																	    <label for="inputlg">Number of Opening <br><small>(Enter only numbers)</small></label>
																	    <input class="form-control input-md"  type="text" name="opening" ng-model="opening" ng-pattern="/^[0-9]{1,6}$/" required>
																	    <span ng-show="scaleupForm.opening.$error.pattern" style="color:red">Enter only number.</span>
																	  </div>
																	   <div class="form-group">
																	     <label for="inputlg">Expected Skill for Applicant</label>
																	    <input class="form-control input-md"  type="text" name="proskill" ng-model="proskill" required placeholder="Ex: PHP, JAVA, MS Office">
																	  </div>
																	   <div class="form-group">
																	    <label for="inputlg">Internship Description</label>
																	    <textarea class="form-control" name="interndiscrip" ng-model="interndiscrip" required></textarea>
																	  </div>
																	   <div class="form-group">
																	    <label for="inputlg">Status</label> 
																	     <input class="form-control"  type="text" name="status" value="Pending" readonly>
																	  </div>
																	  <div class="form-group">
																	    <label for="inputlg">Date(MM DD,YYYY)</label>
																	    <input class="form-control input-md"  type="text" name="applydate"  ng-model="today | date" readonly>
																	  </div>
														        </div>
														        <div class="modal-footer">
														          <button type="submit" class="btn btn-info btn-md active"
														          		  ng-disabled="scaleupForm.opening.$error.pattern || scaleupForm.stipend.$error.pattern">Upload</button>
														          <button type="button" class="btn btn-warning btn-md active" data-dismiss="modal">Close</button>
														        </div>
												         </form> 
												      </div>
												    </div>
												  </div>
								    	   </div>
								    	    <hr>
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">LIST OF INTERNSHIP OFFER</th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-dark-gray">STATUS</th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											 <%
											 
											 String que="select upgrademybusiness.mybusinessId,upgrademybusinesssinternship.internsId,upgrademybusinesssinternship.coursetitle,upgrademybusinesssinternship.other,upgrademybusinesssinternship.status,upgrademybusinesssinternship.applydate from upgrademybusiness,upgrademybusinesssinternship where upgrademybusiness.mybusinessId=upgrademybusinesssinternship.mybusinessId and upgrademybusiness.mybusinessId=?";
											 ps=con.prepareStatement(que);
											 ps.setLong(1,upgrademybusinessid);
											 r1=ps.executeQuery();
											 long dbmybusinessIdd=0,dbinternsId=0;
											 String dbcoursetitlee="",dbother="", dbotherdisplay="",dbstatus="",dbapplydate="";
											 while(r1.next())
											 {
												 dbmybusinessIdd=r1.getLong(1);
												 dbinternsId=r1.getLong(2);
												 dbcoursetitlee=r1.getString(3);
												 dbother=r1.getString(4);
												 dbstatus=r1.getString(5);
												 dbapplydate=r1.getString(6);%>
												
													 <tbody>
												     <tr>
												        <td align="center"><b><%=dbinternsId %></b></td>
												        <%
												        if((dbcoursetitlee.equals("other")))
														 {%>
														   <td align="center"><p class="table-idea"><a href="scaleup-view-intership-details.jsp?dbinternsId=<%=dbinternsId %>" target="_blank"><%=dbcoursetitlee %> (<%=dbother %>)</a></p></td>
												       <%}else
												       {%>
												    	   
												    	      <td align="center"><p class="table-idea"><a href="scaleup-view-intership-details.jsp?dbinternsId=<%=dbinternsId %>" target="_blank"><%=dbcoursetitlee %></a></p></td>
												       <%}%>
												      
												        <td align="center"><p class="table-data"><%=dbstatus %></p></td>
												        <td align="center"><p class="table-data"><%=dbapplydate %></p></td>
												        <td align="center"><p class=" fload_right table-data-button">
															<a class="btn btn-xs btn-warning active"  target="_blank">View Response</a><%--href="scaleup-view-internship-response.jsp?dbinternsId=<%=dbinternsId %>" --%>
															<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#intersdelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
														</p></td>
												      </tr>
												    </tbody>	
													  
												<%}
												 %>
												   
																				 
											  
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="intersdelete" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
										<!------------------------------------------------------------------------------------------------------------>
										<div class="tab-pane " id="project">
										   <div>
								    	   		<button  type="button" class="btn btn-info btn-md active" data-toggle="modal" data-target="#submit_new_project">Submit Project Offer</button>
								    	   		 <!-- Modal -->
												  <div class="modal fade" id="submit_new_project" role="dialog">
												    <div class="modal-dialog modal-lg">
												      <!-- Modal content-->
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h4 class="modal-title">Submit Information of Project</h4>
												        </div>
												        <form name="scaleupForm" action="./MybusinessAddProject" method="post">
														        <div class="modal-body">
																       <div class="form-group" >
																		   <div class="form-group">
																		    <label for="inputdefault">Title Of Project</label>
																		    <input class="form-control input-md"  type="text" name="proname" ng-model="proname" required/>
																		  </div>
																	   </div>
																	   <div class="form-group">
																		    <label for="inputlg">Project Description</label>
																		    <textarea class="form-control" name="prodescrip" ng-model="prodescrip" required></textarea>
																	   </div>
																	   <div class="form-group">
																	     <label for="inputlg">Resources Available for Applicant</small></label>
																	     <input class="form-control input-md"  type="text" name="resource" ng-model="resource" required>
																	  	  <small>Hardware/Machinery/Software/Instrument</small>
																	  </div>
																	   <div class="form-group">
																	     <label for="inputlg">Expected Skill For Applicant</small></label>
																	    <input class="form-control input-md"  type="text" name="skills" ng-model="skills" required placeholder="Ex: PHP, JAVA, MS Office">
																	  </div>
																	  <div class="form-group">
																	     <label for="inputlg">Total Allocated Fund for Project</label>
																	     <input class="form-control input-md"  type="text" name="allocate" ng-model="allocate" required>
																	  </div>
																	   <div class="form-group">
																		    <label for="inputlg">Expected Milestone / Achievement for Applicant</label>
																		    <textarea class="form-control" name="milestone" ng-model="milestone" required></textarea>
																	   </div>
																	   <div class="form-group">
																	    <label for="inputlg">Status</label> 
																	     <input class="form-control"  type="text" name="status" value="Pending" readonly>
																	  </div>
																	  <div class="form-group">
																	    <label for="inputlg">Date(MM DD,YYYY)</label>
																	    <input class="form-control input-md"  type="text" name="applydate"  ng-model="today | date" readonly>
																	  </div>
														        </div>
														        <div class="modal-footer">
														          <button type="submit" class="btn btn-info btn-md active"
														          		  ng-disabled="scaleupForm.opening.$error.pattern || scaleupForm.stipend.$error.pattern"
														          >Upload</button>
														          <button type="button" class="btn btn-warning btn-md active" data-dismiss="modal">Close</button>
														        </div>
												         </form> 
												      </div>
												    </div>
												  </div>
								    	   </div>
								    	    <hr>
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">LIST OF PROJECT OFFER</th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-dark-gray">STATUS</th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											    <%
											    String que1="select upgrademybusiness.mybusinessId,upgrademybusinessprojectinfo.projectId,upgrademybusinessprojectinfo.projecttitle,upgrademybusinessprojectinfo.status,upgrademybusinessprojectinfo.applydate from upgrademybusiness,upgrademybusinessprojectinfo where upgrademybusiness.mybusinessId=upgrademybusinessprojectinfo.mybusinessId and upgrademybusiness.mybusinessId=?";
												 ps1=con.prepareStatement(que1);
												 ps1.setLong(1,upgrademybusinessid);
												 r2=ps1.executeQuery();
												 long dbmybusinessidd=0,dbprojectId=0;
												 String dbprojecttitle="",dbstatuss="",dbapplydatee="";
												 while(r2.next())
												 {
													 dbmybusinessidd=r2.getLong(1);
													 dbprojectId=r2.getLong(2);
													 dbprojecttitle=r2.getString(3);
													 dbstatuss=r2.getString(4);
													 dbapplydatee=r2.getString(5);
													 %>
													 <tbody>
											     <tr>
											        <td align="center"><b><%=dbprojectId %></b></td>
											        <td align="center"><p class="table-idea"><a href="scaleup-view-project-details.jsp?dbprojectId=<%=dbprojectId %>" target="_blank"><%=dbprojecttitle %></a></p></td>
											        <td align="center"><p class="table-data"><%=dbapplydatee %></p></td>
											        <td align="center"><p class="table-data"><%=dbstatuss %></p></td>
											        <td align="center"><p class=" fload_right table-data-button">
														<a class="btn btn-xs btn-warning active" href="scaleup-view-project-response.jsp?projectId=<%=dbprojectId %>" target="_blank">View Response</a>
														<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#prodelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
													</p></td>
											      </tr>
											    </tbody>
													 
												 <%}
											    %>
											    
											    
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="prodelete" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
										<!------------------------------------------------------------------------------------------------------------>
										<div class="tab-pane" id="technology">
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">TECHNOLOGY CONSULTANCY OFFER</th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-dark-gray">STATUS</th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											    <tbody>
											     <tr>
											        <td><b>325335</b></td>
											        <td><p class="table-idea"><a href="" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
											        <td><p class="table-data">23/06/2017</p></td>
											        <td><p class="table-data">Pending</p></td>
											        <td><p class=" fload_right table-data-button">
														<a class="btn btn-xs btn-warning active" href="scaleup-view-concultancy-response.jsp" target="_blank">View Response</a>
														<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#technologydelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
													</p></td>
											      </tr>
											    </tbody>
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="technologydelete" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
										<div class="tab-pane " id="mychallenge">
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">HACKATHONS</th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-dark-gray">STATUS</th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											    <tbody>
											     <tr>
											        <td><b>325335</b></td>
											        <td><p class="table-idea"><a href="" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
											        <td><p class="table-data">23/06/2017</p></td>
											        <td><p class="table-data">Pending</p></td>
											        <td><p class=" fload_right table-data-button">
														<a class="btn btn-xs btn-warning active" href="scaleup-view-hackathons-response.jsp" target="_blank">View Response</a>
														<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#businessdelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
													</p></td>
											      </tr>
											    </tbody>
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="businessdelete" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
									</div>
								</div>
					      </div>
					   </div>
					  </div>
					   <!---------------------------------------------------------MY GOVERNEMENT SUPPORT-------------------------------------------->
					  <div id="government" class="tab-pane fade">
				       <div class="panel panel-default card panels">
					      <div class="panel-body">
								<div class="tabbable-line">
									<ul class="nav nav-tabs container-opportunity ">
										<li class="active">
											<a href="#msmescheme" data-toggle="tab" class="tab-sub-font-grorgia">MSME SCHEMES</a>
										</li>
										<li>
											<a href="#dsirscheme" data-toggle="tab" class="tab-sub-font-grorgia">DSIR SCHEMES</a>
										</li>
										<li>
											<a href="#othersceme" data-toggle="tab" class="tab-sub-font-grorgia">OTHER SCHEMES</a>
										</li>
									</ul><hr>
									<div class="tab-content">
										<div class="tab-pane active" id="msmescheme">
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">MSME SCHEMES</li></th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											    <tbody>
											     <tr>
											        <td><b>325335</b></td>
											        <td><p class="table-idea"><a href="" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
											        <td><p class="table-data">23/06/2017</p></td>
											        <td><p class=" fload_right table-data-button">
														<a class="btn btn-xs btn-warning active" href="" target="">View Response</a>
														<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#msmeschemes"><i class="fa fa-trash" style="font-size:18px"></i></button>
													</p></td>
											      </tr>
											    </tbody>
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="msmeschemes" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
										<div class="tab-pane" id="dsirscheme">
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">DSIR SCHEMES</th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											    <tbody>
											     <tr>
											        <td><b>325335</b></td>
											        <td><p class="table-idea"><a href="" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
											        <td><p class="table-data">23/06/2017</p></td>
											        <td><p class=" fload_right table-data-button">
														<a class="btn btn-xs btn-warning active" href="" target="">View Response</a>
														<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#disrscemes"><i class="fa fa-trash" style="font-size:18px"></i></button>
													</p></td>
											      </tr>
											    </tbody>
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="disrscemes" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
										<div class="tab-pane " id="othersceme">
											<table class="table table-list table-hover card">
											    <thead>
											      <tr>
											        <th class="table-fent-gray">ID</th>
											        <th class="table-dark-gray">OTHER SCHEMES</th>
											        <th class="table-fent-gray">DATE </th>
											        <th class="table-fent-gray"></th>
											      </tr>
											    </thead>
											    <tbody>
											     <tr>
											        <td><b>325335</b></td>
											        <td><p class="table-idea"><a href="" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
											        <td><p class="table-data">23/06/2017</p></td>
											        <td><p class=" fload_right table-data-button">
														<a class="btn btn-xs btn-warning active" href="" target="">View Response</a>
														<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#otherscemes"><i class="fa fa-trash" style="font-size:18px"></i></button>
													</p></td>
											      </tr>
											    </tbody>
											 </table><hr>
											 <!-------------------------------Delete----------------------------------->
											   <div class="modal fade" id="otherscemes" role="dialog">
												    <div class="modal-dialog modal-md">
												      <div class="modal-content">
												        <div class="modal-header">
												          <button type="button" class="close" data-dismiss="modal">&times;</button>
												          <h5 class="modal-title">Say reason for deleting your idea ?</h5>
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
									</div>
								</div>
					      </div>
					   </div>
					  </div>
					 <!---------------------------------------------------------MY PROFILE-------------------------------------------->
				    <div id="myprofile" class="tab-pane fade">
				       <div class="panel panel-default card panels">
					      <div class="panel-body">
					    	<div class="row">
					    	   <div class="col-sm-12">
							          <div class="col-sm-3 bhoechie-tab-menu ">
							              <div class="list-group card">
								                <a data-toggle="tab" href="#personal-details" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>COMPANY DETAILS
								                </a>
								                 <a data-toggle="tab" href="#company-product" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>COMPANY PRODUCTS
								                </a>
								                <a data-toggle="tab" href="#design-course" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>OFFER SKILL DEVELOPMENT PROGRAM
								                </a>
							              </div><br>
							         </div>
							         <div class="col-sm-9 profile-all-details">
								     	   <div class="tab-content">
											    <div id="personal-details" class="tab-pane fade in active">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			 <div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#personals"><b>Add Company Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="personals" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="infoForm" action="./UpdateBasicInfo" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Add Owner New Mobile No:</label>
																			    <input class="form-control input-md" id="inputsm" type="text" name="mobilenumber" ng-model="mobilenumber" ng-pattern="/^(\+\91{1,2}[- ])\d{10}$/" required/>
																			    <small>Format :+91 9855514371</small><br>
																			     <span style="color:red" ng-show="infoForm.mobilenumber.$dirty && infoForm.mobilenumber.$invalid">
														   					     <span ng-show="infoForm.mobilenumber.$error.required">Please specify your Mobile Number</span></span>
														                         <span ng-show="infoForm.mobilenumber.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed <br> Please enter valid format(+91 9855514371)</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add Owner New Email Id:</label>
																			      <input class="form-control" id="focusedInput" type="text" value="" name="email" ng-model="email" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i" required/>
																				  <span style="color:red" ng-show="infoForm.email.$dirty && infoForm.email.$invalid">
																			      <span ng-show="infoForm.email.$error.required">Please specify your Email ID</span></span>
																				  <span ng-show="infoForm.email.$error.pattern" style="color:red">Please enter correct email address.</span>
														 
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add Company New Address:</label>
																			    <textarea rows="" cols="" class="form-control" name="address" ng-model="address" required/></textarea>
																			  </div>
																			   <div class="form-group">
																			    <label for="inputsm">Add Company Description:</label>
																			    <textarea rows="" cols="" class="form-control" name="companydescription" ng-model="companydescription" required/></textarea>
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		        ng-disabled="infoForm.email.$dirty && infoForm.email.$invalid && infoForm.email.$error.pattern || 
																			  		                     infoForm.mobilenumber.$dirty && infoForm.mobilenumber.$invalid && infoForm.mobilenumber.$error.pattern"
																			  		>Save</button>
																			  </div>
																		</form> 
																	  </div>
																    </div>
																  </div>
															 </div> <hr>
															 <!-- ------------------------------------------------------------------- -->
															
															  <div class="list-group font">
															    <form class="form-horizontal">
															        <div class="form-group">
																      <div class="col-sm-11">
																        <label class="control-label col-sm-6">Company Details</label>
																      </div>
																    </div><hr>
														     <%
															 String query1="select * from upgrademybusiness where mybusinessId=?";
															 pst1=con.prepareStatement(query1);
															 pst1.setLong(1,upgrademybusinessid);
															 rs1=pst1.executeQuery();
															 int dbnoofdept=0,dbpincode=0;
															 long  dbmybusinessId=0,dbnoofemployee=0,dbannualturnover=0;
															 String dbindustryname="",dbownerr="",mobilenumber="",dbemailid="",dbestablishyear="",dbcompanyofficeaddress="",dbcompanydescription="",dbcompanyemailid="", dbofficecontactnumber="",dbcity="",dbregiverification="",dbregistrationstatus="";
															 
															 while(rs1.next())
															 {
																 dbmybusinessId=rs1.getLong("mybusinessId");
																 dbindustryname=rs1.getString("industryname");
																 dbownerr=rs1.getString("owner");
																 mobilenumber=rs1.getString("mobilenumber");
																 dbemailid=rs1.getString("emailid");
																 dbestablishyear=rs1.getString("establishyear");
																 dbnoofdept=rs1.getInt("noofdept");
																 dbnoofemployee=rs1.getLong("noofemployee");
																 dbannualturnover=rs1.getLong("annualturnover");
																 dbcompanyofficeaddress=rs1.getString("companyofficeaddress");
																 dbcompanydescription=rs1.getString("companydescription");
																 dbcompanyemailid=rs1.getString("companyemailid");
																 dbofficecontactnumber=rs1.getString("officecontactnumber");
																 dbcity=rs1.getString("city");
																 dbpincode=rs1.getInt("pincode");
																 dbregiverification=rs1.getString("regiverification");
																 dbregistrationstatus=rs1.getString("registrationstatus");
																 %>
																 	  <div class="form-group">
																      <p class="control-label col-sm-3">Name of Industry:</p>
																      <div class="col-sm-8">
																      <p class="font-color"><%=dbindustryname %></p>
																      </div>
																      </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Name of Owner:</p>
																      <div class="col-sm-8">
																      <p class="font-color"><%=dbownerr %></p>
																      </div>
																    </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Mobile No:</p>
																      <div class="col-sm-8"> 
																      <p class="font-color"><%=mobilenumber %></p>
																      </div>
																    </div>
																       <div class="form-group">
																       <p class="control-label col-sm-3">Email Id:</p>
																       <div class="col-sm-8">
																       <p class="font-color"><%=dbemailid %></p>
																    </div>
																    </div>
																       <div class="form-group">
																       <p class="control-label col-sm-3">Year of Establish :</p>
																       <div class="col-sm-8"> 
																       <p class="font-color"><%=dbestablishyear %></p>
																      </div>
																    </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">No. of Department:</p>
																      <div class="col-sm-8"> 
																      <p class="font-color"><%=dbnoofdept %></p>
																      </div>
																    </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">No. of Employee:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbnoofemployee %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Annual Turnover:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbannualturnover %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Company Office Address:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbcompanyofficeaddress %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Company Office EmailId:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbcompanyemailid %></p>
																      </div>
																    </div>
																    
																      <div class="form-group">
																      <p class="control-label col-sm-3">Company Contact Number:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbofficecontactnumber %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">City:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbcity %></p>
																      </div>
																    </div>
																   <div class="form-group">
																      <p class="control-label col-sm-3">Pincode:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbpincode %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Verification:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbregiverification %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Registration Status:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbregistrationstatus %></p>
																      </div>
																    </div>
																    
																      <div class="form-group">
																      <p class="control-label col-sm-3">Company Description</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbcompanydescription %></p>
																      </div>
																    </div>
																  	<%}%>
															
																  </form>
															  </div><hr>
											      		</div>
											      	</div>
											    </div>
											    <div id="company-product" class="tab-pane fade">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			 <div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#company-products"><b>Add Company Products</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="company-products" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form action="./MybusinessProductInfo" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Add Product Name:</label>
																			    <input class="form-control input-md" id="inputsm" type="text" name="productname" ng-model="comname" required>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add Product Image:</label>
																			    <input type="file" name="picture" ng-model="picture" required/>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add Product Description</label>
																			    <textarea rows="" cols="" class="form-control" name="descriptions" ng-model="descriptions" required></textarea>
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active">Upload</button>
																			  </div>
																		</form> 
																	  </div>
																    </div>
																  </div>
															 </div> <hr>
															 <!-- ------------------------------------------------------------------- -->
																  <div class="list-group font">
															    <form class="form-horizontal">
															        <div class="form-group">
																      <div class="col-sm-11">
																        <label class="control-label col-sm-6">Company Products</label>
																      </div>
																    </div><hr>
																    <%
																  //  byte[] imgData  ;
																    String query4="select upgrademybusiness.mybusinessId,upgrademybusinessproductinfo.productId,upgrademybusinessproductinfo.productname,upgrademybusinessproductinfo.image,upgrademybusinessproductinfo.productdescription from upgrademybusiness,upgrademybusinessproductinfo where upgrademybusiness.mybusinessId=upgrademybusinessproductinfo.mybusinessId and upgrademybusiness.mybusinessId=?";
																    pst4=con.prepareStatement(query4);
																    pst4.setLong(1,upgrademybusinessid);
																    rs4=pst4.executeQuery();
																    long dbmybusinessid=0,dbproductid=0;
																    String dbproductname="",dbproductdescription="";
																   /// Blob dbimage=null;
																    while(rs4.next())
																    {
																    	
																    	dbmybusinessid=rs4.getLong(1);
																    	dbproductid=rs4.getLong(2);
																    	dbproductname=rs4.getString(3);
																    	//dbimage=rs4.getBlob(4);
																    	//System.out.println("print image..."+dbimage);
																    	//imgData=dbimage.getBytes(4,65535);
																    	dbproductdescription=rs4.getString(5);
																    
																    %>
																     <a class="fload_right" data-toggle="modal" href="scaleup-pro-edit-product.jsp?productid=<%=dbproductid%>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Name of Product:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbproductname %></p>
																      </div>
																      </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Image of Product:</p>
																      <div class="col-sm-8">
																       <p class="font-color"></p>
																      </div>
																      </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Product Description:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbproductdescription %></p>
																      </div>
																    </div>	<hr>
																    <%}
																    %>
																  </form>
															  </div><hr>
														</div>
											      	</div>
											    </div>
											     <!-- ------------------------------------------------------------------- -->
											    <div id="design-course" class="tab-pane fade">
												     <div class="panel panel-default card">
												      		<div class="panel-body">
												      			 <div class="panel-group">
																	  <div class="panel panel-default">
																	    <div class="panel-heading">
																	      <h4 class="panel-title">
																	        <a data-toggle="collapse" href="#course-designs"><b>Add Course Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																	      </h4>
																	    </div>
																	    <div id="course-designs" class="panel-collapse collapse font">
																	      <div class="panel-body font">
																			<form class="courseForm" action="./MybusinessSkillDevelopment" method="post">
																				  <div class="form-group">
																				    <label for="inputsm">Course Title:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="coursname" ng-model="coursname" required/>
																				    
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course Description</label>
																				    <textarea rows="" cols="" class="form-control" name="descriptionss" ng-model="descriptionss" required></textarea>
																				 </div>
																				 <div class="form-group">
																				    <label for="inputsm">Select Level:</label>
																				    <select name="myVar" ng-model="myVar" class="form-control" required/>
																				    	<option  value="Beginner">Beginner</option>
																				    	<option  value="Core">Core</option>
																				    	<option  value="Advanced">Advanced </option>
																				    	<option  value="Expert">Expert</option>
																				    </select>
																			     </div>
																     			 <div class="form-group">
																				    <label for="inputsm">Course Prerequisite:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="courseprere" ng-model="courseprere" required/>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course Duration:</label>
																				    <div class="row">
																				         <div class="col-sm-8">
																						    <select class="form-control" name="duration" ng-model="duration" required/>
																						       <option></option>
																						        <option value="1">1</option>
																						        <option value="2">2</option>
																						        <option value="3">3</option>
																						        <option value="4">4</option>
																						        <option value="5">5</option>
																						        <option value="6">6</option>
																						    </select>
																						 </div>
																						 <div class="col-sm-4">
																						    <select class="form-control" name="month" ng-model="month" required/>
																						        <option value="Months">Months</option>
																						        <option value="Weeks">Weeks</option>
																						    </select>
																						 </div>
																					 </div>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course Credit:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="credit" ng-model="credit" required/>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course Objective:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="objective" ng-model="objective" required/>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course Outcome:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="outcome" ng-model="outcome" required/>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course Modules:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="module" ng-model="module" required/>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Course lab work / Equipments / Tools :</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="tools" ng-model="tools" required/>
																				  </div>
																				  <div class="form-group">
																				    <label for="inputsm">Reference:</label>
																				    <input class="form-control input-md" id="inputsm" type="text" name="reference" ng-model="reference" required/>
																				  </div>
																				  <div class="form-group fload-right">
																				  		<button type="submit" class="btn btn-info active">Upload</button>
																				  </div>
																			</form> 
																		  </div>
																	    </div>
																	  </div>
																 </div> <hr>
																 <!-- ------------------------------------------------------------------- -->
																 
																 	<div class="list-group font">
																    <form class="form-horizontal">
																        <div class="form-group">
																	      <div class="col-sm-11">
																	        <label class="control-label col-sm-6">Course Details</label>
																	      </div>
																	    </div><hr>
																	     <%
																	    String query5="select upgrademybusiness.mybusinessId,upgrademybusinessskilldevelopment.skilldevelopmentId,upgrademybusinessskilldevelopment.coursetitle,upgrademybusinessskilldevelopment.coursedescription,upgrademybusinessskilldevelopment.level,upgrademybusinessskilldevelopment.courseprerequisite,upgrademybusinessskilldevelopment.courseduration,upgrademybusinessskilldevelopment.coursedurationinmonthorweek,upgrademybusinessskilldevelopment.coursecredit,upgrademybusinessskilldevelopment.courseobjective,upgrademybusinessskilldevelopment.courseoutcomes,upgrademybusinessskilldevelopment.coursemodule,upgrademybusinessskilldevelopment.courselab,upgrademybusinessskilldevelopment.reference from upgrademybusiness,upgrademybusinessskilldevelopment where upgrademybusiness.mybusinessId=upgrademybusinessskilldevelopment.mybusinessId and upgrademybusiness.mybusinessId=?";
																	    pst5=con.prepareStatement(query5);
																	    pst5.setLong(1,upgrademybusinessid);
																	    rs5=pst5.executeQuery();
																	    long mybusinessid=0,dbskilldevelopmentidd=0;
																	    String dbcoursetitle="",dbcoursedescription="",dblevel="",dbcourseprerequisite="",dbcourseduration="",dbcoursedurationinmonthorweek="",dbcoursecredit="",dbcourseobjective="",dbcourseoutcomes="",dbcoursemodule="",dbcourselab="",dbreference="";																	   
																	    
																	   while(rs5.next())
																	   {
																		   mybusinessid=rs5.getLong(1);  
																		   dbskilldevelopmentidd=rs5.getLong(2);
																		   dbcoursetitle=rs5.getString(3);
																		   dbcoursedescription=rs5.getString(4);
																		   dblevel=rs5.getString(5);
																		   dbcourseprerequisite=rs5.getString(6);
																		   dbcourseduration=rs5.getString(7);
																		   dbcoursedurationinmonthorweek=rs5.getString(8);
																		   dbcoursecredit=rs5.getString(9);
																		   dbcourseobjective=rs5.getString(10);
																		   dbcourseoutcomes=rs5.getString(11);
																		   dbcoursemodule=rs5.getString(12);
																		   dbcourselab=rs5.getString(13);
																		   dbreference=rs5.getString(14);
																	   %>
																	    <a class="fload_right" href="" ><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
  																          <div class="form-group">
																	      <p class="control-label col-sm-3">Name of Course:</p>
																	      <div class="col-sm-8">
																	        <p class="font-color"><%=dbcoursetitle %></p>
																	      </div>
																	    </div>
																	    <div class="form-group">
																	      <p class="control-label col-sm-3">Description of Course:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcoursedescription %></p>
																	      </div>
																	    </div>
																	    <div class="form-group">
																	      <p class="control-label col-sm-3">Course Level:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dblevel %></p>
																	      </div>
																	    </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Prerequisite:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcourseprerequisite %></p>
																	      </div>
																	  </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Duration:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcourseduration %> <%=dbcoursedurationinmonthorweek %></p>
																	      </div>
																	  </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Credit:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcoursecredit %></p>
																	      </div>
																	  </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Objectives:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"> <div class="form-group">
																	      <p class="control-label col-sm-3">Description of Course:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcourseobjective %></p>
																	      </div>
																	    </div></p>
																	      </div>
																	  </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Outcome:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"> <div class="form-group">
																	      <p class="control-label col-sm-3">Description of Course:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcourseoutcomes %></p>
																	      </div>
																	    </div></p>
																	      </div>
																	  </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Modules:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"> <div class="form-group">
																	      <p class="control-label col-sm-3">Description of Course:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcoursedescription %></p>
																	      </div>
																	    </div></p>
																	      </div>
																	  </div>
																	  <div class="form-group">
																	      <p class="control-label col-sm-3">Course Lab work / Equipments / Tools:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"> <div class="form-group">
																	      <p class="control-label col-sm-3">Description of Course:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbcourselab %></p>
																	      </div>
																	    </div></p>
																	      </div>
																	  </div>
																	   <div class="form-group">
																	      <p class="control-label col-sm-3">Reference Book / Link:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"> <div class="form-group">
																	      <p class="control-label col-sm-3">Description of Course:</p>
																	      <div class="col-sm-8">
																	         <p class="font-color"><%=dbreference %></p>
																	      </div>
																	    </div></p>
																	      </div>
																	  </div><hr>	
																	   <%}
																	     %>
																
																  </form>
												      		</div>
																
																 <!-- ------------------------------------------------------------------------ -->
																  
												      	</div>
												    </div>
											    </div>
										    </div>
								        </div>
							        </div>
					            </div>
					        </div>
					    </div>
					 </div>
				 </div>
			 </div>
		</div>
	</body>
</html>
