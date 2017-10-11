package com.institute.institute_internship_upgradeprocess;

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
 * Servlet implementation class Institute_Internship_upgradeProcess
 */
//@WebServlet("/Institute_Internship_upgradeProcess")
public class Institute_Internship_upgradeProcess extends HttpServlet {
	
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
			long instituteupgradeprocessId=12234;
		    HttpSession session=request.getSession();
		    String institutormail=(String)session.getAttribute("institutormail");
		    String currentdate=request.getParameter("date");
		    String milestone=request.getParameter("mname");
		    String milestonetype=request.getParameter("response");
		    String milestonedescription=request.getParameter("description");
		    
		    String query="select instituteId from instituteregi where emailid=?";
			pst=con.prepareStatement(query);
			pst.setString(1,institutormail);
			rs=pst.executeQuery();
			long dbinstituteid=0;
			while(rs.next())
				{
				dbinstituteid=rs.getLong(1);	
				}
		    query="select max(instituteinternshipupgradeId) from institute_internship_upgradeprogress"; //get max id of user database
	        pst=con.prepareStatement(query);
	        rs=pst.executeQuery();
	        int dbinstituteinternshipupgradeId=0;
	        while(rs.next())
	         {
	        	dbinstituteinternshipupgradeId=rs.getInt(1);
	         }
	        if(dbinstituteinternshipupgradeId==0)
		     {
	        	instituteupgradeprocessId=dbinstituteinternshipupgradeId+instituteupgradeprocessId;
		     }
		    else
		      {
		    	instituteupgradeprocessId=dbinstituteinternshipupgradeId+1;
		      }
		 query1="insert into institute_internship_upgradeprogress values(?,?,?,?,?,?)";
	     pst1=con.prepareStatement(query1);
	 	 pst1.setLong(1,instituteupgradeprocessId);
	 	 pst1.setString(2,currentdate);
	 	 pst1.setString(3,milestone);
	 	 pst1.setString(4,milestonetype);
	 	 pst1.setString(5,milestonedescription);
	 	 pst1.setLong(6,dbinstituteid);
		 int i=pst1.executeUpdate();	
		 if(i>0)
		     {
				out.println("<html><body style=background-color:>");
		        out.println("<script type=\"text/javascript\">");
		        out.println("alert('Milestone Added Successfully')");
		        out.println("document.location.href = 'institute-internship-upgrade-progress.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");
		        RequestDispatcher rd=request.getRequestDispatcher("/institute-internship-upgrade-progress.jsp");
		        rd.include(request,response);
		 }
		}
		catch(Exception e)
			{
			out.println(e);
			}
		}	}


