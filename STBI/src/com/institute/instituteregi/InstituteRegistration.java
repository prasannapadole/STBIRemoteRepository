package com.institute.instituteregi;

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
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class InstituteRegistration
 */
//@WebServlet("/InstituteRegistration")
public class InstituteRegistration extends HttpServlet implements Servlet {
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
    	long instituteid=1001;
    	 String institutename=request.getParameter("iname");
    	 String principlename=request.getParameter("pname");
    	 String gender=request.getParameter("pgender");
    	 String mobilenumber=request.getParameter("pmobilenumber");
    	 String principleemailid=request.getParameter("pemail");
    	 String password="-";
    	int noofdept=Integer.parseInt(request.getParameter("dept"));
    	int nooffacultymember=Integer.parseInt(request.getParameter("faculty"));
    	String registered=request.getParameter("registerassig");
    	String institutemobilenumber=request.getParameter("institutemobilenumber");
    	String instituteofficialemail=request.getParameter("instituteemail");
    	String instituteaddress=request.getParameter("address");
    	String city=request.getParameter("city");
    	int pincode=Integer.parseInt(request.getParameter("pincode"));
    	String verification=request.getParameter("check");
		String registatus="Pending";
		String uuidnumber="-";
		String toemailid="-";
		String emailstatus="-";
		String adminconfirmation="-";
		 if(InstituteEmailMatch.checkUser(principleemailid)) // call EmailMatch class method and check email present or not
	       {
		   //mail present  then below code execute
	    	    out.println("<html><body style=background-color:>");
	    	    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Email Already Present,Please Try Another Email Id')");
		        out.println("document.location.href = 'sig-login.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");
		        RequestDispatcher rd=request.getRequestDispatcher("/sig-login.jsp");
	    	    rd.include(request,response);
	       	 
	 	   
	       }else
	       {
		
		
		
		 query="select max(instituteId) from instituteregi"; //get max id of user database
	        pst=con.prepareStatement(query);
	        rs=pst.executeQuery();
	        int dbinstituteId=0;
	        while(rs.next())
	            {
	        	dbinstituteId=rs.getInt(1);
	            }
	        if(dbinstituteId==0)
	        	{
	        	instituteid=dbinstituteId+instituteid;
	        	}
	        else
	        {
	        	instituteid=dbinstituteId+1;
	        }
	        query1="insert into instituteregi values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	        pst1=con.prepareStatement(query1);
	    	pst1.setLong(1,instituteid);
	    	pst1.setString(2,institutename);
	    	pst1.setString(3,principlename);
	    	pst1.setString(4,gender);
	    	pst1.setString(5,mobilenumber);
	    	pst1.setString(6,principleemailid);
	    	pst1.setString(7,password);
	    	pst1.setInt(8,noofdept);
	        pst1.setInt(9,nooffacultymember);
	        pst1.setString(10,registered);
	    	pst1.setString(11,institutemobilenumber);
	    	pst1.setString(12,instituteofficialemail);
	    	pst1.setString(13,instituteaddress);
	    	pst1.setString(14,city);
	    	pst1.setInt(15,pincode);
	    	pst1.setString(16,verification);
	    	pst1.setString(17,registatus);
	    	pst1.setString(18,uuidnumber);
	    	pst1.setString(19,toemailid);
	    	pst1.setString(20,emailstatus);
	    	pst1.setString(21,adminconfirmation);
	    	int i=pst1.executeUpdate();	
	    	    String host = "smtp.gmail.com";
				String to=principleemailid;
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
				msg.setSubject(" Registered Sig Institute");
 	            msg.setContent("<center><table border=0 cellspacing=0 cellpadding=0 class=table_width_100 width=100% style=max-width: 680px; min-width: 300px;> <tr><td></td></tr><tr><td align=center><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td align=center>	<a href=# target=_blank style=color: #596167; font-family: Arial, Helvetica, sans-serif; float:left; width:100%; padding:20px;text-align:center; font-size: 13px;><font face=Arial, Helvetica, sans-seri; font-size: 13px; size=3 color=><img></font></a></td><td align=right></td></tr></table></td></tr><tr><td align=center><font face=Arial, Helvetica, sans-serif size=4 style=font-size: 15px;><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td> <font> Dear "+principlename+",<br/><br><font><b>Congratulations..Your application has been submitted successfully.</b></font><br/><br> Your Submitted Details Are<br/><br>Name:"+principlename+"<br/>InstituteName:"+institutename+"<br/>Registered:"+registered+"<br/>Mobile Number:"+mobilenumber+"<BR>Email ID: "+principleemailid+"<br/><br> Your Password Reset Link Will be forwarded to your registered mail ID. After verification of your Application.<br/><br ><br></font><font>If you have not registered it,Please forward this mail to incubation@samruddhitbi.com<BR>Mention <b>Cancellation of Registration</b> in the subject.<BR><br>TEAM STBI Foundation.</td></tr><tr><td align=center><div style=line-height: 24px;></div><!-- padding --><div style=height: 60px; line-height: 60px; font-size: 10px;></div></td></tr></table></font></td></tr><tr><td class=iage_footer align=center bgcolor=#ffffff><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td align=center style=padding:20px;flaot:left;width:100%; text-align:center;><font face=Arial, Helvetica, sans-serif size=3 color=#96a5b5 style=font-size: 13px;><span style=font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #96a5b5;>2015 © ALL Rights Reserved.</span></font></td></tr></table></td></tr><tr><td></td></tr></table></center>","text/html" );
 	            t = sessionn.getTransport("smtps");
 	            try {
 	            t.connect(host, username, pass);
 	            t.sendMessage(msg, msg.getAllRecipients());
 	                }
 	            finally 
 	                {
 	              t.close();
 	                }
//.........................................................................................................................................................................
 	       InstituteEmailtoAdmin.sendEmail();
 	            
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
	}
