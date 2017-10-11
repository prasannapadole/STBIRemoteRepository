package com.upgrademybusiness.applytoproject;

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
 * Servlet implementation class ProjectApplyStatus
 */
//@WebServlet("/ProjectApplyStatus")
public class ProjectApplyStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//create object
		Connection con;
		PreparedStatement ps,ps1,ps2,pst;
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
		long appliedforid=1010101;	
	    long projectId=Long.parseLong(request.getParameter("projectId"));
	    String applystatus="Apply";
	    String approvestatus="Pending";
	    String adminconfirmation="-";
	    String query="select max(appliedforId) from sig_appliedfor_project";   //select max of id from ideasumit table 
		PreparedStatement pst=con.prepareStatement(query);
		 rs=pst.executeQuery();
		 long dbappliedfoId=0;
		while(rs.next())
		{
			dbappliedfoId=rs.getLong(1);//to get max of id from ideasubmit table
        }
		if(dbappliedfoId==0)
		{
			appliedforid=dbappliedfoId+appliedforid; 
		}
		else
		{
			appliedforid=dbappliedfoId+1; 
		}
		
		String que="select applystatus from sig_appliedfor_project where projectId=?";
	    ps1=con.prepareStatement(que);
	    ps1.setLong(1,projectId);
	    rs1=ps1.executeQuery();
	    String dbapplystatus="";
	    while(rs1.next())
	    {
	    	dbapplystatus=rs1.getString(1);
	    }
	    if(dbapplystatus.equals("Apply"))
	    {
	    	out.println("<html><body style=background-color:>");
	        out.println("<script type=\"text/javascript\">");
	        out.println("alert('You Already Applied')");
	        out.println("document.location.href = 'sig-dashboard.jsp';\n");
	        out.println("</script>");
	        out.println("</body></html>");	
	         }
	       else
	          {
	    	    String query1="select sigId from sigregi where emailid=?";
			    ps=con.prepareStatement(query1);
			    ps.setString(1,sigemail);
			    r=ps.executeQuery();
			    long dbsigid=0;
	           while(r.next())
	     		 {
	    	   dbsigid=r.getLong(1);
	    	     }
	    	    String query2="insert into sig_appliedfor_project values(?,?,?,?,?,?)";
	    	    ps1=con.prepareStatement(query2);
	    	    ps1.setLong(1,appliedforid);
	    	    ps1.setLong(2,dbsigid);
	    	    ps1.setLong(3,projectId);
	    	    ps1.setString(4,applystatus);
	    	    ps1.setString(5,approvestatus);
	    	    ps1.setString(6,adminconfirmation);
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
	       	  	  }
				catch(Exception e)
				{
				out.println(e);
				}
               }
              }

	


