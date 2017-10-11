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
 * Servlet implementation class AddDepratmentInformation
 */
//@WebServlet("/AddDepratmentInformation")
public class AddDepratmentInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try
		     {
			long deptid=1111;
			HttpSession session=request.getSession();
			String instituteemail=(String)session.getAttribute("institutormail");
			String deptname=request.getParameter("dname");
			String hodname=request.getParameter("hodname");
			String mob=request.getParameter("mobilenumber");
			String email=request.getParameter("email");
			long nostudent=Long.parseLong(request.getParameter("nostudent"));
			String description=request.getParameter("description");
			
			 String query1="select instituteId from instituteregi where emailid=?";
	            pst1=con.prepareStatement(query1);
	            pst1.setString(1,instituteemail);
	            rs1=pst1.executeQuery();
	            long dbinstituteid=0;
	            while(rs1.next())
	            {
	            	dbinstituteid=rs1.getLong(1);
	            }
	            
	            String query="select max(deptId) from institutedept";
	            pst=con.prepareStatement(query);
	            rs=pst.executeQuery();
	            int dbdeptid=0;
	            while(rs.next())
	                {
	            	dbdeptid=rs.getInt(1);
	                }
	            if(dbdeptid==0)
	            {
	            	deptid=dbdeptid+deptid;
	            }
	            else
	            {
	            	deptid=dbdeptid+1;
	            }
	            
	            String query2="insert into institutedept values(?,?,?,?,?,?,?,?)";
	            pst2=con.prepareStatement(query2);
	            pst2.setLong(1, deptid);
	            pst2.setString(2, deptname);
	            pst2.setString(3, hodname);
	            pst2.setString(4, mob);
	            pst2.setString(5, email);
	            pst2.setLong(6, nostudent);
	            pst2.setString(7, description);
	            pst2.setLong(8, dbinstituteid);
	            int i=pst2.executeUpdate();
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
