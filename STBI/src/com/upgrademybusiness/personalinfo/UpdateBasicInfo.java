package com.upgrademybusiness.personalinfo;

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
import com.user.personal.userinfo.CheckEmail;
import com.user.personal.userinfo.CheckUserMobile;

/**
 * Servlet implementation class UpdateBasicInfo
 */
//@WebServlet("/UpdateBasicInfo")
public class UpdateBasicInfo extends HttpServlet 
{
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
				String email=(String)session.getAttribute("upgrademybusinessemail");
				String mobile=request.getParameter("mobilenumber");
				String newemail=request.getParameter("email");
				String companyofficeaddress=request.getParameter("address");
				String companydescription=request.getParameter("companydescription");
				
				if(MybusinessCheckEmail.checkUser(newemail))
				{
					out.println("<html><body>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Email ID Already Registered,Please  try another Email Id')");
					out.println("document.location.href = 'scaleup-dashboard.jsp';\n");
					out.println("</script>");
					out.println("</body></html>");		
				}
				else if(MybusinessCheckMobile.checkUser(mobile))
				{
					out.println("<html><body>");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Mobile Number Already Registered,Please try another Mobile Number')");
					out.println("document.location.href = 'scaleup-dashboard.jsp';\n");
					out.println("</script>");
					out.println("</body></html>");		
				}
				else
				{
				String se="select mybusinessId from upgrademybusiness where emailid=?";   
				ps=con.prepareStatement(se);
				ps.setString(1,email);
				rs1=ps.executeQuery();
				long dbupgrademybusinessid=0;
						while(rs1.next())
						{
							dbupgrademybusinessid=rs1.getLong(1);  //get userid
						}
						String query="update upgrademybusiness set mobilenumber=?,emailid=?,companyofficeaddress=?,companydescription=? where mybusinessId=?";
						pst=con.prepareStatement(query);
						pst.setString(1,mobile);
						pst.setString(2,newemail);
						pst.setString(3,companyofficeaddress);
						pst.setString(4,companydescription);
						pst.setLong(5,dbupgrademybusinessid);
						int i=pst.executeUpdate();
						if(i>0)
						    {
							out.println("<html><body>");
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Record updated successfully')");
							out.println("document.location.href = 'scaleup-dashboard.jsp';\n");
							out.println("</script>");
							out.println("</body></html>");
							email=newemail;
							session.setAttribute("upgrademybusinessemail",email);
							
						    }
				          }
			            }
				   catch(Exception e)
		                  {
			              out.println(e);
		                  }	
	                     }
                        }
