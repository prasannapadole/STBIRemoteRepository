package com.user.useredit.personaldetails;

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
 * Servlet implementation class EditSkills
 */
//@WebServlet("/EditSkills")
public class EditSkills extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String query;// message will be sent back to client
	PreparedStatement ps,pst;
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
		long skillid=Long.parseLong(request.getParameter("skillid"));
		String skills=request.getParameter("skills");
		query="update skills set skillname=? where skillid=?";
		pst=con.prepareStatement(query);
		pst.setString(1,skills);
		pst.setLong(2,skillid);
		int i=pst.executeUpdate();
		    out.println("<html><body style=background-color:#F0FFF0>");
		    out.println("<script type=\"text/javascript\">");
	        out.println("alert('Record Updated Successfully')");
	        out.println("document.location.href = 'begin-dashboard.jsp';\n");
	        out.println("</script>");
	        out.println("</body></html>");  
		}
	catch(Exception e)
	{
		out.println(e);
	}
		
		
		
	}

}
