package com.upgrademybusiness.personalinfo;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

import com.dao.Dao;

/**
 * Servlet implementation class MybusinessProductInfo
 */
//@WebServlet("/MybusinessProductInfo")
public class MybusinessProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//create object of connection,preparedstatement and resultset
		Connection con;
		String message = null;  // message will be sent back to client
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
		HttpSession session=request.getSession();
		String upgrademybusinessemail=(String)session.getAttribute("upgrademybusinessemail");
	long productid=11011;
	String productname=request.getParameter("productname");
	String productimage="-";
    String description=request.getParameter("descriptions");	
		
	String se="select mybusinessId from upgrademybusiness where emailid=?";   //get userid through email id
	ps=con.prepareStatement(se);
	ps.setString(1,upgrademybusinessemail);
	rs1=ps.executeQuery();
	long dbmybusinessId=0;
			while(rs1.next())
			{
				dbmybusinessId=rs1.getLong(1);  //get userid
			}
			
			String query="select max(productId) from upgrademybusinessproductinfo";   //select max of id from ideasumit table 
			PreparedStatement pst=con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			long dbproductId=0;
			while(rs.next())
			{
				dbproductId=rs.getLong(1);//to get max of id from ideasubmit table
	        }
			if(dbproductId==0)
			{
				productid=dbproductId+productid; 
			}
			else
			{
				productid=dbproductId+1; 
			}		
			String quuery1="insert into upgrademybusinessproductinfo values(?,?,?,?,?)";  //insert data into ideasubmit table 
			PreparedStatement pst1=con.prepareStatement(quuery1);
			pst1.setLong(1,productid);
			pst1.setString(2,productname);
		    pst1.setString(3, productimage);
		    pst1.setString(4,description);
			pst1.setLong(5,dbmybusinessId);
			int i=pst1.executeUpdate(); //record inserted successfully.
			if(i>0)
			{
				out.println("<html><body style=background-color:>");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Record Added Successfully....')");
				out.println("document.location.href = 'scaleup-dashboard.jsp';\n");
				out.println("</script>");
				out.println("</body></html>");
				//RequestDispatcher rd=request.getRequestDispatcher("/begin-dashboard.jsp");
				//rd.include(request,response);
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
				Dao.cleanUp(null, ps, rs1);
			}

}
