<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
     <head>
   		 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
   		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
	<body >
	<%!
	
	Connection con=null;
	String query;
    PreparedStatement ps,ps1,ps2,pst,pst1,pst2,pst3,pst4,pst5,pst6,pst7;
    ResultSet r,r1,r2,rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7;
    %>
	   <%
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
	     con=Dao.getConnection();
	    query="select mentorId,firstname,middlename,lastname from mentor where emailid=?";
	    pst=con.prepareStatement(query);
	    pst.setString(1,mentoremail);
	    rs=pst.executeQuery();
	    long mentorid=0;
	    String dbfname1="",dbmname1="",dblname1="";
	    while(rs.next())
	    {
	    	mentorid=rs.getLong(1);	
	    	dbfname1=rs.getString(2);
	    	dbmname1=rs.getString(3);
	    	dblname1=rs.getString(4);
	    }
	    session.setAttribute("mentorid",mentorid);
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
		
		<%
		long mentoreduid=Long.parseLong(request.getParameter("mentorid"));
		String query2="select * from mentoreducation where mentoreduId=?";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,mentoreduid);
		rs2=pst2.executeQuery();
		long dbmentoreduId=0;
		String dbcollegename="",dbqualification="",dbstream="",dbgrade="",dbfromda="",dbtoda="",dbdescription="";
		while(rs2.next())
		    {
			dbmentoreduId=rs2.getLong("mentoreduId");
			dbcollegename=rs2.getString("collegename");
			dbqualification=rs2.getString("qualification");
			dbstream=rs2.getString("stream");
			dbgrade=rs2.getString("grade");
			dbfromda=rs2.getString("fromda");
			dbtoda=rs2.getString("toda");
			dbdescription=rs2.getString("description");
		    }
			%>
			
	      <form action="./EditMentorEducation" method="post">
		  <div style="padding: 30px;">
				  <div class="form-group">
				    <label for="inputsm">School / College Name</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="collegename" value="<%=dbcollegename %>" ng-model="name" required/>
				  <input type="hidden" name="mentorid" value="<%=dbmentoreduId %>" />
				  </div>
				 <div class="form-group">
				    <label for="inputsm">Degree</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="degree" value="<%=dbqualification %>" ng-model="degree" required/>
				  </div>
				 <div class="form-group">
				    <label for="inputsm">Field of Study</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="field" value="<%=dbstream %>"  ng-model="field" required/>
				  </div>
				  <div class="form-group">
				    <label for="inputsm">Grade/Percentage</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="grade" value="<%=dbgrade %>"  ng-model="grade" required/>
				  </div>
				  <div class="row form-group">
				      <label for="inputsm" style="padding-left: 15px;">Time Period</label><br>
					  <div class=" col-sm-6">
					    <label for="inputsm"><small>From (Format : MM/DD/YYYY)</small></label>
					    <input class="form-control input-md" id="inputsm" type="text" name="fromdate" value="<%=dbfromda %>" ng-model="from" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
					      <span style="color:red" ng-show="educationForm.from.$dirty && educationForm.from.$invalid">
					      <span ng-show="educationForm.from.$error.required">Please specify Date</span></span>
						  <span ng-show="educationForm.from.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
					  </div>
					  <div class=" col-sm-6">
					    <label for="inputsm"><small>To (Format : MM/DD/YYYY)</small></label>
					    <input class="form-control input-md" id="inputsm" type="text" name="todate" value="<%=dbtoda %>" ng-model="to" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
						  <span style="color:red" ng-show="educationForm.to.$dirty && educationForm.to.$invalid">
					      <span ng-show="educationForm.to.$error.required">Please specify Date</span></span>
						  <span ng-show="educationForm.to.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
					  </div>
				  </div>
				  <div class="form-group">
				    <label for="inputsm">Description</label>
				    <textarea rows="" cols="" class="form-control" name="description" required><%=dbdescription %></textarea>
				  </div>
				  <div class="form-group fload_right">
				    	<button type="submit" class="btn btn-info btn-md active "
				    			ng-disabled="educationForm.from.$dirty && educationForm.from.$invalid && educationForm.from.$error.pattern 
				    			|| educationForm.to.$dirty && educationForm.to.$invalid && educationForm.to.$error.pattern"
				    	>Save</button>
				    	 <a button type="button" class="btn btn-default" href="mentor-dashboard.jsp">Back</a>
				  </div>
			</div>
		</form> 
	
	</body>
</html>