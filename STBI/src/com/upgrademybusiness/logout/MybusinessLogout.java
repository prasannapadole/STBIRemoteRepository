package com.upgrademybusiness.logout;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MybusinessLogout
 */
//@WebServlet("/MybusinessLogout")
public class MybusinessLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
			{
			HttpSession session=request.getSession();
			session.invalidate();
			response.sendRedirect("scaleup-login.jsp");
			}
		catch(Exception e)
			{
			out.println(e);
			}
	
	}

}
