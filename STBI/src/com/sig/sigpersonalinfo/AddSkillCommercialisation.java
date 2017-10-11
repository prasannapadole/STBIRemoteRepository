package com.sig.sigpersonalinfo;

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
 * Servlet implementation class AddSkillCommercialisation
 */
//@WebServlet("/AddSkillCommercialisation")
public class AddSkillCommercialisation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//create object of connection,preparedstatement and resultset
	Connection con;

	PreparedStatement pst,pst1,pst2;
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
			HttpSession session=request.getSession();
			String sigemail=(String)session.getAttribute("sigmail");
			System.out.println(sigemail);
			long addskillid=111;
			String title=request.getParameter("title");
			String leadfaculty=request.getParameter("lead");
			String facultymember=request.getParameter("member");
			String memberofstudent=request.getParameter("students");
			String description=request.getParameter("description");
		
			String query="select sigId from sigregi where emailid=?";
			pst=con.prepareStatement(query);
			pst.setString(1,sigemail);
			rs=pst.executeQuery();
			long dbsigid=0;
			while(rs.next())
				{
				dbsigid=rs.getLong(1);	
				}
			
			String query1="select max(techId) from sigtechnologyskill";
			pst1=con.prepareStatement(query1);
			rs1=pst1.executeQuery();
			long dbtechskillid=0;
			while(rs1.next())
			{
				dbtechskillid=rs1.getLong(1);	
			}
			
			if(dbtechskillid==0)
			{
				addskillid=dbtechskillid+addskillid;	
			}
			else
			{
				addskillid=dbtechskillid+1;
			}
			
		String query2="insert into sigtechnologyskill values(?,?,?,?,?,?,?)";
		pst2=con.prepareStatement(query2);
		pst2.setLong(1,addskillid);
		pst2.setString(2,title);
		pst2.setString(3,leadfaculty);
        pst2.setString(4,facultymember);
        pst2.setString(5,memberofstudent);
        pst2.setString(6,description);
        pst2.setLong(7,dbsigid);
  
		int i=pst2.executeUpdate();
		
    
    	out.println("<html><body style=background-color:>");
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Skills Add Successfully....')");
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
