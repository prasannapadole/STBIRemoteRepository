package com.upgrademybusiness.projectinfo;

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
 * Servlet implementation class MybusinessAddProject
 */
//@WebServlet("/MybusinessAddProject")
public class MybusinessAddProject extends HttpServlet {
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
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
			long projectid=1010101010;
			HttpSession session=request.getSession();
			String upgrademybusinessemail=(String)session.getAttribute("upgrademybusinessemail");	
			String titleofproject=request.getParameter("proname");
			String projectdesc=request.getParameter("prodescrip");
			String availableresources=request.getParameter("resource");
			String expectedskills=request.getParameter("skills");
			String allocatedfund=request.getParameter("allocate");
			String milestone=request.getParameter("milestone");
			String status=request.getParameter("status");
			String applydate=request.getParameter("applydate");
		    String adminconfirmation="-";
		    long sigId=0,instituteid=0,incubationid=0;
		    int sigdisplay=0,institutedisplay=0,incubationdisplay=0;
		    String sigdeleteprojectdescription="-",institutedeleteprojectdescription="",incubationdeleteprojectdescription="";
		    
		    
		    
		 
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
					String query="select max(projectId) from upgrademybusinessprojectinfo";   //select max of id from ideasumit table 
					PreparedStatement pst=con.prepareStatement(query);
					ResultSet rs=pst.executeQuery();
					long dbprojectId=0;
					while(rs.next())
					{
						dbprojectId=rs.getLong(1);//to get max of id from ideasubmit table
			        }
					if(dbprojectId==0)
					{
						projectid=dbprojectId+projectid; 
					}
					else
					{
						projectid=dbprojectId+1; 
					}		
			
					String quuery1="insert into upgrademybusinessprojectinfo values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  //insert data into ideasubmit table 
					PreparedStatement pst1=con.prepareStatement(quuery1);
				   pst1.setLong(1,projectid);
			       pst1.setString(2,titleofproject);
			     
			       pst1.setString(3,projectdesc );
			      
			       pst1.setString(4,availableresources );
			       pst1.setString(5,expectedskills );
			       pst1.setString(6,allocatedfund );
			       pst1.setString(7,milestone );
			       pst1.setString(8,status );
			       pst1.setString(9,applydate );
			       pst1.setLong(10,dbmybusinessId );
			       pst1.setString(11,adminconfirmation);
			       pst1.setLong(12,sigId);
			       pst1.setLong(13,instituteid);
			       pst1.setLong(14,incubationid);
			       pst1.setInt(15,sigdisplay);
			       pst1.setInt(16,institutedisplay);
			       pst1.setInt(17,incubationdisplay);
			       pst1.setString(18,sigdeleteprojectdescription);
			       pst1.setString(19,institutedeleteprojectdescription);
			       pst1.setString(20,incubationdeleteprojectdescription);
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
