package com.user.personal.userinfo;

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
 * Servlet implementation class InsertUserEducation
 */
//@WebServlet("/InsertUserEducation")
public class InsertUserEducation extends HttpServlet
{
		private static final long serialVersionUID = 1L;
	  //create object of connection,preparedstatement and resultset
		Connection con;
		String message = null;  // message will be sent back to client
		PreparedStatement p,ps,pst;
		ResultSet rs,rs1,rs2;
		//call dao class

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
			HttpSession session=request.getSession();
			String useremail=(String)session.getAttribute("useremail");
			long educid=1;
			String college=request.getParameter("name");
			String qualification=request.getParameter("degree");
			String stream=request.getParameter("field");
			String grade=request.getParameter("grade");
			String fromdate=request.getParameter("fromdate");
			String todate=request.getParameter("todate");
			String description=request.getParameter("description");
			String se="select userId from user where emailid=?";   //get userid through email id
			p=con.prepareStatement(se);
			p.setString(1,useremail);
			rs2=p.executeQuery();
			long dbuserId=0;
					while(rs2.next())
						{
						dbuserId=rs2.getLong(1);  //get userid
						}
					String query="select max(eduid) from education";
					pst=con.prepareStatement(query);
					rs=pst.executeQuery();
					long dbeduid=0;
					while(rs.next())
					{
						dbeduid=rs.getLong(1);
					}
					if(dbeduid==0)
					{
						educid=dbeduid+educid;	
					}
					else
					{
						educid=dbeduid+1;
					}
					String query1="insert into education values(?,?,?,?,?,?,?,?,?)";
					ps=con.prepareStatement(query1);
					ps.setLong(1,educid);
					ps.setString(2,college);
					ps.setString(3,qualification);
					ps.setString(4,stream);
					ps.setString(5,grade);
					ps.setString(6,fromdate);
					ps.setString(7,todate);
					ps.setString(8,description);
					ps.setLong(9,dbuserId);
					int i=ps.executeUpdate();
					if(i>0)
					{
						out.println("<html><body style=background-color:>");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Educational details inserted successfully')");
						out.println("document.location.href = 'begin-dashboard.jsp';\n");
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
	Dao.cleanUp(con, p, rs1);
	Dao.cleanUp(null, pst, rs);
    Dao.cleanUp(null, ps, rs2);
	}
}
