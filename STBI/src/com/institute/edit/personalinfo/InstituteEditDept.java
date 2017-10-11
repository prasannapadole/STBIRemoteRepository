package com.institute.edit.personalinfo;

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
 * Servlet implementation class InstituteEditDept
 */
//@WebServlet("/InstituteEditDept")
public class InstituteEditDept extends HttpServlet {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		  PrintWriter out=response.getWriter();
		try
		  {
			long institutedeptid=Long.parseLong(request.getParameter("deptid"));
			String deptname=request.getParameter("dname");
			String hodname=request.getParameter("hodname");
			String mobilenumber=request.getParameter("mobilenumber");
			String emailid=request.getParameter("email");
			String noofstudent=request.getParameter("nostudent");
			long noofstu=Long.parseLong(noofstudent);
			String description=request.getParameter("description");
			
			
			query="update institutedept set deptname=?,hodname=?,mobilenumber=?,emailid=?,noofstudent=?,description=? where deptId=?";
			pst=con.prepareStatement(query);
			pst.setString(1,deptname);
			pst.setString(2,hodname);
			pst.setString(3,mobilenumber);
			pst.setString(4,emailid);
			pst.setLong(5,noofstu);
			pst.setString(6,description);
			pst.setLong(7,institutedeptid);
			
			int i=pst.executeUpdate();
			    out.println("<html><body style=background-color:#F0FFF0>");
			    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Record Updated Successfully')");
		        out.println("document.location.href = 'institute-dashboard.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");  
			
			
			
		  }
		catch(Exception e)
		{
			out.println(e);
		}
		  
		  
		  
		  
		  
	}

}
