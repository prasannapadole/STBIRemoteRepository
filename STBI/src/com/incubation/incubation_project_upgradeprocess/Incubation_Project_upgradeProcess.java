package com.incubation.incubation_project_upgradeprocess;

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
 * Servlet implementation class Incubation_Project_upgradeProcess
 */
//@WebServlet("/Incubation_Project_upgradeProcess")
public class Incubation_Project_upgradeProcess extends HttpServlet {
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
						long incubationprojectupgradeprocessId=12234;
					    HttpSession session=request.getSession();
					    String incubutionemailid=(String)session.getAttribute("incubationemail");
					    String currentdate=request.getParameter("date");
					    String milestone=request.getParameter("mname");
					    String milestonetype=request.getParameter("response");
					    String milestonedescription=request.getParameter("description");
				    
					    String query="select incubationId from incubationregi where emailid=?";
						pst=con.prepareStatement(query);
						pst.setString(1,incubutionemailid);
						rs=pst.executeQuery();
						long dbincubationId=0;
						while(rs.next())
							{
							dbincubationId=rs.getLong(1);	
							}
					    query="select max(incubationprojectupgradeId) from incubation_project_upgrade_process"; //get max id of user database
				        pst=con.prepareStatement(query);
				        rs=pst.executeQuery();
				        long dbincubationprojectupgradeId=0;
				        while(rs.next())
				        	{
				        		dbincubationprojectupgradeId=rs.getLong(1);
				        	}
				        if(dbincubationprojectupgradeId==0)
				        	{
				        		incubationprojectupgradeprocessId=dbincubationprojectupgradeId+incubationprojectupgradeprocessId;
				        	}
				        else
				        	{
				        		incubationprojectupgradeprocessId=dbincubationprojectupgradeId+1;
				        	}
					 query1="insert into incubation_project_upgrade_process values(?,?,?,?,?,?)";
				     pst1=con.prepareStatement(query1);
				 	 pst1.setLong(1,incubationprojectupgradeprocessId);
				 	 pst1.setString(2,currentdate);
				 	 pst1.setString(3,milestone);
				 	 pst1.setString(4,milestonetype);
				 	 pst1.setString(5,milestonedescription);
				 	 pst1.setLong(6,dbincubationId);
					 int i=pst1.executeUpdate();	
					 	if(i>0)
					     	{
							out.println("<html><body style=background-color:>");
					        out.println("<script type=\"text/javascript\">");
					        out.println("alert('Milestone Added Successfully')");
					        out.println("document.location.href = 'incubation-project-upgrade-progress.jsp';\n");
					        out.println("</script>");
					        out.println("</body></html>");
					        RequestDispatcher rd=request.getRequestDispatcher("/incubation-project-upgrade-progress.jsp");
					        rd.include(request,response);
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
Dao.cleanUp(null,pst1,null);
	}
	}
