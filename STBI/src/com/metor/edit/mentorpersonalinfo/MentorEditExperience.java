package com.metor.edit.mentorpersonalinfo;

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
 * Servlet implementation class MentorEditExperience
 */
//@WebServlet("/MentorEditExperience")
public class MentorEditExperience extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String message = null;  // message will be sent back to client
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
				long mentorexpid=Long.parseLong(request.getParameter("mentorexpid"));
				String designation=request.getParameter("designation");
				String companyname=request.getParameter("cname");
				String location=request.getParameter("location");
				String fromda=request.getParameter("fromdate");
				String toda=request.getParameter("todate");
				String description=request.getParameter("description");
				
				String query="update mentorexperience set designation=?,companyname=?,location=?,fromda=?,toda=?,description=? where mentorexpId=?";
			    pst=con.prepareStatement(query);
			    pst.setString(1,designation);
			    pst.setString(2,companyname);
			    pst.setString(3,location);
			    pst.setString(4,fromda);
			    pst.setString(5,toda);
			    pst.setString(6,description);
			    pst.setLong(7,mentorexpid);
			    
			    int i=pst.executeUpdate();
			    
			    out.println("<html><body style=background-color:#F0FFF0>");
			    out.println("<script type=\"text/javascript\">");
		        out.println("alert('RecordUpdated Successfully')");
		        out.println("document.location.href = 'mentor-dashboard.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");  
				}
			   catch(Exception e)
			    {
				out.println(e);
			    }
			
			}

	}
