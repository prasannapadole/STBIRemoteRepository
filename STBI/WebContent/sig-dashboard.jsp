<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="sigDashboard" ng-controller="sigctrldashboard">
    <head>
	    <title>SIG Dashboard</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/sig-dashboard.js"></script>
	    <script src="js/city-navbar.js"></script> </head>
	<body>
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
		<div class="containers">
			<div class="top">
				<ul class="nav nav-tabs navs">
				    <li class="active"><a data-toggle="tab" href="#myidea" class="tab-font-grorgia">IDEA FROM MY SIG</a></li>
				    <li><a data-toggle="tab" href="#opportinity" class="tab-font-grorgia">MY OPPORTUNITY</a></li>
				    <li><a data-toggle="tab" href="#myprofile" class="tab-font-grorgia">MY PROFILE</a></li>
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
									    String que1="select siggroupname from sigregi where sigId=?";
									    p1=con.prepareStatement(que1);
									    p1.setLong(1,sigid);
									    rr1=p1.executeQuery();
									    String siggroupname="";
									    while(rr1.next())
								   			 {
								    	siggroupname=rr1.getString(1);	
								    	String que="select ideaid,titlename,idearegidate,statusofidea,signame from ideasubmit where signame=? and statusofidea=? ";
									    p=con.prepareStatement(que);
									    p.setString(1,siggroupname);
									    p.setString(2,ideastatus);
									    rr=p.executeQuery();
									    long dbideaid=0;
									    String dbtitlename="",idearegidate="",statusofidea="";
									    String dbsigname="";
									      while(rr.next())
									       {
									    	
									    	dbideaid=rr.getLong(1);
									    	dbtitlename=rr.getString(2);
									    	idearegidate=rr.getString(3);
									    	statusofidea=rr.getString(4);
									    	dbsigname=rr.getString(5);	
									    	 if(dbsigname.equals(siggroupname))
									    	 {
									    		%> 
									    	 <tbody>
													      <tr>
													        <td align="center"><b><%=dbideaid %></b></td>
													        <td align="center"><p class="table-idea"><a href="sig-view-all-details.jsp?dbideaid=<%=dbideaid %>" target="_blank"><%=dbtitlename %></a></p></td>
													        <td align="center"><p class="table-data"><%=idearegidate %></p></td>
													        <td align="center"><p class="table-data"><%=statusofidea %></p></td>
													        <td align="center"><p class=" fload_right table-data-button">
																<a class="btn btn-xs btn-info active" href="sig-user-view-details.jsp?dbideaid=<%=dbideaid %>" target="_blank">My Support</a>
																<%--<button type="button" class="btn btn-xs btn-warning active"  data-toggle="modal" data-target="#delete"><i class="fa fa-trash" style="font-size:18px"></i></button> --%>
															</p></td>
													      </tr>	 
									    		 
									    	<% }
									         }
									        }%>
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
														<a href="#project" data-toggle="tab" class="tab-sub-font-grorgia">PROJECTS</a>
													</li>
													<li>
														<a href="#grand-funding" data-toggle="tab" class="tab-sub-font-grorgia">GRANTS AND FUNDING</a>
													</li>
													<li>
														<a href="#consultancy" data-toggle="tab" class="tab-sub-font-grorgia">CONSULTANCY</a>
													</li>
													<li>
														<a href="#halcathons" data-toggle="tab" class="tab-sub-font-grorgia">HACKATHONS </a>
													</li>
												</ul><hr>
												<div class="tab-content">
													<div class="tab-pane active" id="project">
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
														   <%
														    String projectStatus="Approved";
															int sigdisplayproject=0;
														    String quer1="select projectId,projecttitle,status,applydate from upgrademybusinessprojectinfo where status=? or sigdisplay=?";
														    ps1=con.prepareStatement(quer1);
														    ps1.setString(1,projectStatus);
														    ps1.setInt(2,sigdisplayproject);
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
														        <td align="center"><p class="table-idea"><a href="sig-project-details.jsp?dbprojectId=<%=dbprojectid %>" target="_blank"><%=dbprojecttitle %></a></p></td>
														        <td align="center"><p class="table-data"><%=dbapplydatee %></p></td>
														        <td align="center"><p class="table-data"><%=dbstatuss %></p></td>
														        <td align="center"><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="sig-project-details.jsp?dbprojectId=<%=dbprojectid %>" target="">Apply</a>
																	<a class="btn btn-xs btn-warning active" href="sig-project-upgrade-progress.jsp" target="_blank">Update Progress</a>
																	<a button type="button" class="btn btn-xs btn-info active" href="sig-deleteprojectrequest.jsp?projectid=<%=dbprojectid %>"><i class="fa fa-trash" style="font-size:18px"></i></a>
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
														        <td><p class="table-idea"><a href="sig-grant-funding-details.jsp" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
														        <td><p class="table-data">23/06/2017</p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="" target="">Apply</a>
																	<a class="btn btn-xs btn-warning active" href="sig-grand-funding-upgrate-progress.jsp" target="_blank">Update Progress</a>
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
													<div class="tab-pane" id="consultancy">
													    <button type="button" class="btn btn-info active" data-toggle="collapse" data-target="#consultancy">Filter</button>
														<div id="consultancy" class="collapse center ">
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
														        <th class="table-dark-gray">LIST OF CONSULTANCY</th>
														        <th class="table-fent-gray">DATE </th>
														        <th class="table-dark-gray">STATUS</th>
														        <th class="table-fent-gray"></th>
														      </tr>
														    </thead>
														    <tbody>
														     <tr>
														        <td><b>325335</b></td>
														        <td><p class="table-idea"><a href="sig-consultancy-details.jsp" target="_blank">The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.The English Wikipedia is the English-language edition of the free online encyclopedia Wikipedia.</a></p></td>
														        <td><p class="table-data">23/06/2017</p></td>
														        <td><p class="table-data">Pending</p></td>
														        <td><p class=" fload_right table-data-button">
																	<a class="btn btn-xs btn-info active" href="" target="">Apply</a>
																	<a class="btn btn-xs btn-warning active" href="sig-consultancy-upgrate-progress.jsp" target="_blank">Update Progress</a>
																	<button type="button" class="btn btn-xs btn-info active"  data-toggle="modal" data-target="#consu"><i class="fa fa-trash" style="font-size:18px"></i></button>
																</p></td>
														      </tr>
														    </tbody>
														 </table><hr>
														  <!-------------------------------Delete----------------------------------->
														   <div class="modal fade" id="consu" role="dialog">
															    <div class="modal-dialog modal-md">
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h5 class="modal-title">Say reason for deleting?</h5>
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
														        <th class="table-dark-gray">LIST OF HACKATHONS</th>
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
																	<a class="btn btn-xs btn-info active" href="" target="">Apply</a>
																	<a class="btn btn-xs btn-warning active" href="sig-hackathons-upgrate-progress.jsp" target="_blank">Update Progress</a>
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
							                    <a data-toggle="tab" href="#basic-details" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>BASIC DETAILS
								                </a>
								                <a data-toggle="tab" href="#personal-details" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>SIG CO-ORDINATOR DETAILS
								                </a>
								                <a data-toggle="tab" href="#incubatee-details" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-user-circle-o fa-profile-size"></i><br/>ADD INCUBATEE
								                </a>
								                <a data-toggle="tab" href="#milestone" class="list-group-item tab-font-verti-grorgia">
								                  	 <i class="fa fa-university fa-profile-size"></i><br/>SIG <br><small>MILESTONES/ ACHIEVEMENTS/ SUCCESS STORIES</small>
								                </a>
								                <a data-toggle="tab" href="#techmology" class="list-group-item tab-font-verti-grorgia">
								                     <i class="fa fa-user-circle-o fa-profile-size"></i><br/>TECHNOLOGY FOR COMMERCIALIZATION ZONE
								                </a>
								                  <a data-toggle="tab" href="" class="list-group-item tab-font-verti-grorgia">
								                     <i class="fa fa-user-circle-o fa-profile-size"></i><br/>ADD CONSULTANCY RECORD
								                </a>
							              </div><br>
							         </div>
							         
							         <div class="col-sm-9 profile-all-details">
								     	   <div class="tab-content">
								     	         <div id="basic-details" class="tab-pane fade in active">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
										      				    <%
							         String query1="select * from sigregi where sigId=?";
										pst1=con.prepareStatement(query1);
							            pst1.setLong(1,sigid);
									rs1=pst1.executeQuery();
									int pincode=0;
								long dbsig=0;
								String dbsiggroupname="",dbspecialarea="",dbgroupleadernamee="",siggrouptype="",dbindustryname="",dbacademicnamee="",dbmobilenumber="",dbemailid="",dbaddressofsigleader="",dbcity="",dbregiverification="",dbregistrationstatus="";
									while(rs1.next())
									{
										dbsig=rs1.getLong("sigId");
										dbsiggroupname=rs1.getString("siggroupname");
										dbspecialarea=rs1.getString("specialarea");
										dbgroupleadernamee=rs1.getString("groupleadername");
										siggrouptype=rs1.getString("siggrouptype");
										dbindustryname=rs1.getString("associatedindustryname");
										dbacademicnamee=rs1.getString("academicnamee");
										dbmobilenumber=rs1.getString("mobilenumber");
										dbemailid=rs1.getString("emailid");
										dbaddressofsigleader=rs1.getString("addressofsigleader");
										dbcity=rs1.getString("city");
										pincode=rs1.getInt("pincode");
										dbregiverification=rs1.getString("regiverification");
										dbregistrationstatus=rs1.getString("registrationstatus");
										%>
										 <div class="form-group">
															      <p class="control-label col-sm-3">SIG Group Name:</p>
															      <div class="col-sm-8">
															      <p class="font-color"><%=dbsiggroupname %></p>
															      </div>
															      </div>
							       								  <div class="form-group">
															      <p class="control-label col-sm-3">Area of Specialization:</p>
															      <div class="col-sm-8">
															      <p class="font-color"><%=dbspecialarea %></p>
															      </div>
															      </div>
															      <div class="form-group">
															      <p class="control-label col-sm-3">Name of Group Lead:</p>
															      <div class="col-sm-8">
															      <p class="font-color"><%=dbgroupleadernamee %></p>
															      </div>
															      </div>
															      <%
															      if(siggrouptype.equals("Association with Industry"))
															      {%>
															      <div class="form-group">
															      <p class="control-label col-sm-3">SIG Group Type:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=siggrouptype %></p>
															      </div>
															    </div> 
															    <div class="form-group">
															      <p class="control-label col-sm-3">Industry Name:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=dbindustryname %></p>
															      </div>
															    </div> 
															      <%}else if(siggrouptype.equals("Under Academic")) {%>
															      <div class="form-group">
															      <p class="control-label col-sm-3">SIG Group Type:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=siggrouptype %></p>
															      </div>
															    </div> 
															     <div class="form-group">
															      <p class="control-label col-sm-3">Academic Name:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=dbacademicnamee %></p>
															      </div>
															    </div> 
															      
															      <%}else{%>
															    	  <div class="form-group">
																      <p class="control-label col-sm-3">SIG Group Type:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=siggrouptype %></p>
																      </div>
															           <%}%>
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
															      <p class="control-label col-sm-3">Address of SIG Leader:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=dbaddressofsigleader %></p>
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
															        <p class="font-color"><%=pincode %></p>
															      </div>
															    </div>
															     <div class="form-group">
															      <p class="control-label col-sm-3"> Verified:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=dbregiverification %></p>
															      </div>
															    </div>
															     <div class="form-group">
															      <p class="control-label col-sm-3">Registration Status:</p>
															      <div class="col-sm-8">
															        <p class="font-color"><%=dbregistrationstatus %></p>
															      </div>
															    </div><hr>
											                  <%} %>
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
																        <a data-toggle="collapse" href="#personals"><b>Add SIG Coordinator  Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="personals" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="infoForm" action="./Sig_CordinatorDetail" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Add New Mobile No:</label>
																			    <input class="form-control input-md" id="inputsm" type="text" name="mobilenumber" ng-model="mobilenumber" ng-pattern="/^(\+\91{1,2}[- ])\d{10}$/" required/>
																			    <small>Format :+91 9855514371</small><br>
																			     <span style="color:red" ng-show="infoForm.mobilenumber.$dirty && infoForm.mobilenumber.$invalid">
														   					     <span ng-show="infoForm.mobilenumber.$error.required">Please specify your Mobile Number</span></span>
														                         <span ng-show="infoForm.mobilenumber.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed <br> Please enter valid format(+91 9855514371)</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add New Email Id:</label>
																			      <input class="form-control" id="focusedInput" type="text" value="" name="email" ng-model="email" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i" required/>
																				  <span style="color:red" ng-show="infoForm.email.$dirty && infoForm.email.$invalid">
																			      <span ng-show="infoForm.email.$error.required">Please specify your Email ID</span></span>
																				  <span ng-show="infoForm.email.$error.pattern" style="color:red">Please enter correct email address.</span>
														 
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add New Temporary Address</label>
																			    <textarea rows="" cols="" class="form-control" name="tempaddress" ng-model="address" required/></textarea>
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
																        <label class="control-label col-sm-8">SIG Coordinator  Details</label>
																      </div>
																    </div><hr>
																   
																      <div class="form-group">
																      <p class="control-label col-sm-3">SIG Group Leader Name:</p>
																      <div class="col-sm-8"><%=dbgroupleadernamee %></p>
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
																      <p class="control-label col-sm-3">SIG GroupLeader Address:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbaddressofsigleader %></p>
																      </div>
																    </div>
																    
																  </form>
															  </div><hr>
											      		</div>
											      	</div>
											    </div>
											    <!-- ----------------------------------------------------------------- -->
											    <div id="incubatee-details" class="tab-pane fade">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			 <div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#incubatee"><b>Add Incubatee Details</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="incubatee" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="incuForm" action="./AddIncubitee" method="post">
																			 <div class="form-group">
																			      <label for="inputsm">Name of Incubatee:</label>
																			      <input class="form-control" id="focusedInput" type="text" value="" ng-model="iname" ng-change="iname=iname.toUpperCase();" name="iname" ng-pattern="/^[a-zA-Z ]{1,200}$/" required>
																			      <span class="glyphicon glyphicon-user form-control-feedback"></span>
																			      <span style="color:red" ng-show="incuForm.iname.$dirty && incuForm.iname.$invalid">
																			      <span ng-show="incuForm.iname.$error.required">Please specify your First Name</span></span>
																			      <span style="color:red" ng-show="incuForm.iname.$error.pattern">Numeric and special Characters are Not Allowed</span>
																			    </div>
																			  <div class="form-group">
																			    <label for="inputsm">Add New Mobile No:</label>
																			    <input class="form-control input-md" id="inputsm" type="text" name="mobilenumber" ng-model="mobilenumber" ng-pattern="/^(\+\91{1,2}[- ])\d{10}$/" required/>
																			    <small>Format :+91 9855514371</small><br>
																			     <span style="color:red" ng-show="incuForm.mobilenumber.$dirty && incuForm.mobilenumber.$invalid">
														   					     <span ng-show="incuForm.mobilenumber.$error.required">Please specify your Mobile Number</span></span>
														                         <span ng-show="incuForm.mobilenumber.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed <br> Please enter valid format(+91 9855514371)</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Add New Email Id:</label>
																			      <input class="form-control" id="focusedInput" type="text" value="" name="email" ng-model="email" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i" required/>
																				  <span style="color:red" ng-show="incuForm.email.$dirty && incuForm.email.$invalid">
																			      <span ng-show="incuForm.email.$error.required">Please specify your Email ID</span></span>
																				  <span ng-show="incuForm.email.$error.pattern" style="color:red">Please enter correct email address.</span>
														 
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		        ng-disabled="incuForm.iname.$dirty && incuForm.iname.$invalid && incuForm.iname.$error.pattern||incuForm.email.$dirty && incuForm.email.$invalid && incuForm.email.$error.pattern || 
																			  		                     incuForm.mobilenumber.$dirty && incuForm.mobilenumber.$invalid && incuForm.mobilenumber.$error.pattern">Save</button>
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
																        <label class="control-label col-sm-8">SIG Incubitee Details</label>
																      </div>
																    </div><hr>
																    <%
																    String query4="select * from sig_addincubitee where sigId=?";
																    pst4=con.prepareStatement(query4);
																    pst4.setLong(1,sigid);
																    rs4=pst4.executeQuery();
																    long dbincubiteeId=0;
																    String dbincubittename="",dbincubiteemobilenumber="",dbincubitteemailid="";
																    while(rs4.next())
																    {
																    	dbincubiteeId=rs4.getLong("incubiteeId");
																    	dbincubittename=rs4.getString("incubittename");
																    	dbincubiteemobilenumber=rs4.getString("incubiteemobilenumber");
																    	dbincubitteemailid=rs4.getString("incubitteemailid");
																      %>
																       <a class="fload_right" data-toggle="modal" href="sig-edit-incubitee.jsp?dbincubiteeId=<%=dbincubiteeId%>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																     <div class="form-group">
																      <p class="control-label col-sm-3">Incubitee name</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%= dbincubittename%></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Mobile Number</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbincubiteemobilenumber %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">EmailId</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbincubitteemailid %></p>
																      </div>
																    </div><hr>
																   	
																  <%} %>
																    
																  </form>
															  </div>
											      		</div>
											      	</div>
											    </div>
											    <div id="milestone" class="tab-pane fade">
											      	<div class="panel panel-default card">
											      		<div class="panel-body">
											      			<div class="panel-group">
																  <div class="panel panel-default">
																    <div class="panel-heading">
																      <h4 class="panel-title">
																        <a data-toggle="collapse" href="#myskill"><b>Add SIG Milestones/ Achievements/ Success Stories</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="myskill" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="mileForm" action="./Milestone" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Date: (Format : MM/DD/YYYY)</label>
																				 <input class="form-control input-md" id="inputsm" type="text" name="dates" ng-model="dates" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
																				 <span style="color:red" ng-show="mileForm.dates.$dirty && mileForm.dates.$invalid">
																				 <span ng-show="mileForm.dates.$error.required">Please specify Date</span></span>
																			     <span ng-show="mileForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Milestone Name :</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="milestonename" ng-model="milestonename" ng-pattern="/^[a-zA-Z ]{1,200}$/" required/>
																			    <span style="color:red" ng-show="mileForm.milestonename.$dirty && mileForm.milestonename.$invalid">
																				 <span ng-show="mileForm.milestonename.$error.required">Please specify Milestone name</span></span>
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
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		        ng-disabled="mileForm.milestonename.$error.pattern||mileForm.dates.$error.pattern">
																			  		Save</button>
																			  
																			  </div>
																		</form> 
																	  </div>
																    </div>
																  </div>
															 </div> <hr>
															 <div class="list-group font">
															     <form class="form-horizontal" action="">
															        <div class="form-group">
																      <div class="col-sm-11">
																        <label class="control-label col-sm-8">SIG Milestones/ Achievements/ Success Stories</label>
																      </div>
																    </div><hr>
															 <%
															 String query2="select sigregi.sigId, sigmilestone.sigmilestoneId,sigmilestone.milestonedate,sigmilestone.milestonename,sigmilestone.milestonetype,sigmilestone.description from sigregi,sigmilestone where sigregi.sigId=sigmilestone.sigId and sigmilestone.sigId=?";
															 pst2=con.prepareStatement(query2);
															 pst2.setLong(1,sigid);
															 rs2=pst2.executeQuery();
															 long dbsigid=0,dbsigmilestoneId=0;
															 String dbmilestonedate="",dbmilestonename="",dbmilestonetype="",dbdescription="";
															 while(rs2.next())
															 {
																 dbsigid=rs2.getLong(1);
																 dbsigmilestoneId=rs2.getLong(2);
																 dbmilestonedate=rs2.getString(3);
																 dbmilestonename=rs2.getString(4);
																 dbmilestonetype=rs2.getString(5);
																 dbdescription=rs2.getString(6);
																 
																 %>
																   <a class="fload_right" data-toggle="modal" href="sig-edit-success.jsp?sigmilestoneId=<%=dbsigmilestoneId %>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																  <div class="form-group">
																      <p class="control-label col-sm-3">Date:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbmilestonedate %></p>
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
																        <p class="font-color"><%=dbdescription %></p>
																      </div>
																    </div><hr>
																 
															         <%} %>
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
																        <a data-toggle="collapse" href="#myskilldd"><b>Add Skill for Commercialization Zone</b><i class="fa fa-plus fload_right" style="font-size:20px"></i></a>
																      </h4>
																    </div>
																    <div id="myskilldd" class="panel-collapse collapse font">
																      <div class="panel-body font">
																		<form name="skillform" action="./AddSkillCommercialisation" method="post">
																			  <div class="form-group">
																			    <label for="inputsm">Title of Technology/ Innovation / Solution:</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="title" ng-model="title" ng-pattern="/^[a-zA-Z ]{1,200}$/" required/>
																			   <span style="color:red" ng-show="skillform.title.$dirty && skillform.title.$invalid">
																				 <span ng-show="skillform.title.$error.required">Please specify Technology name</span></span>
																			     <span ng-show="skillform.title.$error.pattern" style="color:red">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm">Leader Name of Faculty :</label>
																			    <input class="form-control input-sm" id="inputsm" type="text" name="lead" ng-model="lead" ng-pattern="/^[a-zA-Z ]{1,200}$/" required/>
																			     <span style="color:red" ng-show="skillform.lead.$dirty && skillform.lead.$invalid">
																				 <span ng-show="skillform.lead.$error.required">Please specify Leader name</span></span>
																			     <span ng-show="skillform.lead.$error.pattern" style="color:red">Numeric and special Characters are Not Allowed</span>
																			  </div>
																			 <div class="form-group">
																			    <label for="inputsm"> Number Of Faculty Member:</label>
																			  <input class="form-control input-sm" id="inputsm" type="text" name="member" ng-model="member" ng-pattern="numberonly" required/>
																			     <span style="color:red" ng-show="skillform.member.$dirty && skillform.member.$invalid">
																				 <span ng-show="skillform.member.$error.required">Please specify Number Of Faculty Member</span></span>
																			     <span ng-show="skillform.member.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed</span>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Add Number of Student:</label>
																			   <input class="form-control input-sm" id="inputsm" type="text" name="students" ng-model="students" ng-pattern="numberonly" required/> 
																			    <span style="color:red" ng-show="skillform.students.$dirty && skillform.students.$invalid">
																				 <span ng-show="skillform.students.$error.required">Please specify Number Of Student</span></span>
																			     <span ng-show="skillform.students.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed</span>
																			  </div>
																			  <div class="form-group">
																			    <label for="inputsm">Brief Description About Technology:</label>
																			   <textarea rows="" cols="" class="form-control" name="description" ng-model="description" required></textarea>
																			  </div>
																			  <div class="fload_right">
																			  		<button type="submit" class="btn btn-info btn-md active"
																			  		
																			  		 ng-disabled="skillform.title.$error.pattern||skillform.title.$error.pattern|| skillform.lead.$error.pattern||skillform.lead.$error.pattern||skillform.member.$error.pattern||skillform.member.$error.pattern|| skillform.students.$error.pattern||skillform.students.$error.pattern">Save</button>
																			  
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
																        <label class="control-label col-sm-8"> Commercialization Zone</label>
																      </div>
																    </div><hr>
																    
																  
																	  <%
																	  
																	  String query3="select sigregi.sigId, sigtechnologyskill.techId,sigtechnologyskill.title,sigtechnologyskill.leadfaculty,sigtechnologyskill.facultymember,sigtechnologyskill.memberofstudent,sigtechnologyskill.description from sigregi,sigtechnologyskill where sigregi.sigId=sigtechnologyskill.sigId and sigregi.sigId=?";
																	  pst3=con.prepareStatement(query3);
																	  pst3.setLong(1,sigid); 
																	  rs3=pst3.executeQuery();
																	  long sigid=0,dbmemberofstudent=0,dbtechid=0;
																	  String dbtitle="",dbleadfaculty="",dbfacultymember="",dbdescriptionn="";
																	  while(rs3.next())
																	  {
																		  sigid=rs3.getLong(1);
																		  dbtechid=rs3.getLong(2);
																		  dbtitle=rs3.getString(3);
																		  dbleadfaculty=rs3.getString(4);
																		  dbfacultymember=rs3.getString(5);
																		  dbmemberofstudent=rs3.getLong(6);
																		  dbdescriptionn=rs3.getString(7);
																		  
																		  %>
																		      <a class="fload_right" data-toggle="modal" href="sig-edit-skill.jsp?techid=<%=dbtechid %>"><i class="fa fa-edit fload_right" style="font-size:20px"></i></a>
																		    <div class="form-group">
																      <p class="control-label col-sm-3">Title of Technology / Innovation / Solution:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbtitle %></p>
																      </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Lead Faculty:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbleadfaculty %></p>
																      </div>
																        <div class="form-group">
																      <p class="control-label col-sm-3">Faculty Member:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbfacultymember %></p>
																      </div>
																    </div>
																    </div>
																    <div class="form-group">
																      <p class="control-label col-sm-3">Member of Student:</p>
																      <div class="col-sm-8">
																        <p class="font-color"><%=dbmemberofstudent %></p>
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
