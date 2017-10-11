package com.upgrademybusiness.mybusinessforgotpass;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
import com.user.forgot.userpassword.ForgotUserDao;

/**
 * Servlet implementation class MyBusinessForgotpass
 */
//@WebServlet("/MyBusinessForgotpass")
public class MyBusinessForgotpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//create object
	Connection con;
	PreparedStatement pst;
	ResultSet rs,rs1;
	RequestDispatcher rd,rd1;
 
public void init(ServletConfig config) throws ServletException
{
	try {
			con = Dao.getConnection();//access dao class getconnection method
		    } 
		catch (ClassNotFoundException | IOException | SQLException e)
			{
		e.printStackTrace();
			}
}
private static final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//create object

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	   String url= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +request.getContextPath();
	
	try {
			HttpSession sess=request.getSession();
			String email=request.getParameter("email");
		    sess.setAttribute("email",email);
		    UUID uuid = UUID.randomUUID();//generate random number
			String randomUUIDString = uuid.toString();//convert random into string
	        Date from;
		    from=new Date();
		    String fromm=(String)sdf.format(from);	 
		    Calendar cal = Calendar.getInstance();
			cal.setTime(from);
			cal.add(Calendar.MINUTE,30);
			String tooo = sdf.format(cal.getTime());
			System.out.println(tooo);
			String status="Unhit";
            String query1="select password,registrationstatus from upgrademybusiness where emailid=?";
			pst=con.prepareStatement(query1);
		    pst.setString(1,email);
		    rs1=pst.executeQuery();
		    String dbpass="",dbregi="";
            while(rs1.next())
	          {
		    dbpass=rs1.getString("password"); 
		    dbregi=rs1.getString("registrationstatus");
		      }
            	if(dbpass.equals("-") || dbregi.equals("Pending") )
            		{
					    out.println("<html><body style=background-color:#F0FFF0>");
			   	        out.println("<script type=\"text/javascript\">");
				        out.println("alert('You Are Not A Approved User')");
				        out.println("document.location.href = 'scaleup-login.jsp';\n");
				        out.println("</script>");
				        out.println("</body></html>"); 
            		} 
            	else if(MyBusinessForgotDao.checkUser(email))
					{
					     String query="update upgrademybusiness set uuidnumber=?,emailtodate=?,emailstatus=? where emailid=?";
	                     pst=con.prepareStatement(query);
					     pst.setString(1,randomUUIDString);
					     pst.setString(2,tooo);
					     pst.setString(3,status);
					     pst.setString(4,email);
					     int i=pst.executeUpdate();
									     String host = "smtp.gmail.com";
								         String to=email;
								         String username = "samruddhitbi@rlard.com";
								         String password = "Anarkali@123";
								         Properties props = new Properties();
								         Session sessionn = Session.getInstance(props);
								         MimeMessage msg = new MimeMessage(sessionn);
								         Transport t = sessionn.getTransport("smtps");
								         props = new Properties();
								         props.put("mail.debug", true);
								         msg = new MimeMessage(sessionn);
								         msg.setFrom(new InternetAddress(username));
								         msg.setRecipient(RecipientType.TO, new InternetAddress(to));
								         msg.setSubject("Reset Password");
								         msg.setContent("Click On this link to reset Your password.<br><br><br>"+url+"/upgrademybusiness-resetpassword.jsp?code="+randomUUIDString+"&email="+email,"text/html" );
								         t = sessionn.getTransport("smtps");
									    out.println("<html><body style=background-color:#F0FFF0>");
						        	    out.println("<script type=\"text/javascript\">");
						    	        out.println("alert('Verification Mail Sent On Your Email Id.......')");
						    	        out.println("document.location.href = 'scaleup-login.jsp';\n");
						    	        out.println("</script>");
						    	        out.println("</body></html>");
								         try {
								           t.connect(host, username, password);
								           t.sendMessage(msg, msg.getAllRecipients());
								               }
								           finally 
								           {
								           t.close();
								            }
								           }
									     else 
									        {
									    	 out.println("<html><body style=background-color:#F0FFF0>");
								        	 out.println("<script type=\"text/javascript\">");
								    	     out.println("alert('Incorrect Email ID')");
								             out.println("document.location.href = 'upgrade-mybusiness-forgotpassword.jsp';\n");
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
					Dao.cleanUp(con, pst, rs);
					Dao.cleanUp(null, null, rs1);
					}
                   }
