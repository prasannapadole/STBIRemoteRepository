	<%@page import="com.dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="sigDashboard" ng-controller="sigctrldashboard">
    <head>
	    <title>Institute Dashboard</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/sig-dashboard.js"></script>
	    <script src="js/city-navbar.js"></script>
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
		<div class="containers">
			<div class="top">
				<ul class="nav nav-tabs navs">
				    <li class="active"><a data-toggle="tab" href="#myidea" class="tab-font-grorgia">IDEA FROM INSTITUTE</a></li>
				    <li><a data-toggle="tab" href="#opportinity" class="tab-font-grorgia">MY OPPORTUNITY</a></li>
				    <li><a data-toggle="tab" href="#myprofile" class="tab-font-grorgia">INSTITUTE PROFILE</a></li>
				</ul>
				<div class="tab-content">
				    <!---------------------------------------------------------MY SIG IDEA-------------------------------------------->
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
								    String que1="select institutename from instituteregi where instituteId=?";
								    p1=con.prepareStatement(que1);
								    p1.setLong(1,dbINSTITUTEID);
								  
								    rr1=p1.executeQuery();
								    String dbinstitutenameee="";
								    while(rr1.next())
								    {
								    	dbinstitutenameee=rr1.getString(1);	
								    	String que="select ideaid,titlename,idearegidate,statusofidea,instuname from ideasubmit where instuname=? and statusofidea=? ";
									    p=con.prepareStatement(que);
									    p.setString(1,dbinstitutenameee);
									    p.setString(2,ideastatus);
									    rr=p.executeQuery();
									   long dbideaid=0;
									   String dbtitlename="",idearegidate="",statusofidea="";
									    String dbinstuname="";
									    while(rr.next())
									    {
									    	
									    	dbideaid=rr.getLong(1);
									    	dbtitlename=rr.getString(2);
									    	idearegidate=rr.getString(3);
									    	statusofidea=rr.getString(4);
									    	dbinstuname=rr.getString(5);	
									    	 if(dbinstitutenameee.equals(dbinstuname))
									    	 {
									    		%> 
									    	 <tbody>
													      <tr>
													        <td align="center"><b><%=dbideaid %></b></td>
													        <td align="center"><p class="table-idea"><a href="institute-view-all-details.jsp?dbideaid=<%=dbideaid %>" target="_blank"><%=dbtitlename %></a></p></td>
													        <td align="center"><p class="table-data"><%=idearegidate %></p></td>
													        <td align="center"><p class="table-data"><%=statusofidea %></p></td>
													        <td align="center"><p class=" fload_right table-data-button">
														     <a class="btn btn-xs btn-info active" href="institute-user-view-details.jsp?dbideaid=<%=dbideaid %>" target="_blank">My Support</a>	
																<%-- <button type="button" class="btn btn-xs btn-warning active"  data-toggle="modal" data-target="#delete"><i class="fa fa-trash" style="font-size:18px"></i></button>--%>
															</p></td>
													      </tr>	 
												<% }}}%>
								   
								    </tbody>
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
												<ul class="nav nav-tabs container-opportunity ">
													<li class="active">
														<a href="#internship" data-toggle="tab" class="tab-sub-font-grorgia">INTERNSHIP</a>
													</li>
													<li >
														<a href="#project" data-toggle="tab" class="tab-sub-font-grorgia">PROJECTS</a>
													</li>
													<li >
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
													<div class="tab-pane active" id="internship">
													    <button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#inter">Filter</button>
														<div id="inter" class="collapse center ">
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
														        <th class="table-dark-gray">LIST OF INTERNSHIP</th>
														        <th class="table-fent-gray">DATE </th>
														        <th class="table-dark-gray">STATUS</th>
														        <th class="table-fent-gray"></th>
														      </tr>
														    </thead>
														    <tbody>
														     <%
														     String internshipstaus="Approved";
									        		         int institutedisplay=0;
														     String quer="select internsId,coursetitle,status,applydate from upgrademybusinesssinternship where status=? and  institutedisplay=?";
														    ps=con.prepareStatement(quer);
														    ps.setString(1,internshipstaus);
														    ps.setInt(2,institutedisplay);
														    r=ps.executeQuery();
														    long dbinternsId=0;
														    String dbcoursetitle="",dbstatus="",dbapplydate="";
														    while(r.next())
														    {
														    	dbinternsId=r.getLong(1);
														    	dbcoursetitle=r.getString(2);
														    	dbstatus=r.getString(3);
														    	dbapplydate=r.getString(4);
														    	%>
								 								<tbody>
														    	 <tr>
														        <td align="center"><b><%=dbinternsId %></b></td>
														        <td align="center"><p class="table-idea"><a href="institute-internship-details.jsp?dbinternsId=<%=dbinternsId %>" target="_blank"><%=dbcoursetitle %></a></p></td>
														        <td align="center"><p class="table-data"><%=dbstatus %></p></td>
														        <td align="center"><p class="table-data"><%=dbapplydate %></p></td>
														        <td align="center"><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="institute-internship-details.jsp?dbinternsId=<%=dbinternsId %>" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="institute-internship-upgrade-progress.jsp" target="_blank">Update Progress</a>
																	<a button type="button" class="btn btn-xs btn-info active" href="institute-deleteinternshiprequest.jsp?internsId=<%=dbinternsId %>"><i class="fa fa-trash" style="font-size:18px"></i></a>
																</p></td>
														      	</tr>
														    	</tbody>						    
														       <%}%>
														    </tbody>
														 </table><hr>
														 <!-------------------------------Delete----------------------------------->
														   <div class="modal fade" id="interndelete" role="dialog">
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
														      <button class="btn btn-info btn-lg active "> <span class="glyphicon glyphicon-search"></span></button>
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
														     <%
														    String projectStatus="Approved";
															int institutedisplayproject=0;
														    String quer1="select projectId,projecttitle,status,applydate from upgrademybusinessprojectinfo where status=? and institutedisplay=?";
														    ps1=con.prepareStatement(quer1);
														    ps1.setString(1,projectStatus);
														    ps1.setInt(2,institutedisplayproject);
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
														        <td align="center"><p class="table-idea"><a href="institute-project-details.jsp?dbprojectId=<%=dbprojectid %>" target="_blank"><%=dbprojecttitle %></a></p></td>
														        <td align="center"><p class="table-data"><%=dbstatuss %></p></td>
														        <td align="center"><p class="table-data"><%=dbapplydatee %></p></td>
														        <td align="center"><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="institute-project-details.jsp?dbprojectId=<%=dbprojectid %>" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="institute-project-upgrade-progress.jsp" target="_blank">Update Progress</a>
																	<a button type="button" class="btn btn-xs btn-info active" href="institute-deleteprojectrequest.jsp?projectid=<%=dbprojectid %>"><i class="fa fa-trash" style="font-size:18px"></i></a>
																</p></td>
														      </tr>
														    </tbody>
														       <%} %>
														    </table><hr>
														    </div>
														<div class="tab-pane" id="consultancy">
													    <button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#cons">Filter</button>
														<div id="cons" class="collapse center ">
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
														        <td><b>121345</b></td>
														        <td><p class="table-idea"><a href="" target="_blank">CONSULTANCY NAME</a></p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class="table-data">03/11/2017</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="institute-consultancy-upgrade-progress.jsp" target="_blank">Update Progress</a>
																	<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#projectdelete"><i class="fa fa-trash" style="font-size:18px"></i></button>
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
														        <td><p class="table-idea"><a href="institute-grant-funding-details.jsp" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
														        <td><p class="table-data">23/06/2017</p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="" target="">View</a>
																	<a class="btn btn-xs btn-warning active" href="institute-grand-funding-upgrate-progress.jsp" target="_blank">Update Progress</a>
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
																	<a class="btn btn-xs btn-warning active" href="institute-hackathons-upgrate-progress.jsp" target="_blank">Update Progress</a>
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
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>ADD INFORMATION
								                </a>
								                <a data-toggle="tab" href="#department" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-university fa-profile-size"></i><br/>DEPARTMENT
								                </a>
								                <a data-toggle="tab" href="#techmology" class="list-group-item tab-font-verti-grorgia">
								                     <i class="fa fa-user-circle-o fa-profile-size"></i><br/>DEPARTMENT <small>MILESTONES/ ACHIVEMENTS/ SUCCESS STORIES</small>
								                </a>
							              </div><br>
							         </div>
							         <%
							         String query1="select * from instituteregi where instituteId=?";
									 pst1=con.prepareStatement(query1);
									 pst1.setLong(1,dbINSTITUTEID);
									 rs1=pst1.executeQuery();
									 int dbpincode=0;
									 String dbinstitutenamee="",dbinstituteprinciplenamee="",dbgender="",dbmobilenumber="",dbemailid="",dbnumberofdepartment="",dbfacultymembernumber="",dbregisteredas="",dbinstitutemobilenumber="",dbinstituuteemailid="",dbinstituteaddress="",dbcity="",dbregiverification="",dbregistrationstatus="";
									 while(rs1.next())
									     {
										 dbinstitutenamee=rs1.getString("institutename");
										 dbinstituteprinciplenamee=rs1.getString("instituteprinciplename");
										 dbgender=rs1.getString("gender");
										 dbmobilenumber=rs1.getString("mobilenumber");
										 dbemailid=rs1.getString("emailid");
										 dbnumberofdepartment=rs1.getString("numberofdepartment");
										 dbfacultymembernumber=rs1.getString("facultymembernumber");
										 dbregisteredas=rs1.getString("registeredas");
										 dbinstitutemobilenumber=rs1.getString("institutemobilenumber");
										 dbinstituuteemailid=rs1.getString("instituuteemailid");
										 dbinstituteaddress=rs1.getString("instituteaddress");
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
															    <form class="form-horizontal">
																    <div class="form-group">
																      <p class="control-label col-sm-3">Name of Institute:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbinstitutenamee %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Name of Principal:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbinstituteprinciplenamee %></p>
																      </div>
																    </div>
																       <div class="form-group">
																      <p class="control-label col-sm-3">Gender:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbgender %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Mobile No:</p>
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
																      <p class="control-label col-sm-3">No. of Department:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbnumberofdepartment %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">No. of Total Faculty Member:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbfacultymembernumber %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Registered As:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbregisteredas %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Institute Official Mobile No:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbinstitutemobilenumber %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Institute Official Email Id:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbinstituuteemailid %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Institute Address:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbinstituteaddress %></p>
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
																      <p class="control-label col-sm-3">Registration Verification:</p>
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
																        <a data-toggle="collapse" href="#personals"><b>Add Principal Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="personals" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="myForm" action="./UpdateInformation" method="post">
																		      <div class="form-group">
																			    <label for="inputsm">Add New Principal Name</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="principalName" ng-model="principalName" ng-pattern="/^[a-zA-Z ]{1,100}$/" required >
																			    <span style="color:red" ng-show="myForm.principalName.$dirty && myForm.principalName.$invalid">
																			     <span ng-show="myForm.principalName.$error.required">Please specify Department Name</span></span>
																			     <span style="color:red" ng-show="myForm.principalName.$error.pattern">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Add New Mobile No :</label>
																			    <input class="form-control input-sm"  type="text" ng-model="mobilenumber" name="mobilenumber" ng-pattern="/^(\+\91{1,2}[- ])\d{10}$/" required><small>+91 9855514371</small><br>
																			     <span style="color:red" ng-show="myForm.mobilenumber.$dirty && myForm.mobilenumber.$invalid">
														      					 <span ng-show="myForm.mobilenumber.$error.required">Please specify your Mobile Number</span></span>
														     					 <span ng-show="myForm.mobilenumber.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed <br> Please enter valid format(+91 9855514371)</span>
 																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add New Email Id</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="email" ng-model="email" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i" required>
																		    	  <span style="color:red" ng-show="myForm.email.$dirty && myForm.email.$invalid">
																			      <span ng-show="myForm.email.$error.required">Please specify your Email ID</span></span>
																				  <span ng-show="myForm.email.$error.pattern" style="color:red">Please enter correct email address.</span>
																			  </div>
																			  <div class="form-group fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		  ng-disabled="myForm.principalName.$dirty && myForm.principalName.$invalid && myForm.principalName.$error.pattern || 
																			  		               myForm.mobilenumber.$dirty && myForm.mobilenumber.$invalid && myForm.mobilenumber.$error.pattern ||
																			  		  			   myForm.email.$dirty && myForm.email.$invalid && myForm.email.$error.pattern"
																			  		>Submit</button>
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
																        <label class="control-label col-sm-8">Principal Details</label>
																      </div>
																    </div><hr>
																    <div class="form-group">
																      <p class="control-label col-sm-3">New Principle Name:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbinstituteprinciplenamee %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">New Mobile No:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbmobilenumber %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">New Email Id:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbemailid %></p>
																      </div>
																    </div>
																  </form>
															  </div><hr>
											      		</div>
											      	</div>
											    </div>
											    <div id="department" class="tab-pane fade">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			<div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#educations"><b>Add Department Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="educations" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="deptForm" action="./AddDepratmentInformation" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Department Name:</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="dname" ng-model="dname" ng-pattern="/^[a-zA-Z ]{1,100}$/" required/>
																			    <span style="color:red" ng-show="deptForm.dname.$dirty && deptForm.dname.$invalid">
																			     <span ng-show="deptForm.dname.$error.required">Please specify Department Name</span></span>
																			     <span style="color:red" ng-show="deptForm.dname.$error.pattern">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">HoD Name:</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="hodname" ng-model="hodname" ng-pattern="/^[a-zA-Z ]{1,100}$/" required/>
																			     <span style="color:red" ng-show="deptForm.hodname.$dirty && deptForm.hodname.$invalid">
																			     <span ng-show="deptForm.hodname.$error.required">Please specify HOD Name</span></span>
																			     <span style="color:red" ng-show="deptForm.hodname.$error.pattern">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Mobile Number:</label>
																			      <input class="form-control" id="focusedInput" type="text" value="" ng-model="mobilenumber" name="mobilenumber" ng-pattern="/^(\+\91{1,2}[- ])\d{10}$/" required/><small>Format :+91 9855514371</small><br>
																			      <span style="color:red" ng-show="deptForm.mobilenumber.$dirty && deptForm.mobilenumber.$invalid">
																			      <span ng-show="deptForm.mobilenumber.$error.required">Please specify your Mobile Number</span></span>
																			      <span ng-show="deptForm.mobilenumber.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed <br> Please enter valid format(+91 9855514371)</span>
														  
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Email id:</label>
																			     <input class="form-control" id="focusedInput" type="text" value="" name="email" ng-model="email" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i" required/>
																				  <span style="color:red" ng-show="deptForm.email.$dirty && deptForm.email.$invalid">
																			      <span ng-show="deptForm.email.$error.required">Please specify your Email ID</span></span>
																				  <span ng-show="deptForm.email.$error.pattern" style="color:red">Please enter correct email address.</span>
														
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm" >No. of Student</label><br>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="nostudent" ng-model="nostudent" ng-pattern="/^[0-9]{1,6}$/" required/>
																			 	  <span style="color:red" ng-show="deptForm.nostudent.$dirty && deptForm.nostudent.$invalid">
																			      <span ng-show="deptForm.nostudent.$error.required">Please specify No. of Student</span></span>
																				  <span ng-show="deptForm.nostudent.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed.</span>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Description</label>
																			    <textarea rows="" cols="" class="form-control" name="description" ng-model="description" required></textarea>
																			  </div>
																			  <div class="form-group">
																			    	<button type="submit" class="btn btn-info btn-md active fload_right" 
																			    	        ng-disabled="   deptForm.dname.$dirty && deptForm.dname.$invalid && deptForm.dname.$error.pattern || 
																			    	        
																			    	                        deptForm.hodname.$dirty && deptForm.hodname.$invalid && deptForm.hodname.$error.pattern || 
																			    	        			 deptForm.mobilenumber.$dirty && deptForm.mobilenumber.$invalid && deptForm.mobilenumber.$error.pattern ||
																			    	        			 deptForm.email.$dirty && deptForm.email.$invalid && deptForm.email.$error.pattern ||
																			    	        			 deptForm.nostudent.$dirty && deptForm.nostudent.$invalid && deptForm.nostudent.$error.pattern "
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
																        <label class="control-label col-sm-6">Department Details</label>
																      </div>
																    </div><hr>
																    
																   
																    <%
																    
																    String query3="select * from institutedept where instituteId=?";
																    pst3=con.prepareStatement(query3);
																    pst3.setLong(1,dbINSTITUTEID);
																    rs3=pst3.executeQuery();
																    long  dbinstituteid=0,dbnoofstudent=0;
																    String dbdeptname="",dbhodname="",dbmobilenumberr="",dbemailidd="",dbdescription="";
																    while(rs3.next())
																    {
																    	dbinstituteid=rs3.getLong("deptId");
																    	dbdeptname=rs3.getString("deptname");
																    	dbhodname=rs3.getString("hodname");
																    	dbmobilenumberr=rs3.getString("mobilenumber");
																    	dbemailidd=rs3.getString("emailid");
																    	dbnoofstudent=rs3.getLong("noofstudent");
																    	dbdescription=rs3.getString("description");
																    	%>
																    	  <a class="fload_right"  href="institute-edit-dept.jsp?instituteid=<%=dbinstituteid %>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																    	<div class="form-group">
																      <p class="control-label col-sm-3">Department Name:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbdeptname %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Name of Department HoD:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbhodname %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Mobile Number:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbmobilenumberr %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Email Id:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbemailidd %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">No .of Student:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbnoofstudent %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Description:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbdescription %></p>
																      </div>
																    </div><hr>
																      <%}%>
																  
																
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
																        <a data-toggle="collapse" href="#myskill"><b>Add Department Milestones/ Achievements/ Success Stories</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="myskill" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="milestoForm" action="./AddMilestones" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Date: (Format: MM/DD/YYYY)</label>
																			    <input class="form-control input-md" id="inputsm" type="text" name="dates" ng-model="dates" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
																			      <span style="color:red" ng-show="milestoForm.dates.$dirty && milestoForm.dates.$invalid">
																			      <span ng-show="milestoForm.dates.$error.required">Please specify Date</span></span>
																				  <span ng-show="milestoForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Milestone Name:</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="milename" ng-model="milename" ng-pattern="/^[a-zA-Z ]{1,100}$/" required/>
																			    <span style="color:red" ng-show="milestoForm.milename.$dirty && milestoForm.milename.$invalid">
																			      <span ng-show="milestoForm.milename.$error.required">Please specify Milestone</span></span>
																				  <span ng-show="milestoForm.milename.$error.pattern" style="color:red">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			    
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Milestone Type:</label>
																			    <select class="form-control" name="milestone" ng-model="milestone" required/>
																			    	<option value="" ng-show="false">Select</option>
																			    	<option value="Faculty Achievement">Faculty Achievement</option>
																			    	<option value="Faculty Achievement">Student Achievement</option>
																			    </select>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Brief Description:</label>
																			   <textarea rows="" cols="" class="form-control" name="description" ng-model="description" required/></textarea>
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		   ng-disabled="
																			  		    milestoForm.milename.$dirty &&  milestoForm.milename.$invalid &&  milestoForm.milename.$error.pattern || milestoForm.dates.$error.pattern"
																			  		>Save</button>
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
																        <label class="control-label col-sm-7">Department Milestones/ Achievements/ Success Stories</label>
																      </div>
																    </div><hr>
																    <%
																    
																    String query4="select * from institutemilestone where instituteId=?";
																    pst4=con.prepareStatement(query4);
																    pst4.setLong(1,dbINSTITUTEID);
																    rs4=pst4.executeQuery();
																    long dbinstitutemilestonId=0;
																    String dbinsdate="",dbmilestonename="",dbmilestonetype="",dbdescriptionn="";
																    while(rs4.next())
																        {
																    	dbinstitutemilestonId=rs4.getLong("institutemilestonId");
																    	dbinsdate=rs4.getString("insdate");
																    	dbmilestonename=rs4.getString("milestonename");
																    	dbmilestonetype=rs4.getString("milestonetype");
																        dbdescriptionn=rs4.getString("description");
																    
																         %>
																          <a class="fload_right" href="institute-edit-success.jsp?institutemilestonId=<%=dbinstitutemilestonId %>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																    	   <div class="form-group">
																      <p class="control-label col-sm-3">Date:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbinsdate  %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Milestone Name:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbmilestonename %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Milestone Type:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbmilestonetype %></p>
																      </div>
																    </div>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Description:</p>
																      <div class="col-sm-8"> 
																        <p class="font-color"><%=dbdescriptionn %></p>
																      </div>
																    </div><hr>
																
																    	
																    <%} %>
																 
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
 ,