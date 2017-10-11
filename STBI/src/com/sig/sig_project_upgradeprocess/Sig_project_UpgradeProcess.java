package com.sig.sig_project_upgradeprocess;

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
 * Servlet implementation class Sig_project_UpgradeProcess
 */
//@WebServlet("/Sig_project_UpgradeProcess")
public class Sig_project_UpgradeProcess extends HttpServlet {
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
		long sigupgradeprojectprocessId=12234;
	    HttpSession session=request.getSession();
	    String sigemail=(String)session.getAttribute("sigmail");
	    String currentdate=request.getParameter("date");
	    String milestone=request.getParameter("mname");
	    String milestonetype=request.getParameter("response");
	    String milestonedescription=request.getParameter("description");
	    String query="select sigId from sigregi where emailid=?";
		pst=con.prepareStatement(query);
		pst.setString(1,sigemail);
		rs=pst.executeQuery();
		long dbsigid=0;
		while(rs.next())
			{
			dbsigid=rs.getLong(1);	
			}
	    query="select max(sigprojectupgradeId) from sig_project_upgrade_progress"; //get max id of user database
        pst=con.prepareStatement(query);
        rs=pst.executeQuery();
        int dbsigprojectupgradeId=0;
        while(rs.next())
         {
        	dbsigprojectupgradeId=rs.getInt(1);
         }
        if(dbsigprojectupgradeId==0)
	     {
        	sigupgradeprojectprocessId=dbsigprojectupgradeId+sigupgradeprojectprocessId;
	     }
	    else
	      {
	    	sigupgradeprojectprocessId=dbsigprojectupgradeId+1;
	      }
	 query1="insert into sig_project_upgrade_progress values(?,?,?,?,?,?)";
     pst1=con.prepareStatement(query1);
 	 pst1.setLong(1,sigupgradeprojectprocessId);
 	 pst1.setString(2,currentdate);
 	 pst1.setString(3,milestone);
 	 pst1.setString(4,milestonetype);
 	 pst1.setString(5,milestonedescription);
 	 pst1.setLong(6,dbsigid);
	 int i=pst1.executeUpdate();	
	 if(i>0)
	     {
			out.println("<html><body style=background-color:>");
	        out.println("<script type=\"text/javascript\">");
	        out.println("alert('Milestone Added Successfully')");
	        out.println("document.location.href = 'sig-project-upgrade-progress.jsp';\n");
	        out.println("</script>");
	        out.println("</body></html>");
	        RequestDispatcher rd=request.getRequestDispatcher("/sig-project-upgrade-progress.jsp");
	        rd.include(request,response);
	 }
	}
	catch(Exception e)
		{
		out.println(e);
		}
	}
}


