<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  ng-app="sigDashboard" ng-controller="sigctrldashboard">
 <head>
	    <title>SIG View Idea</title>
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
	    <script src="js/city-navbar.js"></script>
	    <script src="js/sig-dashboard.js"></script>
    </head>
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
		<%
		long ideaid=Long.parseLong(request.getParameter("dbideaid"));
		String query1="select * from ideasubmit where ideaid=?";
		pst=con.prepareStatement(query1);
		pst.setLong(1,ideaid);
		long dbideaid=0;
		Blob dbattachedfile;
		String dbtitlename="",dbenterkeywords="",dbkeyusers="",dbmaxuser="",dbtargetmarket="",dbideadescription="",dbsigname="",dbinstuname="",dbincubationname="",dbidearegidate="",dbstatusofidea="";
		rs=pst.executeQuery();
		while(rs.next())
		{
			dbideaid=rs.getLong("ideaid");
			dbtitlename=rs.getString("titlename");
			dbenterkeywords=rs.getString("enterkeywords");
			dbkeyusers=rs.getString("keyusers");
			dbmaxuser=rs.getString("maxuser");
			dbtargetmarket=rs.getString("targetmarket");
			dbideadescription=rs.getString("ideadescription");
			dbsigname=rs.getString("signame");
			dbinstuname=rs.getString("instuname");
			dbincubationname=rs.getString("incubationname");
			dbattachedfile=rs.getBlob("attachedfile");
			dbidearegidate=rs.getString("idearegidate");
			dbstatusofidea=rs.getString("statusofidea");
			}%>
		
		<div class="container top" >
			<div class="panel-group">
			    <div class="panel panel-info">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbideaid %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%= dbtitlename%></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%= dbidearegidate%></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbstatusofidea %></a>
			             <a  href="sig-dashboard.jsp" class="idea-id" style="color:navy">Back</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse">
			        <div class="panel-body">
			        <div class="user-idea-details">
							<label>IDEA ID</label>
							<p class="idea-data-width"><%=dbideaid %></p>
						</div>
						<div class="user-idea-details">
							<label>Title of your Idea / Innovation / Product / Solution</label>
							<p class="idea-data-width"><%=dbtitlename %></p>
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
							<p class="idea-data-width"><%=dbmaxuser %></p>
						</div>
						<div class="user-idea-details">
							<label>Target Market (Maximum possible value for Sale)</label>
							<p class="idea-data-width"><%=dbtargetmarket %></p>
						</div>
						<div class="user-idea-details">
							<label>Idea Description</label>
							<p class="idea-data-width"><%=dbideadescription %></p>
						</div>
						<div class="user-idea-details">
							<label>My SIG</label>
							<p class="idea-data-width"><%=dbsigname %></p>
						</div>
						<div class="user-idea-details">
							<label>MY INSTITUTE</label>
							<p class="idea-data-width"><%=dbinstuname %></p>
						</div>
						<div class="user-idea-details">
							<label>MY INCUBATION</label>
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
			 <ul class="nav nav-tabs navs">
				    <li class="active"><a data-toggle="tab" href="#new-request-submit" class="tab-font-grorgia">Submit New Request</a></li>
				    <li><a data-toggle="tab" href="#response-of-request" class="tab-font-grorgia">View Response</a></li>
			  </ul>
			  <div class="tab-content">
				   <div id="new-request-submit" class="tab-pane fade in active">
					    <div class="panel panel-default card panels">
					    	<div class="panel-body panels">
					    	    <form name="requestForm">
						    		<div class="user-idea-details">
						    			<select class="form-control" ng-model="gender" required/>
						    			    <option value="" ng-show="false"> Select</option>
						    				<option>Incubation and SME General Support</option>
						    				<option>IT Support</option>
						    				<option>Technology / R & D Support</option>
						    				<option>Techno - Legal Support (IP Protection)</option>
						    				<option>Co-working Space Support</option>
						    				<option>Makers Space / Fab Lab Support</option>
						    				<option>Business Plan Support</option>
						    				<option>Market Research Support</option>
						    				<option>Funds and Finance Support</option>
						    				<option>Company Formation Support</option>
						    				<option>Accounting and Taxation Support</option>
						    				<option>Design Support (Logo, Branding, Pro motion Material)</option>
						    				
						    				<option>Product Testing and Certification</option>
						    				<option>Stress Management Support</option>
						    				<option>Product Development Support</option>
						    				<option>ISO System and Certification Support</option>
						    			</select>
						    		</div>
						    		<div class="user-idea-details">
						    			<textarea rows="6" cols="" class="form-control" name="requestdetails" ng-model="requestdetails" required/></textarea>
						    		</div>
						    		<div class="user-idea-details">
										<button type="submit" class="btn btn-info btn-md active fload_right">Submit</button>
						    		</div>
						    	</form>
					    	</div>
					    </div>
				  </div>
				  <div id="response-of-request" class="tab-pane">
				     <form>
					    <div class="panel panel-default card panels">
					    	<div class="panel-body">
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
											<hr>
									      <!-- Nested media object -->
									      <div class="media replay-user">
									        <div class="media-left">
									          <img src="logo/avtar.png" class="media-object" style="width:45px">
									        </div>
									        <div class="media-body">
									          <h4 class="media-heading"><b>Incubation and SME General Support </b><small><i>Posted on February 19, 2016</i></small></h4>
									          <p class="idea-data-width">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									        </div><hr>
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
		    </div>
	    </div>
	</body>
</html>		
