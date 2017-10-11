package com.sig.institute.incubation.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class IncubationLogin
 */
//@WebServlet("/IncubationLogin")
public class IncubationLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
    PreparedStatement pst,pst1;
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
			HttpSession session=request.getSession(); //create a session to pass user email id 
			
			String email=request.getParameter("email");  //to get a value from user email
			String password=request.getParameter("password"); //to get a password from user.
					   
			if(IncubationLoginDao.checkUser(email,password) ) //call LoginDao method that contain email and password code
						        {
							  session.setAttribute("incubationemail",email);
					          response.sendRedirect("incubation-dashboard.jsp");
						        }
								else
						  		{
								out.println("<html><body style=background-color:#F0FFF0>");
				        	    out.println("<script type=\"text/javascript\">");
				    	        out.println("alert('Wrong Username And Password Or Your Registration is in Approved Stage....')");
				    	        out.println("document.location.href = 'sig-login.jsp';\n");
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
		}
      }
