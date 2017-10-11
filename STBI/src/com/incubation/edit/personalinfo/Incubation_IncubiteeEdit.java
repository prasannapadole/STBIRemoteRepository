package com.incubation.edit.personalinfo;

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
 * Servlet implementation class Incubation_IncubiteeEdit
 */
//@WebServlet("/Incubation_IncubiteeEdit")
public class Incubation_IncubiteeEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String query;// message will be sent back to client
	PreparedStatement pst;

	
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
				long incubiteeid=Long.parseLong(request.getParameter("incubiteeid"));
				String incubationname=request.getParameter("incuname");
				String incubationprofile=request.getParameter("profile");
		        String noofteammember=request.getParameter("team");
				String startupdate=request.getParameter("startupdate");
				String legalstatus=request.getParameter("legalstatus");
				String otherlegalstatus=request.getParameter("legalstatus1");
				String otherlegall="";
				if(otherlegalstatus!=null)
				{
					otherlegall=otherlegalstatus;	
				}
				else
				{
					otherlegall="-";
				}
				
				query="update incubationdetail set incubationname=?,incubationprofile=?,noofteammember=?,startupdate=?,legalstatus=?,otherlegalstatus=? where incubationdetailId=?";
				pst=con.prepareStatement(query);
				pst.setString(1,incubationname);
				pst.setString(2,incubationprofile);
				pst.setString(3,noofteammember);
				pst.setString(4,startupdate);
				pst.setString(5,legalstatus);
				pst.setString(6,otherlegall);
				pst.setLong(7,incubiteeid);
		
				int i=pst.executeUpdate();
				out.println("<html><body style=background-color:#F0FFF0>");
			    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Record Updated Successfully')");
		        out.println("document.location.href = 'incubation-dashboard.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");  
				}
			catch(Exception e)
			{
			out.println(e);
			}
		}

@Override
public void destroy()
			{
        Dao.cleanUp(con, pst,null);
			}







}
