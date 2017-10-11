package com.user.newuser.request.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class UserRequestSupportPage
 */
//@WebServlet("/UserRequestSupportPage")
public class UserRequestSupportPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
    PreparedStatement ps,pst;
    String query,query1;
    ResultSet rs;

public void init(ServletConfig config) throws ServletException
			{
         		try
         			{
         			con = Dao.getConnection();//call getconnection metho of dao class
         			}
         		catch (ClassNotFoundException | IOException | SQLException e) 
         			{
         			// TODO Auto-generated catch block
         			e.printStackTrace();
         			}
			}        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
			{
			long chatid=1;
			long ideaid=Long.parseLong(request.getParameter("ideaid"));
			String supporttype=request.getParameter("support");
			String requestmsg=request.getParameter("requestdetails");
			long userid=Long.parseLong(request.getParameter("userid"));
			String hint=request.getParameter("hint");
			if(hint==null)
			{
				hint="begin-dashboard.jsp";
			}
			else
			{
				hint="begin-user-view-idea.jsp?supporttypejs="+supporttype+"&ideaid="+ideaid;
			}
				
			DateFormat df=new SimpleDateFormat("dd/MM/yyyy");
			DateFormat df2=new SimpleDateFormat("HH:mm:ss");
			df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
			df2.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
			Date today=Calendar.getInstance().getTime();
			String requestdate=df.format(today);
			String requesttime=df2.format(today);
			String query="select max(chatid) from chat";
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			long dbchatid=0;
			while(rs.next())
				{
				dbchatid=rs.getLong(1);
				}
			if(dbchatid!=0)
				{
				chatid=dbchatid+1;
				}
			String query1="insert into chat values(?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(query1);
			ps.setLong(1,chatid);
			ps.setLong(2,ideaid);
			ps.setString(3,supporttype);
			ps.setLong(4,userid);
			ps.setString(5, requestmsg);
			ps.setString(6, null);
			ps.setString(7, requestdate);
			ps.setString(8, requesttime);
			ps.setString(9, null);
			int i=ps.executeUpdate();
			
			
			if(i>0)
				{
				out.println("<html><body style=background-color:>");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Support request send successfully')");
				out.println("document.location.href = '"+hint+"';\n");
				out.println("</script>");
				out.println("</body></html>");	
				
				/*RequestDispatcher rd=request.getRequestDispatcher(hint);
				rd.forward(request, response);*/
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
Dao.cleanUp(null, ps,null);
}

}
