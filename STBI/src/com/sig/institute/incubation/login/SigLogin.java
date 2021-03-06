package com.sig.institute.incubation.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.Dao;
import com.user.login.LoginDao;
import com.user.login.login;

/**
 * Servlet implementation class SigLogin
 */
//@WebServlet("/SigLogin")
public class SigLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
     PreparedStatement pst;
     ResultSet rs;

       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	try
	{
	
	HttpSession session=request.getSession(); //create a session to pass user email id 
	RequestDispatcher rs;  //to use request dispatacher to include a meassage when email and password wrong
	String email=request.getParameter("email");  //to get a value from user email
	String password=request.getParameter("password"); //to get a password from user.
			   
	if(SigLoginDao.checkUser(email,password) ) //call LoginDao method that contain email and password code
				        {
					  session.setAttribute("sigmail",email);
			          response.sendRedirect("sig-dashboard.jsp");
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
	
	
	
	
	