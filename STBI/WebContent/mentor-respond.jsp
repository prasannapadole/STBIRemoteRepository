<%@page import="com.dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="mentorDashboard" ng-controller="mentorctrldashboard">
 <head>
	    <title>Mentor View Idea</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/userviewidea.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
	    <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.2.js"></script>
	    <script src="js/mentor-dashboard.js"></script>
	    <script src="js/city-navbar.js"></script>
    </head>
    <%   Connection con;
    PreparedStatement ps,pst,pst1;
    ResultSet r,rs,rs1;
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
 	  response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	   	  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    session=request.getSession();
    String mentoremail=(String)session.getAttribute("mentoremail");
    
    try
      {
    if(mentoremail.equals(null)|| mentoremail=="")
      {
  	   response.sendRedirect("mentor-login.jsp");
	 //RequestDispatcher rd=request.getRequestDispatcher("/begin_login.jsp");
	 // rd.forward(request,response);
	    }
     else
     {}
    }
  catch(Exception e)
     {
  	   response.sendRedirect("mentor-login.jsp");
// RequestDispatcher rd=request.getRequestDispatcher("/begin_login.jsp");
// rd.forward(request,response);
 }
    long ideaid=Long.parseLong(request.getParameter("ideaid"));
    con=Dao.getConnection();
    String query1="select mentorId,firstname,middlename,lastname from mentor where emailid=?";
    ps=con.prepareStatement(query1);
    ps.setString(1,mentoremail);
    r=ps.executeQuery();
    long mentorid=0;
    String dbfname1="",dbmname1="",dblname1="";
    while(r.next())
    {
    	mentorid=r.getLong(1);	
    	dbfname1=r.getString(2);
    	dbmname1=r.getString(3);
    	dblname1=r.getString(4);
    }
    session.setAttribute("mentorid",mentorid);
    
    String query="select * from ideasubmit where ideaid=?";
    pst=con.prepareStatement(query);
    pst.setLong(1,ideaid);
    rs=pst.executeQuery();
    long dbideaid=0,dbuserid=0;
    String dbtitle="",dbenterkeywords="",dbkeyusers="",dbmaxusers="",dbtargetmarket="",dbideadesc="",dnsigname="",dninstitutename="",dbincubationname="",dbidearegidate="",dbstatusofidea="";
    while(rs.next())
        {
    	dbideaid=rs.getLong("ideaid");
    	dbtitle=rs.getString("titlename");
    	dbenterkeywords=rs.getString("enterkeywords");
    	dbkeyusers=rs.getString("keyusers");
    	dbmaxusers=rs.getString("maxuser");
    	dbtargetmarket=rs.getString("targetmarket");
    	dbideadesc=rs.getString("ideadescription");
    	dnsigname=rs.getString("signame");
    	dninstitutename=rs.getString("instuname");
    	dbincubationname=rs.getString("incubationname");
    	dbidearegidate=rs.getString("idearegidate");
    	dbstatusofidea=rs.getString("statusofidea");
    	}
   
   %>
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
					                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle-o fa-icons"><br><span class="icon-fonts"><%=dbfname1 %> <%=dblname1 %></span></i>
					               		<ul class="dropdown-menu">
								          <li><a href="#">
													<table class="table ">
													    <tbody>
													      <tr>
													        <td>Registration Id</td>
													        <td><%=mentorid %></td>
													      </tr>
													      <tr>
													        <td>Name</td>
													        <td><%=dbfname1 %> <%=dbmname1 %> <%=dblname1 %></td>
													      </tr>
													      <tr>
													        <td>Email Id</td>
													        <td><%=mentoremail %></td>
													      </tr>
													      <tr>
													        <td colspan="2" style="text-align:center;"><a href="MentorLogout">SignOut</a></td>
													     
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
        <body>
	  
		<div class="container top">
			<div class="panel-group">
			    <div class="panel panel-info">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbideaid %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbtitle %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbidearegidate %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id">View</a>
			             <a href="mentor-dashboard.jsp" class="idea-id">Back</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse">
			        <div class="panel-body">
			        <div class="user-idea-details">
							<label>Idea Id</label>
							<p class="idea-data-width"><%=dbideaid %></p>
						</div>
						
						<div class="user-idea-details">
							<label>Title of your Idea / Innovation / Product / Solution</label>
							<p class="idea-data-width"><%=dbtitle %></p>
						</div>
						<div class="user-idea-details">
							<label>Enter TEN key words that are closely related to your idea</label>
							<p class="idea-data-width"><%=dbenterkeywords %></p>
						</div>
						<div class="user-idea-details">
							<label>Who are KEY users of your Product / Solution</label>
							<p class="idea-data-width"><%=dbkeyusers %></p>
						</div>
						<div class="user-idea-details">
							<label>Maximum number of KEY users of solution/ Product in India</label>
							<p class="idea-data-width"><%=dbmaxusers %></p>
						</div>
						<div class="user-idea-details">
							<label>Target Market (Maximum possible value for Sale)</label>
							<p class="idea-data-width"><%=dbtargetmarket %></p>
						</div>
						<div class="user-idea-details">
							<label>Idea Description</label>
							<p class="idea-data-width"><%=dbideadesc %></p>
						</div>
						<div class="user-idea-details">
							<label>SIG Name</label>
							<p class="idea-data-width"><%=dnsigname %></p>
						</div>
						<div class="user-idea-details">
							<label>Institute Name</label>
							<p class="idea-data-width"><%=dninstitutename %></p>
						</div>
						<div class="user-idea-details">
							<label>Incubation Name</label>
							<p class="idea-data-width"><%=dbincubationname %></p>
						</div>
						<div class="user-idea-details">
							<label>Date(MM/dd/YYYY)</label>
							<p class="idea-data-width"><%=dbidearegidate %></p>
						</div>
						<div class="user-idea-details">
							<label>Status</label>
							<p class="idea-data-width"><%=dbstatusofidea %></p>
						</div>
					</div>
			      </div>
			    </div>
			  </div>
			  <!----------------------------------------------------------- End of ideas -------------------------------------------->
			  <form>
			    <div class="panel panel-default card panels">
			    	<div class="panel-body">
			    	    <h1 class="text-center">View Response</h1>
			    		<div class="user-idea-details">
			    			<select class="form-control" ng-model="response">
			    			    <option value="" ng-show="false"> Select</option>
			    				<option value="Incubation and SME General Support">Incubation and SME General Support</option>
			    				<option value="IT Support">IT Support</option>
			    				<option value="Technology / R & D Support">Technology / R & D Support</option>
			    				<option value="Techno - Legal Support">Techno - Legal Support (IP Protection)</option>
			    				<option value="Co-working Space Support">Co-working Space Support</option>
			    				<option value="Makers Space / Fab Lab Support">Makers Space / Fab Lab Support</option>
			    				<option value="Business Plan Support">Business Plan Support</option>
			    				<option value="Market Research Support">Market Research Support</option>
			    				<option value="Funds and Finance Support">Funds and Finance Support</option>
			    				<option value="Company Formation Support">Company Formation Support</option>
			    				<option value="Accounting and Taxation Support">Accounting and Taxation Support</option>
			    				<option value="Design Support (Logo, Branding, Pro motion Material)">Design Support (Logo, Branding, Pro motion Material)</option>
		    					<option value="Product Testing and Certification">Product Testing and Certification</option>
			    				<option value="Stress Management Support">Stress Management Support</option>
			    				<option value="Product Development Support">Product Development Support</option>
			    				<option value="ISO System and Certification Support">ISO System and Certification Support</option>
			    			</select>
			    		</div>
			    		<div class="user-idea-details">
						    <div class="media-left">
							      <img src="logo/avtar.png" class="media-object" style="width:45px">
							    </div>
							    <div class="media-body">
							      <h4 class="media-heading"><b>Incubation and SME General Support</b> <small><i>Posted on February 19, 2016</i></small></h4>
							      <p class="idea-data-width">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							      <!-- Nested media object --><hr>
							      <div class="media replay-user">
							        <div class="media-left">
							          <img src="logo/avtar.png" class="media-object" style="width:45px">
							        </div>
							        <div class="media-body">
							          <h4 class="media-heading"><b>Incubation and SME General Support </b><small><i>Posted on February 19, 2016</i></small></h4>
							          <p class="idea-data-width">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									  <hr>	
							        </div>
							      </div>
							    </div><hr>
						    	
						    	
						    	<textarea rows="" cols="" class="form-control" name="generel" ng-model="generel" required/></textarea><br>
						    	<div class="row">
						    	    <div class="col-sm-7"></div>
						    	    <div class="col-sm-3">
						    	    	<fieldset class="rating">
										    <input type="radio" id="star5" name="rating" ng-model="value" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
										    <input type="radio" id="star4" name="rating" ng-model="value" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
										    <input type="radio" id="star3" name="rating" ng-model="value" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
										    <input type="radio" id="star2" name="rating" ng-model="value" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
										    <input type="radio" id="star1" name="rating" ng-model="value" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
										</fieldset>
										<p class="norating">{{value}}/5 Rating</p>
								    </div>
								    <div class="col-sm-2">
								    	<button type="submit" class="btn btn-info btn-sm active ">Reply</button>
								    </div>
								</div>
						   </div>
				   		</div>
			 	    </div>
	    	  </form>
			</div>
	</body>
</html>
