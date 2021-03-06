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
	long milestoneid=Long.parseLong(request.getParameter("sigmilestoneId"));
	String query2="select * from  sigmilestone where sigmilestoneId=?";
	pst2=con.prepareStatement(query2);
	pst2.setLong(1,milestoneid);
	rs2=pst2.executeQuery();
	long dbsigmilestoneId=0;
	String dbmilestonedate="",dbmilestonename="",dbmilestonetype="",dbdescription="";
	while(rs2.next())
	{
		dbsigmilestoneId=rs2.getLong("sigmilestoneId");
		dbmilestonedate=rs2.getString("milestonedate");
		dbmilestonename=rs2.getString("milestonename");
		dbmilestonetype=rs2.getString("milestonetype");
		dbdescription=rs2.getString("description");
		
	}
	

	%>
	   <div style="padding: 30px;">
			<form name="editForm" action="./SigEditMilestone" method="post" style="margin-top: 100px;">
				  <div class="form-group">
				    <label for="inputsm">Date: (Format : MM/DD/YYYY)</label>
					 <input class="form-control input-md" id="inputsm" type="text" name="milestonedates" value="<%=dbmilestonedate %>" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
					 <span style="color:red" ng-show="editForm.dates.$dirty && editForm.dates.$invalid">
					 <span ng-show="editForm.dates.$error.required">Please specify Date</span></span>
				     <span ng-show="editForm.dates.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
				  </div>
				 <div class="form-group">
				    <label for="inputsm">Milestone Name :</label>
				    <input class="form-control input-sm" id="inputsm" type="text" name="milestonename" value="<%=dbmilestonename %>"  required/>
				  <input type="hidden" name="sigmilestoneId" value="<%=dbsigmilestoneId %>">
				  </div>
				
				    <%
				    if(dbmilestonetype.equals("Publication"))
				    {%>
				    	
				    	 <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Publication</option>
				    	 <option value="" ng-show="false">Select</option>
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
				    	
				    	
				    <%}else if(dbmilestonetype.equals("Grants"))
				    {%>
				    <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone" required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Grants</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	 <option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>	
				    <%}else if(dbmilestonetype.equals("POC"))
				    {%>
				  
                         <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						  <option value="<%=dbmilestonetype %>" selected="selected">POC</option>
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
				     <%} else if(dbmilestonetype.equals("Rapid Prototype"))
				     {%>
				
                         <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Rapid Prototype</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	 <option value="Grants">Grants</option>
				    	 <option value="POC">POC</option>
				         <option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div> 
				    <%} else if(dbmilestonetype.equals("Ready to Commercialization"))
				    {%>
				    	<div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Ready to Commercialization</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	 <option value="Grants">Grants</option>
				    	 <option value="POC">POC</option>
				    	 <option value="Rapid Prototype">Rapid Prototype</option>
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
						 <select class="form-control" name="milestone" required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Outcome</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	 <option value="Grants">Grants</option>
				    	 <option value="POC">POC</option>
				    	 <option value="Rapid Prototype">Rapid Prototype</option>
				    	 <option value="Ready to Commercialization">Ready to Commercialization</option>
				    	 <option value="Consultancy">Consultancy</option>
				    	 <option value="Training">Training</option>
				    	 <option value="Medal and Certificate">Medal and Certificate</option>
				    </select>
				  </div>	
				  <%} else if(dbmilestonetype.equals("Consultancy"))
				  {%>
	                     <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Consultancy</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Training">Training</option>
				    	<option value="Medal and Certificate">Medal and Certificate</option>
				        </select>
				         </div>
					  
				  <%} else if(dbmilestonetype.equals("Training"))
				  {%>
			             <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						 <option value="<%=dbmilestonetype %>" selected="selected">Training</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	 <option value="Grants">Grants</option>
				    	 <option value="POC">POC</option>
				    	 <option value="Rapid Prototype">Rapid Prototype</option>
				    	 <option value="Ready to Commercialization">Ready to Commercialization</option>
				    	 <option value="Outcome">Outcome</option>
				    	 <option value="Consultancy">Consultancy</option>
				    	 <option value="Medal and Certificate">Medal and Certificate</option>
				         </select>
				         </div>
					  <%} else if(dbmilestonetype.equals("Medal and Certificate")) 
					  {%>
					
                          <div class="form-group">
						 <label for="inputsm">Milestone Type:</label>
						 <select class="form-control" name="milestone"  required>
						 <option value="<%=dbmilestonetype %>">Medal and Certificate</option>
						 <option value="" ng-show="false">Select</option>
						 <option value="Publication">Publication</option>
				    	<option value="Grants">Grants</option>
				    	<option value="POC">POC</option>
				    	<option value="Rapid Prototype">Rapid Prototype</option>
				    	<option value="Ready to Commercialization">Ready to Commercialization</option>
				    	<option value="Outcome">Outcome</option>
				    	<option value="Consultancy">Consultancy</option>
				    	<option value="Training">Training</option>
				    	
				    </select>
				  </div>
					  <%} else 
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
					  <%}
				    
				    %> 
				    
				  <div class="form-group">
				    <label for="inputsm">Brief Description:</label>
				   <textarea rows="" cols="" class="form-control" name="description"  required><%= dbdescription %></textarea>
				  </div>
				  <div class="fload_right">
				  		<button type="submit" class="btn btn-info btn-md active"
				  		        ng-disabled="editForm.dates.$error.pattern"
				  		>Update</button>
				  		<a button type="button" class="btn btn-default" href="sig-dashboard.jsp">Back</a>
				  </div>
			</form> 
		</div>
	</body>
</html>