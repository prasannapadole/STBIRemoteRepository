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
    
    long inubiteeid=Long.parseLong(request.getParameter("incubationid"));
    
    String query3="select * from incubationdetail where incubationdetailId=?";
    pst3=con.prepareStatement(query3);
    pst3.setLong(1,inubiteeid);
    rs3=pst3.executeQuery();
    long dbincubationdetailId=0;
    String dbincubationname="",dbincubationprofile="",dbnoofteammember="",dbstartupdate="",dblegalstatus="";
    while(rs3.next())
    {
    	dbincubationdetailId=rs3.getLong("incubationdetailId");	
    	dbincubationname=rs3.getString("incubationname");
    	dbincubationprofile=rs3.getString("incubationprofile");
    	dbnoofteammember=rs3.getString("noofteammember");
    	dbstartupdate=rs3.getString("startupdate");
    	dblegalstatus=rs3.getString("legalstatus");
    }
    
    
    
    
    %>
	       <div style="padding: 30px; margin-top: 100px;">
			<form name="incubateeForm" action="./Incubation_IncubiteeEdit" method="post">
			      <div class="form-group">
				    <label for="inputsm">Name / Title of Incubatee:</label>
				    <input class="form-control input-sm" id="inputsm" type="text" name="incuname" value="<%=dbincubationname %>"  required/>
			
				  </div>
				  <div>	  <input type="hidden" name="incubiteeid" value="<%=dbincubationdetailId %>"></div>
				  <%
				  if(dbincubationprofile.equals("Ideation"))
				  {%>
					  <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile"  required>
				    	<option ng-show="false">Select</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div>  
				  <%}else  if(dbincubationprofile.equals("POC"))
				  {%>
					  <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div> 
				  <%}else   if(dbincubationprofile.equals("Rapid Prototype"))
				  {%>
					  <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div> 
				  <%}else  if(dbincubationprofile.equals("Pilet Production"))
				  {%>
					   <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile"  required>
				    	<option ng-show="false">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div> 
				  <%}else  if(dbincubationprofile.equals("Pitch / building"))
				  {%>
					  <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div> 
				  <%}else  if(dbincubationprofile.equals("Waiting for scaleup funding"))
				  {%>
					   <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile"  required>
				    	<option ng-show="false">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div> 
				  <%}else  if(dbincubationprofile.equals("Graduated"))
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="<%=dbincubationprofile %>" selected="selected">Graduated</option>
				    </select>
				  </div> 
				  <%}else  
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Incubatee Profile:</label>
				    <select class="form-control" name="profile" required>
				    	<option value="-" selected="selected">Select</option>
				    	<option value="Ideation">Ideation</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Pilet Production">Pilet Production</option>
				    	<option value="Pitch / building">Pitch / building</option>
				    	<option value="Waiting for scaleup funding">Waiting for scaleup funding</option>
				    	<option value="Graduated">Graduated</option>
				    </select>
				  </div> 
				  <%}  %>
				    
				  <div class="form-group">
				    <label for="inputsm">No. of Team Member:</label>
				    <input class="form-control input-sm" id="inputsm" type="text" name="team" value="<%=dbnoofteammember%>" ng-pattern="/^[0-9]{1,6}$/" required>
				     <span style="color:red" ng-show="incubateeForm.team.$dirty && incubateeForm.team.$invalid">
					 <span ng-show="incubateeForm.team.$error.required">Please specify Date</span></span>
				     <span ng-show="incubateeForm.team.$error.pattern" style="color:red"> Alphabet and special Characters are Not Allowed .</span>

				  </div>
				 <div class="form-group">
				     <label for="inputsm">Date of Start-up: (Format : MM/DD/YYYY)</label>
					 <input class="form-control input-md" id="inputsm" type="text" name="startupdate" value="<%=dbstartupdate %>"  ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
					 <span style="color:red" ng-show="incubateeForm.dates.$dirty && incubateeForm.dates.$invalid">
					 <span ng-show="incubateeForm.dates.$error.required">Please specify Date</span></span>
				     <span ng-show="incubateeForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
				
				  </div>
				  <%
				  if(dblegalstatus.equals("Unregistered Beginner"))
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus"   required>
				    	<option ng-show="false">Select</option>
				    	<option value="<%=dblegalstatus %>" selected="selected">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>  
				  <%} else if(dblegalstatus.equals("Registered Startup"))
				    {%>
				
				<div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="<%=dblegalstatus %>" selected="selected">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>  
				  
				  <%} else if(dblegalstatus.equals("Partner ship"))
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus"  required>
				    	<option ng-show="false">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="<%=dblegalstatus %>" selected="selected">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>   
				  <%} else if(dblegalstatus.equals("Private Limited"))
				    {%>
				<div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="<%=dblegalstatus %>" selected="selected">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>  
				  
				  <%} else  if(dblegalstatus.equals("LLP"))
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus"  required>
				    	<option ng-show="false">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP" selected="selected">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>   
				  <%} else if(dblegalstatus.equals("Public Limited"))
				    {%>
				<div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="<%=dblegalstatus %>" selected="selected">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>  
				
				  
				  <%} else   if(dblegalstatus.equals("Other"))
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus" required>
				    	<option ng-show="false">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="<%=dblegalstatus %>" selected="selected">Other</option>
				    </select><br>
				     <div ng-switch="legalstatus">
				    	<div ng-switch-when="other">
				    		<input type="text" class="form-control" name="legalstatus1" placeholder="Please Mention">
				    	</div>
				    </div>
				    </div>   
				  <%} else 
				    {%>
				<div class="form-group">
				    <label for="inputsm">Legal Status:</label>
				    <select class="form-control" name="legalstatus" required>
				    	<option value="-" selected="selected">Select</option>
				    	<option value="Unregistered Beginne">Unregistered Beginner</option>
				    	<option value="Registered Startup">Registered Startup</option>
				    	<option value="Partner ship">Partner ship</option>
				    	<option value="Private Limited">Private Limited</option>
				    	<option value="LLP">LLP</option>
				    	<option value="Public Limited">Public Limited</option>
				    	<option value="Other">Other</option>
				    </select>
				    </div>  
				
				  
				  <%}
				  %>
				   <div class="fload_right">
				  		<button type="submit" class="btn btn-info btn-ms active"
				  		        ng-disabled="incubateeForm.dates.$error.pattern || incubateeForm.team.$error.pattern"
				  		>Update</button>
				  		<a button type="button" class="btn btn-default" href="incubation-dashboard.jsp">Back</a>
				  </div>
			</form> 
	</div>
	</body>
</html>