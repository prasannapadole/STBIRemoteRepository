package com.upgrademybusiness.internshipdetails;

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
 * Servlet implementation class MybusinessInternshipDetails
 */
//@WebServlet("/MybusinessInternshipDetails")
public class MybusinessInternshipDetails extends HttpServlet {
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
			long internshipid=101010;
			HttpSession session=request.getSession();
			String upgrademybusinessemail=(String)session.getAttribute("upgrademybusinessemail");
			String titleofinternship=request.getParameter("interntitle");
			String other=request.getParameter("other");
			String otherr="";
			if(other!=null)
			{
				otherr=	other;
			}
			else
			{
				otherr="-";
			}
		    String internshiplocation=request.getParameter("location");
			String typeofinternship=request.getParameter("typeinter");
			String stipend=request.getParameter("stipend");
			String internshipduration=request.getParameter("interduration");
			String internshipdurationmonthorweek=request.getParameter("month");
			String vacancies=request.getParameter("opening");
			String skills=request.getParameter("proskill");
			String internshipdesc=request.getParameter("interndiscrip");
			String status=request.getParameter("status");
			String applydate=request.getParameter("applydate");
		    String adminconfirmation="-";
	//..........................................................................................................
		    long instituteid=0;
		    int institutedisplay=0;
		    String institutedeleteinternshiprequest="-";
		    
		    
			String se="select mybusinessId,industryname,companydescription from upgrademybusiness where emailid=?";   //get userid through email id
			ps=con.prepareStatement(se);
			ps.setString(1,upgrademybusinessemail);
			rs1=ps.executeQuery();
			long dbmybusinessId=0;
			String dbindustryname="",dbcompanydescription=""; 
					while(rs1.next())
					{
						dbmybusinessId=rs1.getLong(1);
						dbindustryname=rs1.getString(2);
						dbcompanydescription=rs1.getString(3);
					}
					
					String query="select max(internsId) from upgrademybusinesssinternship";//select max of id from ideasumit table 
					PreparedStatement pst=con.prepareStatement(query);
					ResultSet rs=pst.executeQuery();
					long dbinternsId=0;
					while(rs.next())
					{
						dbinternsId=rs.getLong(1);//to get max of id from ideasubmit table
			        }
					if(dbinternsId==0)
					{
						internshipid=dbinternsId+internshipid; 
					}
					else
					{
						internshipid=dbinternsId+1; 
					}		
					String quuery1="insert into upgrademybusinesssinternship values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  //insert data into ideasubmit table 
					PreparedStatement pst1=con.prepareStatement(quuery1);
				   pst1.setLong(1,internshipid);
			       pst1.setString(2,titleofinternship);
			       pst1.setString(3,otherr);
			      
			       pst1.setString(4,internshiplocation );
			       pst1.setString(5,typeofinternship );
			       pst1.setString(6,stipend );
			       pst1.setString(7,internshipduration );
			       pst1.setString(8,internshipdurationmonthorweek );
			       pst1.setString(9,vacancies );
			       pst1.setString(10,skills );
			       pst1.setString(11,internshipdesc );
			     
			       pst1.setString(12,status );
			       pst1.setString(13,applydate );
			       pst1.setLong(14,dbmybusinessId);
			       pst1.setString(15,adminconfirmation);
			       pst1.setLong(16,instituteid);
			       pst1.setInt(17,institutedisplay);
			       pst1.setString(18,institutedeleteinternshiprequest);
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
				}
