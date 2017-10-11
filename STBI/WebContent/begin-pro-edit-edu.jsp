<%@page import="com.dao.Dao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    long eduid=0;
    try{
    eduid=Long.parseLong(request.getParameter("eduid"));
    System.out.println("id"+eduid);
    }
    catch(NumberFormatException e)
    {
    	System.out.println("error"+e);
    }
    con=Dao.getConnection();
	 String query2="select * from education where eduid=?";
	pst2=con.prepareStatement(query2);
	pst2.setLong(1,eduid);
	rs2=pst2.executeQuery();
	long dbeduid=0;
	String dbcollegename="",dbqualification="",dbstream="",dbgrade="",dbfromda="",dbtoda="",dbdescription="";
	while(rs2.next())
    {
		dbeduid=rs2.getLong("eduid");
		dbcollegename=rs2.getString("collegename");
		dbqualification=rs2.getString("qualification");
		dbstream=rs2.getString("stream");
		dbgrade=rs2.getString("grade");
		dbfromda=rs2.getString("fromda");
		dbtoda=rs2.getString("toda");
		dbdescription=rs2.getString("description");
		}%>		
              <div class="tops">
		           <div class="comtainer">
		               <div class="panel panel-default">
		                    <div class="panel-heading text-center"><b>Edit Education Details</b></div>
		                    <div class="panel-body"><%-- --%>
				              <form name="educationForm" action="./EducationEdit" method="post" >
								  <div class="form-group">
								    <label for="inputsm">School / College Name</label>
								    <input class="form-control input-md" id="inputsm" type="text" name="collegename" value="<%=dbcollegename %>" ng-model="name" required/>
								   <input type="hidden" name="eduid" value="<%=eduid%>"/>
								 
								  </div>
								 <div class="form-group">
								    <label for="inputsm">Degree</label>
								    <input class="form-control input-md" id="inputsm" type="text" name="degree" value="<%=dbqualification %>" ng-model="degree" required/>
								  </div>
								 <div class="form-group">
								    <label for="inputsm">Field of Study</label>
								    <input class="form-control input-md" id="inputsm" type="text" name="field" value="<%=dbstream %>" ng-model="field" required/>
								  </div>
								  <div class="form-group">
								    <label for="inputsm">Grade/Percentage</label> 
								    <input class="form-control input-md" id="inputsm" type="text" name="grade" value="<%=dbgrade %>" ng-model="grade" required/>
								  </div>
								  <div class="row form-group">
								      <label for="inputsm" style="padding-left: 15px;">Time Period</label><br>
									  <div class=" col-sm-6">
									    <label for="inputsm"><small>From (Format : MM/DD/YYYY)</small></label>
									    <input class="form-control input-md"  type="text" name="fromdate" value="<%=dbfromda %>" ng-model="from" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
									  </div>
									  <div class=" col-sm-6">
									    <label for="inputsm"><small>To (Format : MM/DD/YYYY)</small></label>
									    <input class="form-control input-md" type="text" name="todate" value="<%=dbtoda %>" ng-model="to" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
									  </div>
								  </div>
								  <div class="form-group">
								    <label for="inputsm">Description</label>
								    <textarea rows="" cols="" class="form-control"name="description" required><%=dbdescription %></textarea>
								  </div>
								  <div class="form-group fload_right">
								   <button type="submit" class="btn btn-info btn-md active "ng-disabled="educationForm.from.$dirty && educationForm.from.$invalid && educationForm.from.$error.pattern || educationForm.to.$dirty && educationForm.to.$invalid && educationForm.to.$error.pattern">Update</button>	
								    	
								    	
								    	  <a button type="button" class="btn btn-default" href="begin-dashboard.jsp" >Back</a>
								  </div>
					    	</form> 
					    </div>
		             </div>
				</div>
		 </div>  
	</body>
</html>