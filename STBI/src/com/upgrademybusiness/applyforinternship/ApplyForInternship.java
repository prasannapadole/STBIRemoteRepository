package com.upgrademybusiness.applyforinternship;

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
 * Servlet implementation class ApplyForInternship
 */
//@WebServlet("/ApplyForInternship")
public class ApplyForInternship extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//create object
	Connection con;
	PreparedStatement ps,ps1,pst;
	ResultSet r,rs,rs1;
	RequestDispatcher rd,rd1;
 
public void init(ServletConfig config) throws ServletException
    {
	try {
			con = Dao.getConnection();//access dao class getconnection method
		    } 
		catch (ClassNotFoundException | IOException | SQLException e)
			{
		e.printStackTrace();
			}
    	}   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
			 HttpSession session=request.getSession();
			 String sigemail=(String)session.getAttribute("sigmail");
		     String applystatus="Apply";
		     long dbinternsId=Long.parseLong(request.getParameter("dbinternsId"));
		     long appliedId=11111;
		     
		     String query="select max(appliedId) from sig_appliedfor_internship";   //select max of id from ideasumit table 
				PreparedStatement pst=con.prepareStatement(query);
				 rs=pst.executeQuery();
				int dbappliedId=0;
				while(rs.next())
				{
					dbappliedId=rs.getInt(1);//to get max of id from ideasubmit table
		        }
				if(dbappliedId==0)
				{
					appliedId=dbappliedId+appliedId; 
				}
				else
				{
					appliedId=dbappliedId+1; 
				}
	    
			    String query1="select sigId from sigregi where emailid=?";
			    ps=con.prepareStatement(query1);
			    ps.setString(1,sigemail);
			    r=ps.executeQuery();
			     long dbsigid=0;
			    while(r.next())
			    {
			    	dbsigid=r.getLong(1);
			    }
		    String query2="insert into sig_appliedfor_internship values(?,?,?)";
		    ps1=con.prepareStatement(query2);
		    ps1.setLong(1,appliedId);
		    ps1.setLong(2,dbsigid);
		    ps1.setLong(3,dbinternsId);
		    int i=ps1.executeUpdate();
	    	out.println("<html><body style=background-color:>");
	        out.println("<script type=\"text/javascript\">");
	        out.println("alert('You Apply Successsfully')");
	        out.println("document.location.href = 'sig-dashboard.jsp';\n");
	        out.println("</script>");
	        out.println("</body></html>");
	        RequestDispatcher rd=request.getRequestDispatcher("/sig-dashboard.jsp");
	        rd.include(request,response);	
	    	}
			catch(Exception e)
			{
			out.println(e);
			}
		}
  	}
