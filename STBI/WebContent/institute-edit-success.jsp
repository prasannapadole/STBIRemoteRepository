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
	<body ng-app="">
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
		<%
		long institutemilestoneid=Long.parseLong(request.getParameter("institutemilestonId"));
		
	
		String query3="select * from institutemilestone where institutemilestonId=?";
		pst3=con.prepareStatement(query3);
		pst3.setLong(1,institutemilestoneid);
		rs3=pst3.executeQuery();
		long dbmilestonid=0;
		String dbinsdate="",dbmilestonename="",dbmilestonetype="",dbdescription="";
		while(rs3.next())
		    {
			dbmilestonid=rs3.getLong("institutemilestonId");
			dbinsdate=rs3.getString("insdate");
			dbmilestonename=rs3.getString("milestonename");
			dbmilestonetype=rs3.getString("milestonetype");
		
			dbdescription=rs3.getString("description");
		    }
			%>
	         <div style="margin-top:100px;">
			    <form name="editForm" action="./InstituteEditMilestone" method="post">
				  <div class="form-group">
				    <label for="inputsm">Date: (Format : MM/DD/YYYY)</label>
					 <input class="form-control input-md" id="inputsm" type="text" name="dates" value="<%=dbinsdate %>"  ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
					 <span style="color:red" ng-show="editForm.dates.$dirty && editForm.dates.$invalid">
					 <span ng-show="editForm.dates.$error.required">Please specify Date</span></span>
				     <span ng-show="editForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
				  </div>
				  <div><input type="hidden" name="milestoneid" value="<%=dbmilestonid %>"></div>
				 <div class="form-group">
				    <label for="inputsm">Milestone Name :</label>
				    <input class="form-control input-sm" id="inputsm" type="text" name="milestonename" value="<%=dbmilestonename %>"  required/>
				  </div>
				  
				  <%
				  if(dbmilestonetype.equals("Publication"))
				  {%>
					  
					 <div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication" selected="selected">Publication</option>
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
				 <%} else if(dbmilestonetype.equals("Grants"))
				 {%>
					 <div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone" required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants" selected="selected">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>   
					 
				 <%} 
				 else if(dbmilestonetype.equals("POC"))
				  {%>
					<div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC" selected="selected">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>    
					  
				 <%} else if(dbmilestonetype.equals("Rapid Prototype"))
				 {%>
				<div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype" selected="selected">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>    	 
					 
				 <%}
				 else if(dbmilestonetype.equals("Ready to Commercialization"))
				  {%>
					<div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone" required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization" selected="selected">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>      
					  
				 <%} else if(dbmilestonetype.equals("Outcome"))
				 {%>
					<div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome" selected="selected">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>       
					 
				 <%}
				 else if(dbmilestonetype.equals("Consultancy"))
				  {%>
					<div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy" selected="selected">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>       
					  
				 <%} else if(dbmilestonetype.equals("Training"))
				 {%>
					<div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training" selected="selected">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>      
					 
				 <%}
				 else if(dbmilestonetype.equals("Medal and Certificate"))
				  {%>
					 <div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
				    	<option value="" ng-show="false">Select</option>
				    	<option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate" selected="selected">Medal and Certificate</option>
				    </select>
				  </div>       
					  
				
					 
				 <%}else 
				 {%>
					 <div class="form-group">
				    <label for="inputsm">Milestone Type:</label>
				    <select class="form-control" name="milestone"  required>
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
					 <%} %>
				
				  <div class="form-group">
				    <label for="inputsm">Brief Description:</label>
				   <textarea rows="" cols="" class="form-control" name="description" required><%=dbdescription%></textarea>
				  </div>
				  <div class="fload_right">
				  		<button type="submit" class="btn btn-info btn-md active"
				  		        ng-disabled="editForm.dates.$error.pattern"
				  		>Update</button>
				  		<a button type="button" class="btn btn-default" href="institute-dashboard.jsp">Back</a>
				  </div>
			</form> 
		</div>
	</body>
</html>