package com.incubation.incubationpersobalinfo;

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
 * Servlet implementation class IncubationDetails
 */
//@WebServlet("/IncubationDetails")
public class IncubationDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
    PreparedStatement pst,pst1;
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
		out.println("Hello");
		try
			{
			HttpSession session=request.getSession();
			String incubationemail=(String)session.getAttribute("incubationemail");
			long incubationdeatilId=112;
			String nameofincubatiion=request.getParameter("incuname");
			String incubationprofile=request.getParameter("profile");
			String noofteammember=request.getParameter("team");
			String dateofstartup=request.getParameter("dates");
			String legalstatus=request.getParameter("legalstatus");
	
			String query="select incubationId from incubationregi where emailid=?";
			pst=con.prepareStatement(query);
			pst.setString(1,incubationemail);
			rs=pst.executeQuery();
			long dbincubationid=0;
			while(rs.next())
				{
				dbincubationid=rs.getLong(1);	
				}
			String query1="select max(incubationdetailId) from incubationdetail";
	         pst1=con.prepareStatement(query1);
	         rs1=pst1.executeQuery();
	         long dbincubationdetailId=0;
	         while(rs1.next())
	         {
	        	 dbincubationdetailId=rs1.getLong(1); 
	         }
		 	if(dbincubationdetailId==0)
		 		{
		 		incubationdeatilId=dbincubationdetailId+incubationdeatilId;
		 		}
		 	else
		 		{
		 		incubationdeatilId=dbincubationdetailId+1;
		 		}
	         	String query2="insert into incubationdetail values(?,?,?,?,?,?,?)";
	         	pst1=con.prepareStatement(query2);
	         	pst1.setLong(1,incubationdeatilId);
			 	pst1.setString(2,nameofincubatiion); 
			 	pst1.setString(3,incubationprofile);
			 	pst1.setString(4,noofteammember);
			 	pst1.setString(5,dateofstartup);
			 	pst1.setString(6,legalstatus);
			 	pst1.setLong(7,dbincubationid);
			 	int i=pst1.executeUpdate();
			 	if(i>0)
			 		{
				out.println("<html><body style=background-color:>");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Record Added successfully')");
				out.println("document.location.href = 'incubation-dashboard.jsp';\n");
				out.println("</script>");
				out.println("</body></html>");	
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
	Dao.cleanUp(null, pst1, rs1);
		}
	}
