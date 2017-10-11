package com.user.personal.userinfo;

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
import com.mentor.mentorpersonalinfo.MentorCheckemail;
import com.mentor.mentorpersonalinfo.MentorCheckmobile;

/**
 * Servlet implementation class UpdateUserInfo
 */
//@WebServlet("/UpdateUserInfo")
public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//create object of connection,preparedstatement and resultset
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
				HttpSession session=request.getSession();
				String email=(String)session.getAttribute("useremail");
				String mobile=request.getParameter("mobilenumber");
				String newemail=request.getParameter("email");
				String tempaddress=request.getParameter("address");
				if(CheckEmail.checkUser(newemail))
				{
					out.println("<html><body style=background-color:>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Email ID Already Registered,Please  try another Email Id')");
					out.println("document.location.href = 'begin-dashboard.jsp';\n");
					out.println("</script>");
					out.println("</body></html>");		
				}
				else if(CheckUserMobile.checkUser(mobile))
				{
					out.println("<html><body style=background-color:>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Mobile Number Already Registered,Please try another Mobile Number')");
					out.println("document.location.href = 'begin-dashboard.jsp';\n");
					out.println("</script>");
					out.println("</body></html>");		
				}
				else
				{
					String se="select userId from user where emailid=?";   //get userid through email id
					ps=con.prepareStatement(se);
					ps.setString(1,email);
					rs1=ps.executeQuery();
					long dbuserId=0;
							while(rs1.next())
							{
								dbuserId=rs1.getLong(1);  //get userid
							}
							
							String query="update user set mobilenumber=?,emailid=?,tempararyaddress=? where userId=?";
							pst=con.prepareStatement(query);
							pst.setString(1,mobile);
							pst.setString(2,newemail);
							pst.setString(3,tempaddress);
							pst.setLong(4,dbuserId);
							int i=pst.executeUpdate();
							if(i>0)
							{
								out.println("<html><body style=background-color:>");
								out.println("<script type=\"text/javascript\">");
								out.println("alert('Record updated successfully')");
								out.println("document.location.href = 'begin-dashboard.jsp';\n");
								out.println("</script>");
								out.println("</body></html>");	
								email=newemail;
								session.setAttribute("useremail", email);
							}
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
			Dao.cleanUp(null, ps, rs1);
	}
}


