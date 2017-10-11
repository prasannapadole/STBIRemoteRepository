package com.user.idea;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.dao.Dao;

//@WebServlet("/Ideasubmit")
@MultipartConfig(maxFileSize = 16177215) 
public class Ideasubmit extends HttpServlet {
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
							HttpSession session=request.getSession();//create session object
							String useremail=(String)session.getAttribute("useremail");//to get user email through session and convert that into string 
							int ideaid=123456; //to declare id to store max id value of table
							//to get values through userside
							String title=request.getParameter("ideas");
							String keywords=request.getParameter("keyword");
							String keyusers=request.getParameter("solution");
							long maxuuser=Long.parseLong(request.getParameter("keyuser"));
							String targetmarket=request.getParameter("targetmarket");
							String ideadesc=request.getParameter("description");
							String signame=request.getParameter("sig");
							String institutename=request.getParameter("insti");
							String incubationname=request.getParameter("incu");
							InputStream inputStream = null; // input stream of the upload file
							// obtains the upload file part in this multipart request
							Part filePart = request.getPart("pic");
							if (filePart != null) {
								
								inputStream = filePart.getInputStream();
							}
							String date=request.getParameter("today");
							String status=request.getParameter("status");
							String deletedesc="-";//by defaullt this variable pass null
							String adminconfirmation="-";
							String se="select userId from user where emailid=?";   //get userid through email id
							ps=con.prepareStatement(se);
							ps.setString(1,useremail);
							rs1=ps.executeQuery();
							int dbuserId=0;
									while(rs1.next())
									{
										dbuserId=rs1.getInt(1);  //get userid
									}
									String query="select max(ideaid) from ideasubmit";   //select max of id from ideasumit table 
									PreparedStatement pst=con.prepareStatement(query);
									ResultSet rs=pst.executeQuery();
									int dbid=0;
									while(rs.next())
									{
										dbid=rs.getInt(1);//to get max of id from ideasubmit table
							        }
									if(dbid==0)
									{
										ideaid=dbid+ideaid; 
									}
									else
									{
										ideaid=dbid+1; 
									}
									//increase max id by and store in id variable
									String quuery1="insert into ideasubmit values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";  //insert data into ideasubmit table 
									PreparedStatement pst1=con.prepareStatement(quuery1);
									pst1.setInt(1,ideaid);
									pst1.setString(2,title);
									pst1.setString(3,keywords);
									pst1.setString(4,keyusers);
									pst1.setLong(5,maxuuser);
									pst1.setString(6,targetmarket);
									pst1.setString(7,ideadesc);
									pst1.setString(8,signame);
									pst1.setString(9,institutename);
									pst1.setString(10,incubationname);
									if (inputStream != null) 
									{
										pst1.setBlob(11, inputStream);
									}
									pst1.setString(12,date);
									pst1.setString(13,status);
									pst1.setInt(14,dbuserId);
									pst1.setString(15,deletedesc);
									pst1.setString(16,adminconfirmation);
									
								int i=pst1.executeUpdate(); //record inserted successfully.
									if(i>0)
									{
										out.println("<html><body style=background-color:>");
										out.println("<script type=\"text/javascript\">");
										out.println("alert('Your Idea Submitted Successfully....')");
										out.println("document.location.href = 'begin-dashboard.jsp';\n");
										out.println("</script>");
										out.println("</body></html>");
										//RequestDispatcher rd=request.getRequestDispatcher("/begin-dashboard.jsp");
										//rd.include(request,response);
									}
								   }
						       catch (SQLException ex)
						         {
								message = "ERROR: " + ex.getMessage();
								out.println(ex);
						        } 
					          }
	@Override
	public void destroy()
				{
					Dao.cleanUp(con, pst, rs);
					Dao.cleanUp(null, ps, rs1);
				}
		}


