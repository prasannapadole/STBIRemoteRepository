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

/**
 * Servlet implementation class MybusinessSkillDevelopment
 */
//@WebServlet("/MybusinessSkillDevelopment")
public class MybusinessSkillDevelopment extends HttpServlet {
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
			long skilldevelopmentid=100101;
			HttpSession session=request.getSession();
			String upgrademybusinessemail=(String)session.getAttribute("upgrademybusinessemail");
			String coursetitle=request.getParameter("coursname");
			String coursedesc=request.getParameter("descriptionss");
			String level=request.getParameter("myVar");
			String courseprerequisite=request.getParameter("courseprere");
			String courseduration=request.getParameter("duration");
			String coursedurationmonthorweek=request.getParameter("month");
			String coursecredit=request.getParameter("credit");
			String courseobjectives=request.getParameter("objective");
			String courseoutcome=request.getParameter("outcome");
			String coursemodules=request.getParameter("module");
			String courselab=request.getParameter("tools");
			String referencebook=request.getParameter("reference");
			
			String se="select mybusinessId from upgrademybusiness where emailid=?";   //get userid through email id
			ps=con.prepareStatement(se);
			ps.setString(1,upgrademybusinessemail);
			rs1=ps.executeQuery();
			long dbmybusinessId=0;
					while(rs1.next())
					{
						dbmybusinessId=rs1.getLong(1);  //get userid
					}
					
					String query="select max(skilldevelopmentId) from upgrademybusinessskilldevelopment";   //select max of id from ideasumit table 
					PreparedStatement pst=con.prepareStatement(query);
					ResultSet rs=pst.executeQuery();
					long dbskilldevelopmentId=0;
					while(rs.next())
					{
						dbskilldevelopmentId=rs.getLong(1);//to get max of id from ideasubmit table
			        }
					if(dbskilldevelopmentId==0)
					{
						skilldevelopmentid=dbskilldevelopmentId+skilldevelopmentid; 
					}
					else
					{
						skilldevelopmentid=dbskilldevelopmentId+1; 
					}	
			
					String quuery1="insert into upgrademybusinessskilldevelopment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  //insert data into ideasubmit table 
					PreparedStatement pst1=con.prepareStatement(quuery1);
					pst1.setLong(1,skilldevelopmentid);
			       pst1.setString(2,coursetitle);
			       pst1.setString(3,coursedesc );
			       pst1.setString(4,level );
			       pst1.setString(5,courseprerequisite );
			       pst1.setString(6,courseduration );
			       pst1.setString(7,coursedurationmonthorweek );
			       pst1.setString(8,coursecredit );
			       pst1.setString(9,courseobjectives );
			       pst1.setString(10,courseoutcome );
			       pst1.setString(11,coursemodules );
			       pst1.setString(12,courselab );
			       pst1.setString(13,referencebook );
			       pst1.setLong(14,dbmybusinessId );
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
