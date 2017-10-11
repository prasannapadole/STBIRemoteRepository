<%@page import="com.incubation.incubation.view.all.details.IncubationViewAllDetails"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myDashboard" ng-controller="dashboard">
	 <head>
	    <title>Incubation View All Details</title>
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
								if(IncubationViewAllDetails.checkUser(dbideaid))
								{
								String query3="select ideasubmit.ideaid,user_ideasubmit_updateprogress.ideaupdateprogressId,user_ideasubmit_updateprogress.currentdate,user_ideasubmit_updateprogress.milestonename,user_ideasubmit_updateprogress.milestonetype,user_ideasubmit_updateprogress.milestonedescription,user_ideasubmit_updateprogress.ideaid from ideasubmit,user_ideasubmit_updateprogress where (ideasubmit.ideaid=user_ideasubmit_updateprogress.ideaid) and (user_ideasubmit_updateprogress.ideaid=?)";
								 //String query3="select * from user_ideasubmit_updateprogress"; 			
								  pst3=con.prepareStatement(query3);
							      pst3.setLong(1,dbideaid);
						          rs3=pst3.executeQuery();
							      long dbideaidd=0 ,dbideaupdateprogressId=0,dbdbideaupdateprogressideaid=0;
							     String dbcurrentdate="",dbmilestonename="",dbmilestonetype="",dbmilestonedescription="";
							     while(rs3.next())
							     {
							    
							    	 dbideaidd=rs3.getLong(1);
							    	 dbideaupdateprogressId=rs3.getLong(2);
							    	 dbcurrentdate=rs3.getString(3);
							    	 dbmilestonename=rs3.getString(4);
							    	 dbmilestonetype=rs3.getString(5);
							    	 dbmilestonedescription=rs3.getString(6);
							    	 dbdbideaupdateprogressideaid=rs3.getLong(7);
							    		 %>
							    		 
							     <div class="user-idea-details">
									<div class="row">
			                			<div class="col-sm-12">
			                				<label class="name-heading"><%=dbmilestonename %></label>
			                				<label class="name-type"><%=dbmilestonetype %></label>
			                				<br><small class="date"><%=dbcurrentdate %></small>
			                			</div>
			                			<div class="col-sm-12">
			                				<p class="informations font-containt"><%=dbmilestonedescription %></p>
			                			</div>
			                		</div>
								</div><hr>
							
								<%}} else
								       {%>
								 <div class="user-idea-details">
									<div class="row">
			                			<div class="col-sm-12">
			                					<p class="name-heading text-center" style="color:red" ><b>Record Not Available</b></p>
			                				
			                		</div></div></div>
						           <hr>
								 <%	}%>
								
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
									<a class="btn btn-info btn-md active fload_right" href="incubation-dashboard.jsp">Back</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
