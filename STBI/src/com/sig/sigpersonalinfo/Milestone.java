package com.sig.sigpersonalinfo;

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
 * Servlet implementation class Milestone
 */
//@WebServlet("/Milestone")
public class Milestone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
    PreparedStatement pst,pst1,pst2;
    String query,query1;
    ResultSet rs,rs1;

public void init(ServletConfig config) throws ServletException
		{
		try
			{
			con = Dao.getConnection();//call getconnection metho of dao class
			}
			catch (ClassNotFoundException | IOException | SQLException e) 
				{
				// TODO Auto-generated catch block
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
		String sigemail=(String)session.getAttribute("sigmail");
		
		long milestonId=123;
		String datee=request.getParameter("dates");
		String milestonename=request.getParameter("milestonename");
		String milestonetype=request.getParameter("milestone");
		String description=request.getParameter("description");
		
		String query="select sigId from sigregi where emailid=?";
		pst=con.prepareStatement(query);
		pst.setString(1,sigemail);
		rs=pst.executeQuery();
		long dbsigid=0;
		while(rs.next())
		{
		dbsigid=rs.getLong(1);	
		}
		String query1="select max(sigmilestoneId) from sigmilestone";
		pst1=con.prepareStatement(query1);
		rs1=pst1.executeQuery();
		long dbsigmilestoneId=0;
		while(rs1.next())
		{
			dbsigmilestoneId=rs1.getLong(1);	
		}
		if(dbsigmilestoneId==0)
		{
			milestonId=	dbsigmilestoneId+milestonId;
		}
		else
		{
			milestonId=	dbsigmilestoneId+1;
		}
		
		String query2="insert into sigmilestone values(?,?,?,?,?,?)";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,milestonId);
		pst2.setString(2,datee);
		pst2.setString(3,milestonename);
		pst2.setString(4,milestonetype);
		pst2.setString(5,description);
		pst2.setLong(6,dbsigid);
		int i=pst2.executeUpdate();
		if(i>0)
		{
			     out.println("<html><body style=background-color:#FFFFFF>");
	    	    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Milestone Added Successfully...')");
		        out.println("document.location.href = 'sig-dashboard.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");
		        RequestDispatcher rd=request.getRequestDispatcher("/sig-dashboard.jsp");
	    	    rd.include(request,response);
		}
		
		
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
	}

}
