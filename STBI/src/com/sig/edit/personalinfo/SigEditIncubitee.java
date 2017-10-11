package com.sig.edit.personalinfo;

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
 * Servlet implementation class SigEditIncubitee
 */
@WebServlet("/SigEditIncubitee")
public class SigEditIncubitee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String query;// message will be sent back to client
	PreparedStatement ps,pst;
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
			    long incubiteeid=Long.parseLong(request.getParameter("dbincubiteeId"));
				String incubiteename=request.getParameter("incubiteename");
				String mobileno=request.getParameter("mobileno");
				String emailid=request.getParameter("emailid");
				
				String query="update sig_addincubitee set incubittename=?,incubiteemobilenumber=?,incubitteemailid=? where incubiteeId=?";
				pst=con.prepareStatement(query);
				pst.setString(1,incubiteename);
				pst.setString(2,mobileno);
				pst.setString(3,emailid);
				pst.setLong(4,incubiteeid);
				
			int i=pst.executeUpdate();
			    out.println("<html><body style=background-color:#F0FFF0>");
			    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Record Updated Successfully')");
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
