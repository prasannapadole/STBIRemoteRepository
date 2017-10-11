<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html ng-app="sigDashboard" ng-controller="sigctrldashboard">
    <head>
	    <title>Incubation Dashboard</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
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
		<div class="containers" >
			<div class="top">
				<ul class="nav nav-tabs navs">
				    <li class="active"><a data-toggle="tab" href="#myidea" class="tab-font-grorgia">IDEA FROM INCUBATION</a></li>
				    <li><a data-toggle="tab" href="#opportinity" class="tab-font-grorgia">MY OPPORTUNITY</a></li>
				    <li><a data-toggle="tab" href="#myprofile" class="tab-font-grorgia">INCUBATION PROFILE</a></li>
				</ul>
				<div class="tab-content">
				    <!---------------------------------------------------------iNCUBATION IDEA-------------------------------------------->
				    <div id="myidea" class="tab-pane fade in active">
					    <div class="panel panel-default card panels">
					    	<div class="panel-body">
					    	    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Filter</button>
								<div id="demo" class="collapse center ">
								   <form>
								      <input type="search" name="googlesearch" placeholder="Department" class="search"> 
								      <input type="search" name="googlesearch" placeholder="Keyword" class="search"> 
								      <input type="search" name="googlesearch" placeholder="State" class="search">
								      <input type="search" name="googlesearch" placeholder="City" class="search"> 
								      <button class="btn btn-info btn-lg active "> <span class="glyphicon glyphicon-search "></span></button>
								    </form>
								</div>
					    	    <hr>
								<table class="table table-list table-hover card">
								    <thead>
								      <tr>
								        <th class="table-fent-gray">ID</th>
								        <th class="table-dark-gray">TITLE OF IDEA</th>
								        <th class="table-fent-gray">DATE </th>
								        <th class="table-dark-gray">STATUS</th>
								        <th class="table-fent-gray"></th>
								      </tr>
								    </thead>
								   <%
								   String ideastatus="Approved";
								    String que1="select incubationcentername from incubationregi where incubationId=?";
								    p1=con.prepareStatement(que1);
								    p1.setLong(1,dbincubutionid);
								    rr1=p1.executeQuery();
								    String dbincubationcenternamee="";
								    while(rr1.next())
								    {
								    	dbincubationcenternamee=rr1.getString(1);	
								    	String que="select ideaid,titlename,idearegidate,statusofidea,incubationname from ideasubmit where incubationname=? and statusofidea=? ";
									    p=con.prepareStatement(que);
									    p.setString(1,dbincubationcenternamee);
									    p.setString(2,ideastatus);
									    rr=p.executeQuery();
									   long dbideaid=0;
									   String dbtitlename="",idearegidate="",statusofidea="";
									    String dbincubationname="";
									    while(rr.next())
									    {
									    	
									    	dbideaid=rr.getLong(1);
									    	dbtitlename=rr.getString(2);
									    	idearegidate=rr.getString(3);
									    	statusofidea=rr.getString(4);
									    	dbincubationname=rr.getString(5);	
									    	 if(dbincubationcenternamee.equals(dbincubationname))
									    	 {
									    		%> 
									    	 <tbody>
													      <tr>
													        <td  align="center"><b><%=dbideaid %></b></td>
													        <td  align="center"><p class="table-idea"><a href="incubation-view-all-details.jsp?dbideaid=<%=dbideaid %>" target="_blank"><%=dbtitlename %></a></p></td>
													        <td  align="center"><p class="table-data"><%=idearegidate %></p></td>
													        <td  align="center"><p class="table-data"><%=statusofidea %></p></td>
													        <td  align="center"><p class=" fload_right table-data-button">
																<a class="btn btn-xs btn-info active" href="incubation-userview-display.jsp?dbideaid=<%=dbideaid %>" target="_blank">My Support</a>
																<%-- <button type="button" class="btn btn-xs btn-warning active"  data-toggle="modal" data-target="#delete"><i class="fa fa-trash" style="font-size:18px"></i></button>--%>
															</p></td>
													      </tr>	 
									    		 
									    	<% }}}%>
									      </table><hr>
								  
								   <!-------------------------------Delete----------------------------------->
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
					    </div>
					 </div>
					  <!---------------------------------------------------------MY OPPORTUNITY-------------------------------------------->
					  <div id="opportinity" class="tab-pane fade">
				       <div class="panel panel-default card panels">
					      <div class="panel-body">
					      	   <div class="row">
									<div class="col-md-12">
											<div class="tabbable-line">
												<ul class="nav nav-tabs container-opportunity">
												
													<li>
														<a href="#project" data-toggle="tab" class="tab-sub-font-grorgia">PROJECTS</a>
													</li>
														<li class="active">
														<a href="#consultancy" data-toggle="tab" class="tab-sub-font-grorgia">CONSULTANCY</a>
													</li>
													<li>
														<a href="#grand-funding" data-toggle="tab" class="tab-sub-font-grorgia">GRANTS AND FUNDING</a>
													</li>
													<li>
														<a href="#halcathons" data-toggle="tab" class="tab-sub-font-grorgia">HACKATHONS </a>
													</li>
												</ul><hr>
												<div class="tab-content">
													<div class="tab-pane active" id="consultancy">
													    <button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#proj">Filter</button>
														<div id="proj" class="collapse center ">
														   <form>
														      <input type="search" name="googlesearch" placeholder="Department" class="search"> 
														      <input type="search" name="googlesearch" placeholder="Keyword" class="search"> 
														      <input type="search" name="googlesearch" placeholder="State" class="search">
														      <input type="search" name="googlesearch" placeholder="City" class="search"> 
														      <button class="btn btn-info btn-lg active "> <span class="glyphicon glyphicon-search "></span></button>
														    </form>
														</div>
											    	    <hr>
														<table class="table table-list table-hover card">
														    <thead>
														      <tr>
														        <th class="table-fent-gray">ID</th>
														        <th class="table-dark-gray">CONSULTANCY NAME</th>
														        <th class="table-fent-gray">DATE </th>
														        <th class="table-dark-gray">STATUS</th>
														        <th class="table-fent-gray"></th>
														      </tr>
														    </thead>
														    
								 								<tbody>
														    	 <tr>
														        <td><b>111234</b></td>
														        <td><p class="table-idea"><a href="sig-internship-details.jsp" target="_blank">STBI</a></p></td>
														        <td><p class="table-data">04/12/2017</p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active"  target="">view</a>
																	<a class="btn btn-xs btn-warning active" href="incubation-cunsultancy-upgrade-progress.jsp"  target="_blank">Update Progress</a>
																	<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#interndelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
																</p></td>
														      	</tr>
														    	</tbody>			
														 </table><hr>
														 <!-------------------------------Delete----------------------------------->
														   <div class="modal fade" id="projectdelete" role="dialog">
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
													<div class="tab-pane" id="project">
													    <button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#proj">Filter</button>
														<div id="proj" class="collapse center ">
														   <form>
														      <input type="search" name="googlesearch" placeholder="Department" class="search"> 
														      <input type="search" name="googlesearch" placeholder="Keyword" class="search"> 
														      <input type="search" name="googlesearch" placeholder="State" class="search">
														      <input type="search" name="googlesearch" placeholder="City" class="search"> 
														      <button class="btn btn-info btn-lg active "> <span class="glyphicon glyphicon-search "></span></button>
														    </form>
														</div>
											    	    <hr>
														<table class="table table-list table-hover card">
														    <thead>
														      <tr>
														        <th class="table-fent-gray">ID</th>
														        <th class="table-dark-gray">LIST OF PROJECTS</th>
														        <th class="table-fent-gray">DATE </th>
														        <th class="table-dark-gray">STATUS</th>
														        <th class="table-fent-gray"></th>
														      </tr>
														    </thead>
														    <tbody>
														     <%
														    String projectStatus="Approved";
															int incubationdisplayproject=0;
														    String quer1="select projectId,projecttitle,status,applydate from upgrademybusinessprojectinfo where status=? and incubationdisplay=?";
														    ps1=con.prepareStatement(quer1);
														    ps1.setString(1,projectStatus);
														    ps1.setInt(2,incubationdisplayproject);
														    r1=ps1.executeQuery();
														    long dbprojectid=0;
														    String dbprojecttitle="",dbstatuss="",dbapplydatee="";
														    while(r1.next())
														    {
														    	dbprojectid=r1.getLong(1);
														    	dbprojecttitle=r1.getString(2);
														    	dbstatuss=r1.getString(3);
														    	dbapplydatee=r1.getString(4);
														    %>
														    
														    <tbody>
														     <tr>
														        <td align="center"><b><%=dbprojectid %></b></td>
														        <td align="center"><p class="table-idea"><a href="incubation-project-details.jsp?dbprojectId=<%=dbprojectid %>" target="_blank"><%=dbprojecttitle %></a></p></td>
														        <td align="center"><p class="table-data"><%=dbstatuss %></p></td>
														        <td align="center"><p class="table-data"><%=dbapplydatee %></p></td>
														        <td align="center"><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="incubation-project-details.jsp?dbprojectId=<%=dbprojectid %>" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="incubation-project-upgrade-progress.jsp" target="_blank">Update Progress</a>
																	<a button type="button" class="btn btn-xs btn-info active" href="incubation-deleteprojectrequest.jsp?projectid=<%=dbprojectid %>"><i class="fa fa-trash" style="font-size:18px"></i></a>
																</p></td>
														      </tr>
														    </tbody>
														      <%} %>
														    
														 </table><hr>
														 <!-------------------------------Delete----------------------------------->
														   <div class="modal fade" id="projectdelete" role="dialog">
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
													<div class="tab-pane" id="grand-funding">
													    <button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#grands">Filter</button>
														<div id="grands" class="collapse center ">
														   <form>
														      <input type="search" name="googlesearch" placeholder="Department" class="search"> 
														      <input type="search" name="googlesearch" placeholder="Keyword" class="search"> 
														      <input type="search" name="googlesearch" placeholder="State" class="search">
														      <input type="search" name="googlesearch" placeholder="City" class="search"> 
														      <button class="btn btn-info btn-lg active "> <span class="glyphicon glyphicon-search "></span></button>
														    </form>
														</div>
											    	    <hr>
									                    <table class="table table-list table-hover card">
														    <thead>
														      <tr>
														        <th class="table-fent-gray">ID</th>
														        <th class="table-dark-gray">LIST OF GRAND AND FUNDING</th>
														        <th class="table-fent-gray">DATE </th>
														        <th class="table-dark-gray">STATUS</th>
														        <th class="table-fent-gray"></th>
														      </tr>
														    </thead>
														    <tbody>
														     <tr>
														        <td><b>325335</b></td>
														        <td><p class="table-idea"><a href="incubation-grant-funding-details.jsp" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
														        <td><p class="table-data">23/06/2017</p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="incubation-grand-funding-upgrate-progress.jsp" target="_blank">Update Progress</a>
																	<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#granddelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
																</p></td>
														      </tr>
														    </tbody>
														 </table><hr>
														  <!-------------------------------Delete----------------------------------->
														   <div class="modal fade" id="granddelete" role="dialog">
															    <div class="modal-dialog modal-md">
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h5 class="modal-title">Say reason for deleting your Grand and Funding ?</h5>
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
													<div class="tab-pane" id="halcathons">
														<button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#hackas">Filter</button>
														<div id="hackas" class="collapse center ">
														   <form>
														      <input type="search" name="googlesearch" placeholder="Department" class="search"> 
														      <input type="search" name="googlesearch" placeholder="Keyword" class="search"> 
														      <input type="search" name="googlesearch" placeholder="State" class="search">
														      <input type="search" name="googlesearch" placeholder="City" class="search"> 
														      <button class="btn btn-info btn-lg active "> <span class="glyphicon glyphicon-search "></span></button>
														    </form>
														</div>
											    	    <hr>
														<table class="table table-list table-hover card">
														    <thead>
														      <tr>
														        <th class="table-fent-gray">ID</th>
														        <th class="table-dark-gray">LIST OF HALCATHONS</th>
														        <th class="table-fent-gray">DATE </th>
														        <th class="table-dark-gray">STATUS</th>
														        <th class="table-fent-gray"></th>
														      </tr>
														    </thead>
														    <tbody>
														     <tr>
														        <td><b>325335</b></td>
														        <td><p class="table-idea">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</p></td>
														        <td><p class="table-data">23/06/2017</p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="incubation-hackathons-upgrate-progress.jsp" target="_blank">Update Progress</a>
																	<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#hackathonsdelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
																</p></td>
														      </tr>
														    </tbody>
														 </table><hr>
														 <!-------------------------------Delete----------------------------------->
														   <div class="modal fade" id="hackathonsdelete" role="dialog">
															    <div class="modal-dialog modal-md">
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h5 class="modal-title">Say reason for deleting your Hackathon ?</h5>
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
					   </div>
					  </div>
					 <!---------------------------------------------------------MY SIG PROFILE-------------------------------------------->
				    <div id="myprofile" class="tab-pane fade">
				       <div class="panel panel-default card panels">
					      <div class="panel-body">
					    	<div class="row">
					    	   <div class="col-sm-12">
							          <div class="col-sm-3 bhoechie-tab-menu ">
							              <div class="list-group card">
							                   <a data-toggle="tab" href="#basic-profile" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>BASIC PROFILE
								                </a>
								                <a data-toggle="tab" href="#personal-details" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>ADD INCUBATEE DETAILS
								                </a>
								                <a data-toggle="tab" href="#techmology" class="list-group-item tab-font-verti-grorgia">
								                     <i class="fa fa-user-circle-o fa-profile-size"></i><br/>INCUBATION<br><small>MILESTONES/ ACHIEMENTS/ SUCCESS STORIES</small>
								                </a>
							              </div><br>
							         </div>
							         <%
							         
							          String query1="select * from incubationregi where incubationId=?";
								      pst1=con.prepareStatement(query1);
									  pst1.setLong(1,dbincubutionid);					        		 
							         rs1=pst1.executeQuery();
							         long dbincuid=0;
							         int dbpincode=0;
							         String dbincubationcentername="",dbthurstarea="",dblegalstatus="",dbotherlegalstatuss="",dbincubationspace="",dbotherincubationspace="",dbincubationmembername="",dbmobilenumber="",dbemailid="",dbincubationcenteraddress="",dbcity="",dbregiverification="",dbregistrationstatus="";
							         while(rs1.next())
							         {
							        	 dbincuid=rs1.getLong("incubationId");
							        	 dbincubationcentername=rs1.getString("incubationcentername");
							        	 dbthurstarea=rs1.getString("thurstarea");
							        	 dblegalstatus=rs1.getString("legalstatus");
							        	 dbotherlegalstatuss=rs1.getString("otherlegalstatus");
							        	 dbincubationspace=rs1.getString("incubationspace");
							        	 dbotherincubationspace=rs1.getString("otherspace");
							        	 dbincubationmembername=rs1.getString("incubationmembername");
							        	 dbmobilenumber=rs1.getString("mobilenumber");
							        	 dbemailid=rs1.getString("emailid");
							        	 dbincubationcenteraddress=rs1.getString("incubationcenteraddress");
							        	 dbcity=rs1.getString("city");
							        	 dbpincode=rs1.getInt("pincode");
							        	 dbregiverification=rs1.getString("regiverification");
							        	 dbregistrationstatus=rs1.getString("registrationstatus");
							         }
							         %>
							         <div class="col-sm-9 profile-all-details">
								     	   <div class="tab-content">
								     	         <div id="basic-profile" class="tab-pane fade in active">
								     	             <div class="panel panel-default card">
											      		<div class="panel-body">
										     	            <div class="list-group font">
															    <form class="form-horizontal" name="detailsForm">
																    <div class="form-group">
																      <p class="control-label col-sm-3">Name of Incubation Center:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbincubationcentername %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Thrust Area:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbthurstarea %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Legal Status:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dblegalstatus %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3"> Other Legal Status:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbotherlegalstatuss %></p>
																      </div>
																    </div>
																    
																    <div class="form-group">
																      <p class="control-label col-sm-3">Total Incubation Space in Sq.Ft:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbincubationspace %></p>
																      </div>
																    </div>
																    
																    <div class="form-group">
																      <p class="control-label col-sm-3"> Other Total Incubation Space in Sq.Ft:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbotherincubationspace %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Name of Incubation Member:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbincubationmembername %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Mobile Number:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbmobilenumber %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Email Id:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbemailid %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Incubation Center Address:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbincubationcenteraddress %></p>
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
																  </form>
															  </div>
														 </div>
													  </div>
								     	         </div>
											    <div id="personal-details" class="tab-pane fade">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			 <div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#personals"><b>Add Incubatee Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="personals" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="incubateeForm" action="./IncubationDetails" method="post">
																		      <div class="form-group">
																			    <label for="inputsm">Name / Title of Incubitee:</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="incuname" ng-model="incuname"  ng-pattern="/^[a-zA-Z ]{1,100}$/" required/>
																			     <span style="color:red" ng-show="incubateeForm.incuname.$dirty && incubateeForm.incuname.$invalid">
																				 <span ng-show="incubateeForm.incuname.$error.required">Please specify Incubitee Name</span></span>
																			     <span ng-show="incubateeForm.incuname.$error.pattern" style="color:red"> Numeric and special Characters are Not Allowed</span>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Incubatee Profile:</label>
																			    <select class="form-control" name="profile" required>
																			    	<option value="-">Select</option>
																			    	<option value="Ideation">Ideation</option>
																			    	<option value="POC">POC</option>
																			    	<option value="Rapid Prototype">Rapid Prototype</option>
																			    	<option value="Pilet Production">Pilet Production</option>
																			    	<option value="Pitch/building">Pitch/building</option>
																			    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
																			    	<option value="Graduated">Graduated</option>
																			    </select>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">No. of Team Member:</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="team" ng-model="team" ng-pattern="/^[0-9]{1,100}$/" required>
																			     <span style="color:red" ng-show="incubateeForm.team.$dirty && incubateeForm.team.$invalid">
																				 <span ng-show="incubateeForm.team.$error.required">Please specify Number Of Team Member</span></span>
																			     <span ng-show="incubateeForm.team.$error.pattern" style="color:red"> Alphabet and special Characters are Not Allowed .</span>
											
																			  </div>
																			 <div class="form-group">
																			     <label for="inputsm">Date of Start-up: (Format : MM/DD/YYYY)</label>
																				 <input class="form-control input-md" id="inputsm" type="text" name="dates" ng-model="dates" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
																				 <span style="color:red" ng-show="incubateeForm.dates.$dirty && incubateeForm.dates.$invalid">
																				 <span ng-show="incubateeForm.dates.$error.required">Please specify Date</span></span>
																			     <span ng-show="incubateeForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
																			
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Legal Status:</label>
																			    <select class="form-control" name="legalstatus"  required>
																			    	<option value="-" selected="selected">Select</option>
																			    	<option value="Unregistered Beginner">Unregistered Beginner</option>
																			    	<option value="Registered Startup">Registered Startup</option>
																			    	<option value="Partner ship">Partner ship</option>
																			    	<option value="Private Limited">Private Limited</option>
																			    	<option value="LLP">LLP</option>
																			    	<option value="Public Limited">Public Limited</option>
																			    	<option value="other">Other</option>
																			    </select><br>
																			    <div ng-switch="legalstatus">
																			    	<div ng-switch-when="other">
																			    		<input type="text" class="form-control" name="legalstatus" placeholder="Please Mention" required> 
																			    	</div>
																			    </div>
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-ms active"
																			  		        ng-disabled="
																			  		         incubateeForm.incuname.$error.pattern || incubateeForm.team.$error.pattern ||  incubateeForm.dates.$error.pattern">Submit</button>
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
																        <label class="control-label col-sm-8">Incubatee Details</label>
																      </div>
																    </div><hr>
																
																    <%
																    
																    String query2="select incubationregi.incubationId,incubationdetail.incubationdetailId,incubationdetail.incubationname,incubationdetail.incubationprofile,incubationdetail.noofteammember,incubationdetail.startupdate,incubationdetail.legalstatus,incubationdetail.otherlegalstatus from incubationregi,incubationdetail where incubationregi.incubationId=incubationdetail.incubationId and incubationdetail.incubationId=?";
																    pst2=con.prepareStatement(query2);
																    pst2.setLong(1,dbincubutionid);
																    rs2=pst2.executeQuery();
																    long dbincubationdetailid=0,dbincubationid=0;
																    String dbincubationname="",dbincubationprofile="",dbnoofteammember="",dbstartupdate="",dblegalstatuss="",dbotherlegalstatus="";
																    while(rs2.next())
																    {
																    	dbincubationid=rs2.getLong(1);
																    	dbincubationdetailid=rs2.getLong(2);
																    	dbincubationname=rs2.getString(3);
																    	dbincubationprofile=rs2.getString(4);
																    	dbnoofteammember=rs2.getString(5);
																    	dbstartupdate=rs2.getString(6);
																    	dblegalstatuss=rs2.getString(7);
																    	dbotherlegalstatus=rs2.getString(8);
																    	
																    	
																    	%>
																    	  <a class="fload_right" data-toggle="modal" href="incubation-edit-incubatee.jsp?incubationid=<%=dbincubationdetailid %>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																       <div class="form-group">
																      <p class="control-label col-sm-3">Name / Title of Incubatee:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbincubationname %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Incubatee Profile:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbincubationprofile %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">No. of Team Member :</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbnoofteammember %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Date of Start-up:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbstartupdate %></p>
																      </div>
																    </div>
																    <%
																    if(dblegalstatuss.equals("Other"))
															    	{%>
																    	 <div class="form-group">
																	      <p class="control-label col-sm-3">Legal Status:</p>
																	      <div class="col-sm-8">
																	        <p class="font-color"><%=dblegalstatuss %></p>
																	      </div>
																	    </div>
																	    	  <div class="form-group">
																	      <p class="control-label col-sm-3">Other Legal Status:</p>
																	      <div class="col-sm-8">
																	        <p class="font-color"><%=dbotherlegalstatus %></p>
																	      </div>
																	    </div><hr>
															    	<%}else
															    	{%>
															    		<div class="form-group">
																	      <p class="control-label col-sm-3">Legal Status:</p>
																	      <div class="col-sm-8">
																	        <p class="font-color"><%=dblegalstatuss %></p>
																	      </div>
																	    </div><hr>
																	    	  
															    	<%}}
																      %>
																   </form>
															  </div>
											      		</div>
											      	</div>
											    </div>
											    <div id="techmology" class="tab-pane fade">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			<div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#myskill"><b>Add Incubation Milestones/ Achievements/ Success Stories</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="myskill" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="mileForm" action="./IncubationMilestones" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Date: (Format : MM/DD/YYYY)</label>
																				 <input class="form-control input-md" id="inputsm" type="text" name="dates" ng-model="dates" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
																				 <span style="color:red" ng-show="mileForm.dates.$dirty && mileForm.dates.$invalid">
																				 <span ng-show="mileForm.dates.$error.required">Please specify Date</span></span>
																			     <span ng-show="mileForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Milestone Name :</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="milestonename" ng-model="milestonename" ng-pattern="/^[a-zA-Z ]{1,100}$/" required/>
																			     <span style="color:red" ng-show="mileForm.milestonename.$dirty && mileForm.milestonename.$invalid">
																				 <span ng-show="mileForm.milestonename.$error.required">Please specify MileStone Name</span></span>
																			     <span ng-show="mileForm.milestonename.$error.pattern" style="color:red">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Milestone Type:</label>
																			    <select class="form-control" name="milestone" ng-model="milestone" required>
																			    	<option value="" ng-show="false">Select</option>
																			    	<option value="Publication">Publication</option>
																			    	<option value="Grants">Grants</option>
																			    	<option value="POC">POC</option>
																			    	<option value="Rapid Prototype">Rapid Prototype</option>
																			    	<option value="Ready to Commercialization">Ready to Commercialization</option>
																			    	<option value="Outcome">Outcome</option>
																			    	<option value="Consultancy">Consultancy</option>
																			    	<option value="Training">Training</option>
																			    	<option value="Medal and Certificate">Medal and Certificate</option>
																			    </select>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Brief Description:</label>
																			   <textarea rows="" cols="" class="form-control" name="description" ng-model="description" required></textarea>
																			   <span style="color:red" ng-show="mileForm.description.$dirty && mileForm.description.$invalid">
																				 <span ng-show="mileForm.description.$error.required">Please specify Description</span></span>
																			     <span ng-show="mileForm.description.$error.pattern" style="color:red">Numeric and special Characters are Not Allowed</span>
																			  
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		        ng-disabled="mileForm.dates.$error.pattern||mileForm.milestonename.$error.pattern||mileForm.description.$error.pattern">Save</button>
																			  
																			  </div>
																		</form> 
																	  </div>
																    </div>
																  </div>
															 </div> <hr>
															 <div class="list-group font">
															    <form class="form-horizontal">
															        <div class="form-group">
																      <div class="col-sm-11">
																        <label class="control-label col-sm-7">Incubation Milestones/ Achievements/ Success Stories</label>
																      </div>
																    </div><hr>
																    
																  
																    <%
																    String query3="select incubationregi.incubationId,incubationmilestone.incubationmileId,incubationmilestone.incudate,incubationmilestone.incumilestonename,incubationmilestone.incumilestonetype,incubationmilestone.incudescription from incubationregi,incubationmilestone where incubationregi.incubationId=incubationmilestone.incubationId and incubationmilestone.incubationId=?";
																    pst3=con.prepareStatement(query3);
																    pst3.setLong(1,dbincubutionid);
																    rs3=pst3.executeQuery();
																    long dbincubationId=0,dbincubationmilestoneId=0;
																    String dbincudate="",dbincumilestonename="",dbincumilestonetype="",dbincudescription="";
																    while(rs3.next())
																    {
																    	dbincubationId=rs3.getLong(1);
																    	dbincubationmilestoneId=rs3.getLong(2);
																    	dbincudate=rs3.getString(3);
																    	dbincumilestonename=rs3.getString(4);
																    	dbincumilestonetype=rs3.getString(5);
																    	dbincudescription=rs3.getString(6);
																    	%>
																      <a class="fload_right" data-toggle="modal" href="incubation-edit-success.jsp?incubationmilestoneId=<%=dbincubationmilestoneId %>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Date:</p>
																      <div class="col-sm-8">
																      <p class="font-color"><%=dbincudate %></p>
																      </div>
																      </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Milestone Name:</p>
																      <div class="col-sm-8">
																      <p class="font-color"><%=dbincumilestonename %></p>
																      </div>
																      </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Milestone Type:</p>
																      <div class="col-sm-8">
																      <p class="font-color"><%=dbincumilestonetype %></p>
																      </div>
																      </div>
																      <div class="form-group">
																      <p class="control-label col-sm-3">Description:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbincudescription %></p>
																      </div>
																      </div><hr>
																    	
																    <%}
																     %>
																  
																  </form>
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
		 </div>
	</body>
</html>
