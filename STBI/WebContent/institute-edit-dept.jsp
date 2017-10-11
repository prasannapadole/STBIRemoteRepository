<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<html>
		<head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		</head>
		<body ng-app="">
		
		<%!Connection con;
	PreparedStatement pst,pst1,pst2;
	ResultSet rs,rs1,rs2,rs3;
	 long dbinstituteid=0;
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
    	dbinstituteid=rs.getLong(1);
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
													        <td><%=dbinstituteid %></td>
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
		<%
		
	long instituteid=Long.parseLong(request.getParameter("instituteid"));
		String query2="select * from institutedept  where deptId=?";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,instituteid);
		rs2=pst2.executeQuery();
		long dbdeptid=0;
		String dbdeptname="",dbhodname="",dbmobilenumber="",dbemailid="",dbdescription="",dbnoofstudent="";
		while(rs2.next())
		    {
			dbdeptid=rs2.getLong("deptId");
			dbdeptname=rs2.getString("deptname");
			dbhodname=rs2.getString("hodname");
			dbmobilenumber=rs2.getString("mobilenumber");
			dbemailid=rs2.getString("emailid");
			dbnoofstudent=rs2.getString("noofstudent");
			
			dbdescription=rs2.getString("description");
			}
		    %>	
			<div style="padding: 30px;">	
				<form name="deptedit" action="./InstituteEditDept" method="post" style="margin-top: 100px;"> 
					  <div class="form-group">
					    <label for="inputsm">Department Name:</label>
					    <input class="form-control input-sm" id="inputsm" type="text" name="dname" value="<%=dbdeptname %>"  required/>
					  </div>
					  <div><input type="hidden" name="deptid" value="<%=dbdeptid %>"></div>
					 <div class="form-group">
					    <label for="inputsm">HoD Name:</label>
					    <input class="form-control input-sm" id="inputsm" type="text" name="hodname" value="<%= dbhodname %>" ng-pattern="/^[a-zA-Z ]{1,25}$/" required/>
					     <span style="color:red" ng-show="deptedit.hodname.$dirty && deptedit.hodname.$invalid">
					     <span ng-show="deptedit.hodname.$error.required">Please specify your First Name</span></span>
					     <span style="color:red" ng-show="deptedit.hodname.$error.pattern">Numeric and special Characters are Not Allowed</span>
					  </div>
					  <div class="form-group">
					    <label for="inputsm">Mobile Number:</label>
					      <input class="form-control" id="focusedInput" type="text" value="<%=dbmobilenumber %>"  name="mobilenumber" ng-pattern="/^(\+\91{1,2}[- ])\d{10}$/" required/><small>Format :+91 9855514371</small><br>
					      <span style="color:red" ng-show="deptedit.mobilenumber.$dirty && deptedit.mobilenumber.$invalid">
					      <span ng-show="deptedit.mobilenumber.$error.required">Please specify your Mobile Number</span></span>
					      <span ng-show="deptedit.mobilenumber.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed <br> Please enter valid format(+91 9855514371)</span>
				
					  </div>
					  <div class="form-group">
					    <label for="inputsm">Email id:</label>
					     <input class="form-control" id="focusedInput" type="text" value="<%=dbemailid  %>" name="email"  ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i" required/>
						  <span style="color:red" ng-show="deptedit.email.$dirty && deptedit.email.$invalid">
					      <span ng-show="deptedit.email.$error.required">Please specify your Email ID</span></span>
						  <span ng-show="deptedit.email.$error.pattern" style="color:red">Please enter correct email address.</span>
				
					  </div>
					  <div class="form-group">
					    <label for="inputsm" >No. of Student</label><br>
					    <input class="form-control input-sm" id="inputsm" type="text" name="nostudent" value="<%=dbnoofstudent%>" required/><%--  ng-pattern="/^[0-9]{1,100}$/" --%>
					 	  <span style="color:red" ng-show="deptedit.nostudent.$dirty && deptedit.nostudent.$invalid">
					      <span ng-show="deptedit.nostudent.$error.required">Please specify No. of Student</span></span>
						  <span ng-show="deptedit.nostudent.$error.pattern" style="color:red">Alphabet and special Characters are Not Allowed.</span>
					  </div>
					  <div class="form-group">
					    <label for="inputsm">Description</label>
					    <textarea rows="" cols="" class="form-control" name="description" required><%=dbdescription%></textarea>
					  </div>
					  <div class="form-group fload_right">
					    	<button type="submit" class="btn btn-info btn-md active " 
					    	        ng-disabled="deptedit.hodname.$dirty && deptedit.hodname.$invalid && deptedit.hodname.$error.pattern || 
					    	        			 deptedit.mobilenumber.$dirty && deptedit.mobilenumber.$invalid && deptedit.mobilenumber.$error.pattern ||
					    	        			 deptedit.email.$dirty && deptedit.email.$invalid && deptedit.email.$error.pattern ||
					    	        			 deptedit.nostudent.$dirty && deptedit.nostudent.$invalid && deptedit.nostudent.$error.pattern">Update</button>
					    	 <a button type="button" class="btn btn-default" href="institute-dashboard.jsp">Back</a>
					  </div>
				</form> 
			</div>
		</body>
</html>