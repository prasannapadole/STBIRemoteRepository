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
 * Servlet implementation class EducationEdit
 */
//@WebServlet("/EducationEdit")
public class EducationEdit extends HttpServlet {
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
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
         long eduid=Long.parseLong(request.getParameter("eduid"));
	     String scname=request.getParameter("collegename");
	     String qualification=request.getParameter("degree");
	     String stream=request.getParameter("field");
	     String grade=request.getParameter("grade");
	     String fromdate =request.getParameter("fromdate");
	     String todate =request.getParameter("todate");
	     String description =request.getParameter("description");
	     
	     String query="update education set collegename=?,qualification=?,stream=?,grade=?,fromda=?,toda=?,description=? where eduid=?";
	     pst=con.prepareStatement(query);
	     pst.setString(1,scname);
	     pst.setString(2,qualification);
	     pst.setString(3,stream);
	     pst.setString(4,grade);
	     pst.setString(5,fromdate);
	     pst.setString(6,todate);
	     pst.setString(7,description);
	     pst.setLong(8,eduid);
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
