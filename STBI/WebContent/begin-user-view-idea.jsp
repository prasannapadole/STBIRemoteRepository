<%@page import="com.dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myDashboard" ng-controller="dashboard">
 <head>
	    <title>Begin View Idea</title>
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
	    <script src="js/dashboard.js"></script>
    </head>
	<body>
	 <%!
	
	Connection con=null;
	String query,query1;
    PreparedStatement pst,pst1,pst2,pst3;
    ResultSet rs,rs1,rs2,rs3;
    %>
	   <% response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
 	      response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
     	  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
          response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
			session=request.getSession();
			String useremail=(String)session.getAttribute("useremail");
			long ideaidd=Long.parseLong(request.getParameter("ideaid"));
			try
			{
			if(useremail.equals(null)|| useremail=="")
			{
				response.sendRedirect("begin-login.jsp");
			//RequestDispatcher rd=request.getRequestDispatcher("/begin-login.jsp");
			//rd.forward(request,response);
			}
			else
			{}
			}
			catch(Exception e)
			{
			//RequestDispatcher rd=request.getRequestDispatcher("/begin-login.jsp");
			//rd.forward(request,response);
				response.sendRedirect("begin-login.jsp");
			}
			con=Dao.getConnection();
			query1="select userId,firstname,middlename,lastname from user where emailid=?";
			pst1=con.prepareStatement(query1);
			pst1.setString(1,useremail);
			rs1=pst1.executeQuery();
			long userid=0;
			String dbfname1="",dbmname1="",dblanme1="";
			while(rs1.next())
			{
			userid=rs1.getLong(1);
			dbfname1=rs1.getString(2);
			dbmname1=rs1.getString(3);
			dblanme1=rs1.getString(4);
			}
			
			
			String query="select * from ideasubmit where ideaid=?";
			pst=con.prepareStatement(query);
			pst.setLong(1,ideaidd);
			rs=pst.executeQuery();
			long dbideaid=0,dbuserid=0;
			String dbtitle="",dbenterkeywords="",dbkeyusers="",dbmaxusers="",dbtargetmarket="",dbideadesc="",dbsigname="",dbinstitutename="",dnincubationname="",dbidearegidate="",dbstatusofidea="";
			while(rs.next())
			    {
				dbideaid=rs.getLong("ideaid");
				dbtitle=rs.getString("titlename");
				dbenterkeywords=rs.getString("enterkeywords");
				dbkeyusers=rs.getString("keyusers");
				dbmaxusers=rs.getString("maxuser");
				dbtargetmarket=rs.getString("targetmarket");
				dbideadesc=rs.getString("ideadescription");
				dbsigname=rs.getString("signame");
				dbinstitutename=rs.getString("instuname");
				dnincubationname=rs.getString("incubationname");
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
		<div class="container top" >
			<div class="panel-group">
			    <div class="panel panel-info">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbideaid %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbtitle %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id"><%=dbidearegidate %></a>
			          <a data-toggle="collapse" href="#collapse1" class="idea-id">View</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse">
			        <div class="panel-body">
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
							<label>SIG Member</label>
							<p class="idea-data-width"><%=dbsigname %></p>
						</div>
						<div class="user-idea-details">
							<label>Institute Member</label>
							<p class="idea-data-width"><%=dbinstitutename %></p>
						</div>
						<div class="user-idea-details">
							<label>Incubation Member</label>
							<p class="idea-data-width"><%=dnincubationname %></p>
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
				    <li><a data-toggle="tab" href="#offer" class="tab-font-grorgia">Startup Partnership Opportunity</a></li>
			  </ul>
			  <div class="tab-content">
				   <div id="new-request-submit" class="tab-pane fade in active">
					    <div class="panel panel-default card panels">
					    	<div class="panel-body panels">
					    	    <form name="requestForm" action="./UserRequestSupportPage" method="post">
						    		<div class="user-idea-details">
						    			<select class="form-control" ng-model="gender" name="support">
						    			<option value="" ng-show="false"> Select</option>
						    			<option value="Incubation and SME General Support">Incubation and SME General Support</option>
					    				<option value="IT Support">IT Support</option>
					    				<option value="Technology / R and D Support">Technology / R and D Support</option>
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
						    		<input type="hidden" name="ideaid" value="<%=dbideaid %>">
						    		 <input type="hidden" name="userid" value="<%=userid %>">
						    		<div class="user-idea-details">
						    			<textarea rows="6" cols="" class="form-control" name="requestdetails" ng-model="requestdetails" required/></textarea>
						    		</div>
						    	
						    		<div class="user-idea-details">
						    			<a button class="btn btn-warning active fload_right" href="begin-dashboard.jsp">Back</a>
										<button type="submit" class="btn btn-info btn-md active fload_right">Submit</button>
						    		</div>
						    	</form>
					    	</div>
					    </div>
				  </div>
				  <div id="response-of-request" class="tab-pane">
				     
					    <div class="panel card">
					    	<div class="panel-body">
					    		<div class="user-idea-details">
					    		<%
					    		String supp=(String)request.getParameter("supporttypejs");
									System.out.println("-----------------Support Type:"+supp+"------------------");
									String supp2="Select";
									if(supp!=null)
									{
										supp2=supp;
									}
									
					    		%>
					    			<select class="form-control" ng-model="response" onchange="support()" id="iresp" name="resp">
					    			    <option value="" ng-show="false"> <%=supp2 %></option>
					    				<option value="Incubation and SME General Support">Incubation and SME General Support</option>
					    				<option value="IT Support">IT Support</option>
					    				<option value="Technology / R and D Support">Technology / R and D Support</option>
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
					    		<%
					    		String getName="SELECT firstname,lastname FROM user WHERE userId=?";
								pst1=con.prepareStatement(getName);
														pst1.setLong(1, userid);
														rs1=pst1.executeQuery();
														String fname="",lname="",fullname="";
														while(rs1.next())
														{
															fname=rs1.getString(1);
															lname=rs1.getString(2);
															fullname=fname+" "+lname;
														}
														
														String getMentorName="select designaion from supportmentors where supporttype=?";
														pst3=con.prepareStatement(getMentorName);
														pst3.setString(1, supp);
														rs3=pst3.executeQuery();
														String MentorName="";
														while(rs3.next())
														{
															MentorName=rs3.getString(1);
														}
					    		
					    		String getRequestDetails="select chatid,requestmsg,responsemsg,date,responsedate from chat where ideaid=? and supporttype=?";
									pst2=con.prepareStatement(getRequestDetails);
									pst2.setLong(1, ideaidd);
									pst2.setString(2, supp);
									rs2=pst2.executeQuery();
									long chatid=0;
									String requestMsg="",responseMsg="",date="",responseDate="";
									%>
			  	<%
			  	while(rs2.next())
				{
					chatid=rs2.getLong(1);
					requestMsg=rs2.getString(2);
					responseMsg=rs2.getString(3);
					date=rs2.getString(4);
					responseDate=rs2.getString(5);
					int flag=0;
			  	%>
	  	           <form name="" action="">
	  	           <%
	  	           if(requestMsg!=null)
	  	           {
	  	        	%>
	  	        	<div class="media-left">
					      <img src="logo/avtar.png" class="media-object" style="width:45px">
					    </div>
					    <div class="media-body">
					      <h4 class="media-heading"><b><%=fullname %></b> <small><i> Posted on <%=date %></i></small></h4>
					      <p class="idea-data-width"><%=requestMsg %></p>
					      </div>
					      <!-- Nested media object --><hr>
	  	        	<%   
	  	           }
	  	           %>
					     <%
					     if(responseMsg==null)
					     {
					    %>
					    	
					     <% 
					     }
					     else
					     {
					     %>
					     <div class="media replay-user">
					        <div class="media-left">
					          <img src="logo/avtar.png" class="media-object" style="width:45px">
					        </div>
					        <div class="media-body">
					          <h4 class="media-heading"><b><%=MentorName %></b><small><i>&nbsp;&nbsp;&nbsp;Posted on <%=responseDate %></i></small></h4>
					          <p class="idea-data-width"><%=responseMsg %></p>
							  <hr>	
					        </div>
					      </div>
					       
					     <%
						     }%>
					    
				    	
					</form>
					<%
					}
					%>
					    <form name="reqForm" action="./UserRequestSupportPage" method="post">
					 <div class="media">
					 <div style="margin-left: 35px;margin-right: 35px">
					 <textarea rows="" cols="" class="form-control" name="requestdetails" ng-model="generel" required/></textarea>
					 </div>
					<br>
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
					    <input type="hidden" name="ideaid" value="<%=dbideaid %>">
						<input type="hidden" name="userid" value="<%=userid %>">
						<input type="hidden" name="support" value="<%=supp %>">
						<input type="hidden" name="hint" value="true">
					</form>	
							</div>
						</div>
				</div>
				
				<div id="offer" class="tab-pane fade">
				    <div class="panel panel-default card panels">
				    	<div class="panel-body panels">
				    		<div class="tabbable-line">
								<ul class="nav nav-tabs container-opportunity ">
									<li class="active">
										<a href="#posts" data-toggle="tab" class="tab-sub-font-grorgia text-center">Post Partnership Opportunity</a>
									</li>
									<li>
										<a href="#respons" data-toggle="tab" class="tab-sub-font-grorgia text-center">	View Responses</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="posts"><br>
											<div class="col-sm-2"></div>
											<form class="col-sm-8">
											    <div class="form-group">
											      <label for="usr">Title of Work / Product / Solution</label>
											      <input type="text" class="form-control" id="usr">
											    </div>
											    <div class="form-group">
											      <label for="pwd">What i am looking into a partner</label>
											          <div style="margin-left: 30px;">
												     	 <div class="form-group">
												      		<p for="pwd">Technical Skill Expected From My Partner</p>
												      		<input type="password" class="form-control text-sm" id="pwd">
												    	 </div>
												    	 <div class="form-group">
												      		<p for="pwd">Managerial / Other Business Skill Expected from My Partner</p>
												      		<input type="password" class="form-control text-sm" id="pwd">
												    	 </div>
												    	 <div class="form-group">
												      		<p for="pwd">Investment & Expection from Investing Partner</p>
												      		<input type="password" class="form-control text-sm" id="pwd">
												    	 </div>
												      </div>
											    </div>
											    <div class="form-group float-right">
											    
											    	<button class="btn btn-info btn-md active">Submit</button>
											    </div>
										   </form>
									</div>
									<div class="tab-pane" id="respons">
									</div>
								</div>
							</div>
				    	</div>
				    </div>
				</div>
		    </div>
		</div>
		<script type="text/javascript">
			function support()
			{
				var supporttype2=document.getElementById("iresp").value;
				var ideaid23=""+<%=ideaidd %>;
				var url="begin-user-view-idea.jsp?supporttypejs="+supporttype2+"&ideaid="+ideaid23;
				document.location.href = url;
			}
		</script>
	</body>
</html>

<script>
	angular.module("myDashboard",['ngAnimate', 'ui.bootstrap']).controller("dashboard", function($scope){
	 $scope.today = new Date();
	 $scope.rating = 5;
	 
	 $scope.emailid = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
     $scope.mobiles = /^(\+\91{1,2}[- ])\d{10}$/;
     $scope.landline = /^[0-9]\d{2,5}-\d{6,8}$/;
     $scope.numberonly = /^[0-9]{1,6}$/;
     $scope.stringonly = /^[a-zA-Z ]{1,25}$/;
     $scope.ages = /^[0-9]{1,2}$/;
     $scope.dateformat = /^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$/ ;
	 
	 $scope.setFile = function(element) {
       $scope.$apply(function($scope) {
           $scope.theFile = element.files[0];
           $scope.FileMessage = '';
           var filename = $scope.theFile.name;
           console.log(filename.length)
           var index = filename.lastIndexOf(".");
           var strsubstring = filename.substring(index, filename.length);
           if (strsubstring == '.pdf' || strsubstring == '.doc')
           {
             console.log('File Uploaded sucessfully');
           }
           else {
               $scope.theFile = '';
                 $scope.FileMessage = 'please upload correct File Name, File extension should be .pdf, .doc or';
           }

       });
   };
   
   $scope.rate = 7;
   $scope.max = 10;
   $scope.isReadonly = false;
   $scope.ratingStates = [
     {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
     {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
     {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
     {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
     {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'}
   ];
   $scope.y=0;
   $scope.odlY=0;
});

</script>