<%@page import="com.user.begin.view.all.details.BeginViewAllDetails"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myDashboard" ng-controller="dashboard">
	 <head>
	    <title>Begin View All Details</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/begin-view-all-details.css">
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
		<%
		
		long ideaid=Long.parseLong(request.getParameter("dbideaid"));
		String query1="select * from ideasubmit where ideaid=? ";
		pst1=con.prepareStatement(query1);
		pst1.setLong(1,ideaid);
		rs1=pst1.executeQuery();
		long dbideaid=0;
		String dbtitle="",dbenterkeywords="",dbkeyusers="",dbmaxuser="",dbtargetmarket="",dbideadescription="",dbsigname="",dbinstuname="",dbincubationname="",dbidearegidate="",dbstatusofidea="";
		while(rs1.next())
		{
			dbideaid=rs1.getLong("ideaid");
			dbtitle=rs1.getString("titlename");
			dbenterkeywords=rs1.getString("enterkeywords");
			dbkeyusers=rs1.getString("keyusers");
			dbmaxuser=rs1.getString("maxuser");
			dbtargetmarket=rs1.getString("targetmarket");
			dbideadescription=rs1.getString("ideadescription");
			dbsigname=rs1.getString("signame");
		    dbinstuname=rs1.getString("instuname");
			dbincubationname=rs1.getString("incubationname");
			dbidearegidate=rs1.getString("idearegidate");
			dbstatusofidea=rs1.getString("statusofidea");
			}
		  %>
		<div class="containers" >
			<div class="top">
			   <div class="panel panel-default card ">
					<div class="panel-body">
						<div class="panel panel-default panels">
							<div class="panel-body">
								<div class="idealabels">
									<label >My Idea Details</label>
								</div>
								<div class="sentence">
									<p>This idea is under registration of applicable <b class="bold">Intellectual Property (IP) </b>through Samruddhi TBI Foundation.<br> The protection is apply in the name of Inventor / Originator of this idea.</p>
								</div>
								<div>
								<div class="user-idea-details">
										<label>IDEA ID</label>
										<p class="font-containt"><%=dbideaid %></p>
									</div>
									<div class="user-idea-details">
										<label>Title of your Idea / Innovation / Product / Solution</label>
										<p class="font-containt"><%=dbtitle %></p>
									</div>
									<div class="user-idea-details">
										<label>Enter TEN key words that are closely related to your idea</label>
										<p class="font-containt"><%=dbenterkeywords %></p>
									</div>
									<div class="user-idea-details">
										<label>Who are KEY users of your Product / Solution</label>
										<p class="font-containt"><%=dbkeyusers %></p>
									</div>
									<div class="user-idea-details">
										<label>Maximum number of KEY users of solution/ Product in India</label>
										<p class="font-containt"><%= dbmaxuser%></p>
									</div>
									<div class="user-idea-details">
										<label>Target Market (Maximum possible value for Sale)</label>
										<p class="font-containt"><%=dbtargetmarket %></p>
									</div>
									<div class="user-idea-details">
										<label>Idea Description</label>
										<p class="font-containt"><%=dbideadescription %></p>
									</div>
									
									<div class="user-idea-details">
										<label>SIG Member</label>
										<p class="font-containt"><%=dbsigname %></p>
									</div>
									<div class="user-idea-details">
										<label>Institute Member</label>
										<p class="font-containt"><%=dbinstuname %></p>
									</div>
									<div class="user-idea-details">
										<label>Incubation Member</label>
										<p class="font-containt"><%=dbincubationname %></p>
									</div>
									<div class="user-idea-details">
										<label>Date(MM/dd/YYYY)</label>
										<p class="font-containt"><%=dbidearegidate %></p>
									</div>
									<div class="user-idea-details">
										<label>Status</label>
										<p class="font-containt"><%=dbstatusofidea %></p>
									</div>
								</div>
								<hr>
								<!---------------------------------------------------------------------------------------------------------->
								
								<div class="idealabels">
									<label >MY PROGRESS / MILESTONE</label>
								</div>
								<%
								if(BeginViewAllDetails.checkUser(ideaid))
								{
									String query2="select * from user_ideasubmit_updateprogress where userId=? and ideaid=? ";
									pst2=con.prepareStatement(query2);
								    pst2.setLong(1,userid);
								    pst2.setLong(2,ideaid );
								    rs2=pst2.executeQuery();
									long dbideaupdateprogressId=0;
									String dbcurrentdate="",dbmilestone="",dbmilestontype="",dbmilestonedesc="";
									while(rs2.next())
									{
										dbideaupdateprogressId=rs2.getLong("ideaupdateprogressId");
										dbcurrentdate=rs2.getString("currentdate");
										dbmilestone=rs2.getString("milestonename");
										dbmilestontype=rs2.getString("milestonetype");
										dbmilestonedesc=rs2.getString("milestonedescription");%>
										
									<div class="user-idea-details">
										<div class="row">
				                			<div class="col-sm-12">
				                				<label class="name-heading"><%=dbmilestone %></label>
				                				<label class="name-type"><%=dbmilestontype %></label>
				                				<br><small class="date"><%=dbcurrentdate %></small>
				                			</div>
				                			<div class="col-sm-12">
				                				<p class="informations font-containt"><%=dbmilestonedesc %></p>
				                			</div>
				                		</div>
									</div><hr>
									
									<%}}else
								       {%>
								 <div class="user-idea-details">
									<div class="row">
			                			<div class="col-sm-12">
			                					<p class="name-heading text-center" style="color:red" ><b>Record Not Available</b></p>
			                			</div></div></div><hr>
						          
								     <%} %>
								<!---------------------------------------------------------------------------------------------------------->
								<div class="idealabels">
									<label >MY RATING</label>
								</div>
								 <div class="list-group font font-containt">
								    <form class="form-horizontal">
									    <div class="form-group">
									      <p class="control-label col-sm-5">General:</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									    <div class="form-group">
									      <p class="control-label col-sm-5">Finance Support:</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									    <div class="form-group">
									      <p class="control-label col-sm-5">Infrastructure Support:</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									    <div class="form-group">
									      <p class="control-label col-sm-5">Mentoring Support (Technical):</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									     <div class="form-group">
									      <p class="control-label col-sm-5">Business Plan Support:</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									    <div class="form-group">
									      <p class="control-label col-sm-5">Marketing strategy:</p>
									       <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									     <div class="form-group">
									      <p class="control-label col-sm-5">IT Support (Protection):</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									     <div class="form-group">
									      <p class="control-label col-sm-5">Company Formation Support:</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									     <div class="form-group">
									      <p class="control-label col-sm-5">Techno - Legal Support:</p>
									      <div class="col-sm-7 rating-top">
									        <div ng-init="rating = star.rating + 1"></div>
	    									<div class="star-rating" star-rating rating-value="rating" data-max="5" on-rating-selected="rateFunction(rating)"></div>
									      </div>
									    </div>
									  </form>
								  </div>
								<hr>
								<div class="idealabels">
									<label >MY PITCH</label>
								</div>
								<div class="user-idea-details">
									<form class="form-horizontal">
									   <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div>
									   <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div>
									   <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div>
									   <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div>
									   <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div>
									   <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div> <div class="form-group">
									    <label class="col-sm-2 control-label">Focused</label>
									    <div class="col-sm-10">
									      <input class="form-control" id="focusedInput" type="text" value="Click to focus">
									    </div>
									  </div>
									  
									</form> 
								</div>
								<div>
									<a class="btn btn-info btn-md active fload_right" href="begin-dashboard.jsp">Back</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
