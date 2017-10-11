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
import com.sun.net.httpserver.HttpServer;

/**
 * Servlet implementation class AddIncubitee
 */
@WebServlet("/AddIncubitee")
public class AddIncubitee extends HttpServlet {
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
		String sigmail=(String) session.getAttribute("sigmail");
		long iincubitteid=1023;
		String incubiteename=request.getParameter("iname");
		String mobilenumber=request.getParameter("mobilenumber");
		String incubationemailid=request.getParameter("email");
		
		String query="select sigId from sigregi where emailid=?";
		pst=con.prepareStatement(query);
		pst.setString(1,sigmail);
		rs=pst.executeQuery();
		long dbsigid=0;
		while(rs.next())
		{
		dbsigid=rs.getLong(1);	
		}
		
		String query1="select max(incubiteeId) from sig_addincubitee";
		pst1=con.prepareStatement(query1);
		rs1=pst1.executeQuery();
		long dbsincubiteeId=0;
		while(rs1.next())
		{
			dbsincubiteeId=rs1.getLong(1);	
		}
		if(dbsincubiteeId==0)
		{
			iincubitteid=	dbsincubiteeId+iincubitteid;
		}
		else
		{
			iincubitteid=	dbsincubiteeId+1;
		}
		String query2="insert into sig_addincubitee values(?,?,?,?,?)";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,iincubitteid);
		pst2.setString(2,incubiteename);
		pst2.setString(3,mobilenumber);
		pst2.setString(4,incubationemailid);
	    pst2.setLong(5,dbsigid);
		int i=pst2.executeUpdate();
		if(i>0)
		{
			     out.println("<html><body style=background-color:#FFFFFF>");
	    	    out.println("<script type=\"text/javascript\">");
		        out.println("alert('MileStones Added Successfully...')");
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
