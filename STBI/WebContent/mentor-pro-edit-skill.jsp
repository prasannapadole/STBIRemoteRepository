<%@page import="com.dao.Dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/sig-dashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<body>
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
		long mentorskillid=Long.parseLong(request.getParameter("mentorskillid"));
		String query2="select * from mentorskill where mentorskillId=?";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,mentorskillid);
		rs2=pst2.executeQuery();
		long dbmentorskillId=0;
		String dbskills="";
		while(rs2.next())
		{
			dbmentorskillId=rs2.getLong("mentorskillId");
			dbskills=rs2.getString("skill");
		}
		
		%>
		<form name="" action="./MentorEditSkill" method="post" style="margin-top:100px;">
		  <div style="padding: 30px;">
				  <div class="form-group">
				    <label for="inputsm">Add Skills</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="skills" value="<%=dbskills %>" ng-model="skills" required/>
				  <input type="hidden" name="mentorskillid" value="<%=dbmentorskillId %>">
				  </div>
				  <div class="form-group fload_right">
				    	<button type="submit" class="btn btn-info btn-md active">Update</button>
				    	 <a button type="button" class="btn btn-default" href="mentor-dashboard.jsp">Back</a>
				  </div>
		   </div>
		</form> 
	</body>
</html>