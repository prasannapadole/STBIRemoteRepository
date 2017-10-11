package com.institute.instutepersonalinfo;

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
 * Servlet implementation class UpdateInformation
 */
//@WebServlet("/UpdateInformation")
public class UpdateInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
     PreparedStatement pst,pst1,pst3,pst4;
     ResultSet rs,rs3;
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
			    HttpSession session;
			    session=request.getSession();
			    String email=(String)session.getAttribute("institutormail"); 
			    String principlename=request.getParameter("principalName");
				String newmobilenumber=request.getParameter("mobilenumber");
				String newemailid=request.getParameter("email");
				
				if(InstituteCheckMobileNumber.checkUser(newmobilenumber))
				{
					out.println("<html><body style=background-color:>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Mobile Number Already Registered,Please try another Mobile Number')");
					out.println("document.location.href = 'institute-dashboard.jsp';\n");
					out.println("</script>");
					out.println("</body></html>");	
				}
				else if(InstituteCheckMail.checkUser(newemailid))
				{
					out.println("<html><body style=background-color:>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Email ID Already Registered,Please  try another Email Id')");
					out.println("document.location.href = 'institute-dashboard.jsp';\n");
					out.println("</script>");
					out.println("</body></html>");	
				}
				else
				{
				String query3="select instituteId from instituteregi where emailid=?";
				pst3=con.prepareStatement(query3);
				pst3.setString(1,email);
				rs3=pst3.executeQuery();
				long dbinstituteid=0;
				while(rs3.next())
				{
					dbinstituteid=rs3.getLong(1);	
				}
				String query4="update instituteregi set instituteprinciplename=?,mobilenumber=?,emailid=? where instituteId=?";
				pst4=con.prepareStatement(query4);
				pst4.setString(1,principlename);
				pst4.setString(2,newmobilenumber);
				pst4.setString(3,newemailid);
				pst4.setLong(4,dbinstituteid);
			    int i=pst4.executeUpdate();
			
			
					out.println("<html><body style=background-color:>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Record updated successfully')");
					out.println("document.location.href = 'institute-dashboard.jsp#/opportinity';\n");
					out.println("</script>");
					out.println("</body></html>");	
					email=newemailid;
					session.setAttribute("institutormail", email);
			
				}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		 
	}

}
