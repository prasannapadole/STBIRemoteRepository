package com.user.ideasubmit.updateprogress;

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
 * Servlet implementation class IdeasubmitUpdateProgress
 */
//@WebServlet("/IdeasubmitUpdateProgress")
public class IdeasubmitUpdateProgress extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	PreparedStatement pst,pst1;
	String query,query1;
	ResultSet rs;

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
			long ideaupdateprogressid=12234;
		    HttpSession session=request.getSession();
		    String useremail=(String)session.getAttribute("useremail");
		    long ideaid=Long.parseLong(request.getParameter("ideaid"));
		    String currentdate=request.getParameter("date");
		    String milestone=request.getParameter("mname");
		    String milestonetype=request.getParameter("response");
		    String milestonedescription=request.getParameter("description");
		    String deleteupgrade="-";
		    
		    String query="select userId from user where emailid=?";
			pst=con.prepareStatement(query);
			pst.setString(1,useremail);
			rs=pst.executeQuery();
			long dbuserid=0;
			while(rs.next())
				{
				dbuserid=rs.getLong(1);	
				}
		    query="select max(ideaupdateprogressId) from user_ideasubmit_updateprogress"; //get max id of user database
	        pst=con.prepareStatement(query);
	        rs=pst.executeQuery();
	         long dbideaupdateprogressId=0;
	        while(rs.next())
	         {
	        	dbideaupdateprogressId=rs.getLong(1);
	         }
	        if(dbideaupdateprogressId==0)
		     {
	        	ideaupdateprogressid=dbideaupdateprogressId+ideaupdateprogressid;
		     }
		    else
		      {
		    	ideaupdateprogressid=dbideaupdateprogressId+1;
		      }
		 query1="insert into user_ideasubmit_updateprogress values(?,?,?,?,?,?,?,?)";
	     pst1=con.prepareStatement(query1);
	 	 pst1.setLong(1,ideaupdateprogressid);
	 	 pst1.setString(2,currentdate);
	 	 pst1.setString(3,milestone);
	 	 pst1.setString(4,milestonetype);
	 	 pst1.setString(5,milestonedescription);
	 	 pst1.setString(6,deleteupgrade);
	 	 pst1.setLong(7,dbuserid);
	 	 pst1.setLong(8,ideaid);
		 int i=pst1.executeUpdate();	
		 if(i>0)
		     {
				out.println("<html><body style=background-color:>");
		        out.println("<script type=\"text/javascript\">");
		        out.println("alert('Milestone Added Successfully')");
		        out.println("document.location.href = 'begin-update-progress.jsp?dbideaid="+ideaid+"';\n");
		        out.println("</script>");
		        out.println("</body></html>");
		        RequestDispatcher rd=request.getRequestDispatcher("/begin-update-progress.jsp?dbideaid="+ideaid+"");
		        rd.include(request,response);
		       // out.println("<input type=text name=dbideaid value="+ideaid+">");
		 }
		}
		catch(Exception e)
			{
			out.println(e);
			}
		}
	}
 
