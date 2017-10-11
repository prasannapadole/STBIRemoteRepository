package com.incubation.incubationpersobalinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class IncubationMilestones
 */
//@WebServlet("/IncubationMilestones")
public class IncubationMilestones extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection con;
	    PreparedStatement pst,pst1;
	    ResultSet rs,rs1;
public void init(ServletConfig config) throws ServletException
	{
	try {
			con = Dao.getConnection();  //call dao.getconnection method
		}
	catch (ClassNotFoundException | IOException | SQLException e)
		{
			e.printStackTrace();
		}
	}   
  
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
			try
				{
				HttpSession session=request.getSession();
				String incubationemail=(String)session.getAttribute("incubationemail");
				long incubationmilestoneid=1001;
				String incudtae=request.getParameter("dates");
				String incumilestonename=request.getParameter("milestonename");
				String incumilestonetype=request.getParameter("milestone");
				String incudescription=request.getParameter("description");
			
				String query="select incubationId from incubationregi where emailid=?";
				pst=con.prepareStatement(query);
				pst.setString(1,incubationemail);
				rs=pst.executeQuery();
				long dbincubationid=0;
				while(rs.next())
					{
					dbincubationid=rs.getLong(1);	
					}
	    
				 String query1="select max(incubationmileId) from incubationmilestone";
		         pst1=con.prepareStatement(query1);
		         rs1=pst1.executeQuery();
		         long dbincubationmilestoneId=0;
		         while(rs1.next())
		         		{
		        	 		dbincubationmilestoneId=rs1.getLong(1); 
		         		}
				 if(dbincubationmilestoneId==0)
				 		{
				 			incubationmilestoneid=dbincubationmilestoneId+incubationmilestoneid;
				 		}
				 else
				 		{
				 			incubationmilestoneid=dbincubationmilestoneId+1;
				 		}	
				  String query2="insert into incubationmilestone values(?,?,?,?,?,?)";
		          pst1=con.prepareStatement(query2);
		          pst1.setLong(1,incubationmilestoneid);
		          pst1.setString(2,incudtae);
		       
				  pst1.setString(3,incumilestonename); 
				  pst1.setString(4,incumilestonetype);
				  pst1.setString(5,incudescription);
				  pst1.setLong(6,dbincubationid);
				  int i=pst1.executeUpdate();
				  if(i>0)
						{
						out.println("<html><body style=background-color:>");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record Added successfully')");
						out.println("document.location.href = 'incubation-dashboard.jsp';\n");
						out.println("</script>");
						out.println("</body></html>");	
						}
					 }
			catch(Exception e)
			{
				out.println(e);
			}
		}

@Override
public void destroy() 
	{
Dao.cleanUp(con, pst, rs);
Dao.cleanUp(null, pst1, rs1);
	}

}
