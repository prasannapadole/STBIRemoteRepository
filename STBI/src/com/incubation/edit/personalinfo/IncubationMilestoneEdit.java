package com.incubation.edit.personalinfo;

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

import com.dao.Dao;

/**
 * Servlet implementation class IncubationMilestoneEdit
 */
//@WebServlet("/IncubationMilestoneEdit")
public class IncubationMilestoneEdit extends HttpServlet 
    {
		    private static final long serialVersionUID = 1L;
			Connection con;
			String query;// message will be sent back to client
			PreparedStatement pst;
		
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
		out.println("Hello");
			try
				{
				long milestoneid=Long.parseLong(request.getParameter("milestoneid"));
				String milestonedate=request.getParameter("milestonedates");
				String milestonename=request.getParameter("milestonename");
				String milestonetype=request.getParameter("milestone");
				String description=request.getParameter("description");
				query="update incubationmilestone set incudate=?,incumilestonename=?,incumilestonetype=?,incudescription=? where incubationmileId=?";
				pst=con.prepareStatement(query);
				pst.setString(1,milestonedate);
				pst.setString(2,milestonename);
				pst.setString(3,milestonetype);
				pst.setString(4,description);
				pst.setLong(5,milestoneid);
			
				int i=pst.executeUpdate();
			
			    out.println("<html><body style=background-color:#F0FFF0>");
			    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Record Updated Successfully')");
		        out.println("document.location.href = 'incubation-dashboard.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");  
				}
			catch(Exception e)
			{
				out.println(e);
			}
		}
@Override
public void destroy()
	{
Dao.cleanUp(con, pst,null);
	}
    }
