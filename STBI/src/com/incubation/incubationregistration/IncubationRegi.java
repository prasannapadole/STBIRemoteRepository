package com.incubation.incubationregistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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

import com.dao.Dao;


/**
 * Servlet implementation class IncubationRegi
 */
//@WebServlet("/IncubationRegi")
public class IncubationRegi extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection con;
	    PreparedStatement pst,pst1;
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
				long incubationid=101;
				String incubationname=request.getParameter("incuname");
				String thurstarea=request.getParameter("thrustarea");
				String legalstatus=request.getParameter("legal");
				String otherlegal=request.getParameter("otherlegal");
				String otherlegall="";
				if(otherlegal!=null)
				{
					otherlegall=otherlegal;
				}else
				{
					otherlegall="-";	
				}
				
				String totalspace=request.getParameter("space");
				String otherspace=request.getParameter("other");
				String other="";
				if(otherspace!=null)
				{
					other=otherspace;
				}else
				{
					other="-";	
				}
				String incumembername=request.getParameter("incumembername");
				String mobilenumber=request.getParameter("mobilenumber");
				String emailid=request.getParameter("email");
				String password="-";
				String incubationcenteraddress=request.getParameter("address");
				String city=request.getParameter("city");
				int pincode=Integer.parseInt(request.getParameter("pincode"));
				String verification=request.getParameter("check");
				String registatus="Pending";
				String uuidnumber="-";
				String toemailid="-";
				String emailstatus="-";
				String adminconfirmation="-";
				if(IncubationEmailMatch.checkUser(emailid)) // call EmailMatch class method and check email present or not
					{
				   //mail present  then below code execute
			    	    out.println("<html><body style=background-color:>");
			    	    out.println("<script type=\"text/javascript\">");
				        out.println("alert('Email Already Present,Please Try Another Email Id')");
				        out.println("document.location.href = 'begin-login.jsp';\n");
				        out.println("</script>");
				        out.println("</body></html>");
				        RequestDispatcher rd=request.getRequestDispatcher("/sig-login.jsp");
			    	    rd.include(request,response);
					}else
					{
						query="select max(incubationId) from incubationregi"; //get max id of user database
				        pst=con.prepareStatement(query);
				        rs=pst.executeQuery();
				        int dbincuId=0;
				        while(rs.next())
				        {
				        	dbincuId=rs.getInt(1);
				        }
				        if(dbincuId==0)
				        	{
				        	incubationid=dbincuId+incubationid;
				        }
				      else
				        {
				    	  incubationid=dbincuId+1;
				        }
			      
				        query1="insert into incubationregi values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				        pst1=con.prepareStatement(query1);
				    	pst1.setLong(1,incubationid);
				    	pst1.setString(2,incubationname);
				    	pst1.setString(3,thurstarea);
				    	pst1.setString(4,legalstatus);
				    	pst1.setString(5,otherlegall);
				    	pst1.setString(6,totalspace);
				    	pst1.setString(7,other);
				    	pst1.setString(8,incumembername);
				    	pst1.setString(9,mobilenumber);
				    	pst1.setString(10,emailid);
				    	pst1.setString(11,password);
				        pst1.setString(12,incubationcenteraddress);
				        pst1.setString(13,city);
				    	pst1.setInt(14,pincode);
				    	pst1.setString(15,verification);
				    	pst1.setString(16,registatus);
				    	pst1.setString(17,uuidnumber);
				    	pst1.setString(18,toemailid);
				    	pst1.setString(19,emailstatus);
				    	pst1.setString(20,adminconfirmation);
				    	int i=pst1.executeUpdate();
				    	
				    	String host = "smtp.gmail.com";
						String to=emailid;
						String username = "samruddhitbi@rlard.com";
						String pass = "Anarkali@123";
						Properties props = new Properties();
						Session sessionn = Session.getInstance(props);
						MimeMessage msg = new MimeMessage(sessionn);
						Transport t = sessionn.getTransport("smtps");
						props = new Properties();
						props.put("mail.debug", true);
						msg = new MimeMessage(sessionn);
						msg.setFrom(new InternetAddress(username));
						msg.setRecipient(RecipientType.TO, new InternetAddress(to));
						msg.setSubject(" Registered Sig Incubator");
		    	        msg.setContent("<center><table border=0 cellspacing=0 cellpadding=0 class=table_width_100 width=100% style=max-width: 680px; min-width: 300px;> <tr><td></td></tr><tr><td align=center><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td align=center>	<a href=# target=_blank style=color: #596167; font-family: Arial, Helvetica, sans-serif; float:left; width:100%; padding:20px;text-align:center; font-size: 13px;><font face=Arial, Helvetica, sans-seri; font-size: 13px; size=3 color=><img></font></a></td><td align=right></td></tr></table></td></tr><tr><td align=center><font face=Arial, Helvetica, sans-serif size=4 style=font-size: 15px;><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td> <font> Dear "+incumembername+",<br/><br><font><b>Congratulations..Your application has been submitted successfully.</b></font><br/><br> Your Submitted Details Are<br/><br> Incubation Name:"+incubationname+"<br/>ThurstArea:"+thurstarea+"<br/>Legal Status:"+legalstatus+"<br/>Other LegalStatus:"+otherlegall+"</BR>Mobile Number:"+mobilenumber+"<BR>Email ID: "+emailid+"<br/><br> Your Password Reset Link Will be forwarded to your registered mail ID. After verification of your Application.<br/><br ><br></font><font>If you have not registered it,Please forward this mail to incubation@samruddhitbi.com<BR>Mention <b>Cancellation of Registration</b> in the subject.<BR><br>TEAM STBI Foundation.</td></tr><tr><td align=center><div style=line-height: 24px;></div><!-- padding --><div style=height: 60px; line-height: 60px; font-size: 10px;></div></td></tr></table></font></td></tr><tr><td class=iage_footer align=center bgcolor=#ffffff><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td align=center style=padding:20px;flaot:left;width:100%; text-align:center;><font face=Arial, Helvetica, sans-serif size=3 color=#96a5b5 style=font-size: 13px;><span style=font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #96a5b5;>2015 © ALL Rights Reserved.</span></font></td></tr></table></td></tr><tr><td></td></tr></table></center>","text/html" );
		    	        t = sessionn.getTransport("smtps");
		    	        	try {
		    	        			t.connect(host, username, pass);
		    	        			t.sendMessage(msg, msg.getAllRecipients());
		    	        		}
		    	        	finally 
		    	        		{
		    	        		t.close();
		    	        		}
//...........................................................................................................................................................................		    	     
		    	        	IncubationMailtoadmin.sendEmail();  //send mail to admin through this class
//...........................................................................................................................................................................		    	    
				    	out.println("<html><body style=background-color:>");
			   	        out.println("<script type=\"text/javascript\">");
			   	        out.println("alert('Your application will be verified by administration.Then your account will be enable for further access')");
			   	        out.println("document.location.href = 'sig-login.jsp';\n");
			   	        out.println("</script>");
			   	        out.println("</body></html>");
				        RequestDispatcher rd=request.getRequestDispatcher("/sig-login.jsp");
			   	        rd.include(request,response);	
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

	}


	}
