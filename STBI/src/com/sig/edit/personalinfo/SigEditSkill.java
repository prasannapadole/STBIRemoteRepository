package com.sig.edit.personalinfo;

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
 * Servlet implementation class SigEditSkill
 */
//@WebServlet("/SigEditSkill")
public class SigEditSkill extends HttpServlet {
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
			long sigskillid=Long.parseLong(request.getParameter("techId"));
			String title=request.getParameter("title");
			String leadfaculty=request.getParameter("lead");
			String facultymember=request.getParameter("member");
			String memberofstudent=request.getParameter("students");
			String description=request.getParameter("description");
			
			String query="update sigtechnologyskill set title=?,leadfaculty=?,facultymember=?,memberofstudent=?,description=? where techId=?";
			pst=con.prepareStatement(query);
			pst.setString(1,title);
			pst.setString(2,leadfaculty);
			pst.setString(3,facultymember);
			pst.setString(4,memberofstudent);
			pst.setString(5,description);
			pst.setLong(6,sigskillid);
			
			int i=pst.executeUpdate();
			    out.println("<html><body style=background-color:#F0FFF0>");
			    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Record Updated Successfully')");
		        out.println("document.location.href = 'sig-dashboard.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");  
			
			
			
			
			
			
			
			
		  }
		  catch(Exception e)
		  {
			  out.println(e);
		  }
	}

}
