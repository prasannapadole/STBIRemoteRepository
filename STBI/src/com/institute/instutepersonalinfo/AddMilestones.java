package com.institute.instutepersonalinfo;

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
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class AddMilestones
 */
//@WebServlet("/AddMilestones")
public class AddMilestones extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
     PreparedStatement ps,pst,pst1;
     ResultSet rs,rs1;
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
			    long milestoneid=1001;
			    HttpSession session=request.getSession();
			    String instituteemail=(String)session.getAttribute("institutormail");
			    String datee=request.getParameter("dates");
			    String milestonename=request.getParameter("milename");
			    String milestonetype=request.getParameter("milestone");
			    String milestonedescription=request.getParameter("description");
			    
			    String query="select instituteId from instituteregi where emailid=?";
				pst=con.prepareStatement(query);
				pst.setString(1,instituteemail);
				rs=pst.executeQuery();
				long dbinstituteid=0;
				while(rs.next())
					{
						dbinstituteid=rs.getLong(1);	
					}
				
				 String query1="select max(institutemilestonId) from institutemilestone";
		            ps=con.prepareStatement(query1);
		            rs1=ps.executeQuery();
		            long dbinstituteidmilestone=0;
		            while(rs1.next())
		            {
		            	dbinstituteidmilestone=rs1.getLong(1);	
		            }
				 	if(dbinstituteid==0)
				 		{
				 		milestoneid=dbinstituteidmilestone+milestoneid;
				 		}
				 	else
				 		{
		            	milestoneid=dbinstituteidmilestone+1;
				 		}
		            
	          String query2="insert into institutemilestone values(?,?,?,?,?,?)";
	          pst1=con.prepareStatement(query2);
	          pst1.setLong(1,milestoneid);
			  pst1.setString(2,datee); 
			  pst1.setString(3,milestonename);
			  pst1.setString(4,milestonetype);
			  pst1.setString(5,milestonedescription);
			  pst1.setLong(6,dbinstituteid);
			int i=pst1.executeUpdate();
			if(i>0)
			{
				out.println("<html><body style=background-color:>");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Record Added successfully')");
				out.println("document.location.href = 'institute-dashboard.jsp';\n");
				out.println("</script>");
				out.println("</body></html>");	
			}
			    
			    
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

}
