package com.sig.deleteprojectrequest;

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
 * Servlet implementation class RequesttoDeleteproject
 */
//@WebServlet("/RequesttoDeleteproject")
public class RequesttoDeleteproject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//create object
	Connection con;
	PreparedStatement pst,pst1;
	ResultSet rs,rs1;
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
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	  
	      try
	      {
	    	  
	      HttpSession session=request.getSession();
	     String sigmail=(String)session.getAttribute("sigmail");
	      
	      
	      
	    long projectid=Long.parseLong(request.getParameter("projectid"));
	    String deletedescription=request.getParameter("reason");
	     int Sigdisplay=1;
	     String query="select sigId from sigregi where emailid=?";
  	     pst=con.prepareStatement(query);
  	     pst.setString(1,sigmail);
  	     rs=pst.executeQuery();
  	     long dbsigid=0;
  	     while(rs.next())
  	        {
  	    	dbsigid=rs.getLong(1);
  	    	}
  	     
  	     String query1="update upgrademybusinessprojectinfo set sigId=?,sigdisplay=?,sigdeletedesc=? where projectId=?";
  	     pst1=con.prepareStatement(query1);
  	     pst1.setLong(1,dbsigid);
  	     pst1.setInt(2,Sigdisplay);
  	     pst1.setString(3,deletedescription);
  	     pst1.setLong(4,projectid);
  	     
  	     int i=pst1.executeUpdate();
  	     
  	     
  	    out.println("<html><body style=background-color:#F0FFF0>");
	    out.println("<script type=\"text/javascript\">");
        out.println("alert('Project Deletion request send to Admin')");
        out.println("document.location.href = 'sig-dashboard.jsp';\n");
        out.println("</script>");
        out.println("</body></html>");  
  	     
  	       }
	      catch(Exception e)
	      	{
	    	  out.println(e);
	      	}
	      }
        }
