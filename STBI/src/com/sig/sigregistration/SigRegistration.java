package com.sig.sigregistration;
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
import com.user.controller.EmailMatch;
//@WebServlet("/SigRegistration")
public class SigRegistration extends HttpServlet {
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
		System.out.println("welcome");
		try
		{
		
		long sigid=100;
		String siggroupname=request.getParameter("signame");
		String areaofspecialisation=request.getParameter("special");
		String groupleadname=request.getParameter("leadname");
		String sigtype=request.getParameter("sigtype");
		String association=request.getParameter("association");
		String associationn="";
				if(association!=null)
				{
					associationn=association;
				}else
				{
					associationn="-";   
				}
		String academicname=request.getParameter("academicname"); 
		String academicnamee="";
		if(academicname!=null)
		{
			academicnamee=academicname;	
		}else{
			academicnamee="-";	
		}
		String mobilenumber=request.getParameter("mobilenumber");
		String sigemail=request.getParameter("email");
		String password="-";
		String sigleaderaddress=request.getParameter("taddress");
		String city=request.getParameter("city");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		String verification=request.getParameter("check");
		String registatus="Pending";
		String uuidnumber="-";
		String toemailid="-";
		String emailstatus="-";
		String adminconfirmation="-";
		 if(SigEmailMatch.checkUser(sigemail)) // call EmailMatch class method and check email present or not
	       {
		   //mail present  then below code execute
	    	    out.println("<html><body style=background-color:#FFFFFF>");
	    	    out.println("<script type=\"text/javascript\">");
		        out.println("alert('Email Already Present,Please Try Another Email Id')");
		        out.println("document.location.href = 'sig-login.jsp';\n");
		        out.println("</script>");
		        out.println("</body></html>");
		        RequestDispatcher rd=request.getRequestDispatcher("/sig-login.jsp");
	    	    rd.include(request,response);
	       	 
	 	   
	       }else
	       {
		
		 query="select max(sigId) from sigregi"; //get max id of user database
	        pst=con.prepareStatement(query);
	        rs=pst.executeQuery();
	        int dbsigId=0;
	        while(rs.next())
	        {
	        	dbsigId=rs.getInt(1);
	        	
	        }
	        if(dbsigId==0)
     	{
	        	sigid=dbsigId+sigid;
     	}
     	else
     	{
     		sigid=dbsigId+1;
     	}
	       
	        //insert the records into database
	        query1="insert into sigregi values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	        pst1=con.prepareStatement(query1);
	    	pst1.setLong(1,sigid);
	    	pst1.setString(2,siggroupname);
	    	pst1.setString(3,areaofspecialisation);
	    	pst1.setString(4,groupleadname);
	    	pst1.setString(5,sigtype);
	     	pst1.setString(6,associationn);
	    	pst1.setString(7,academicnamee);
	    	pst1.setString(8,mobilenumber);
	    	pst1.setString(9,sigemail);
	    	pst1.setString(10,password);
	        pst1.setString(11,sigleaderaddress);
	        pst1.setString(12,city);
	    	pst1.setInt(13,pincode);
	    	pst1.setString(14,verification);
	    	pst1.setString(15,registatus);
	    	pst1.setString(16,uuidnumber);
	    	pst1.setString(17,toemailid);
	    	pst1.setString(18,emailstatus);
	    	pst1.setString(19,adminconfirmation);
	    	int i=pst1.executeUpdate();	
	    	  String host = "smtp.gmail.com";
				String to=sigemail;
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
				msg.setSubject("Registered SIG Group");
  	            msg.setContent("<center><table border=0 cellspacing=0 cellpadding=0 class=table_width_100 width=100% style=max-width: 680px; min-width: 300px;> <tr><td></td></tr><tr><td align=center><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td align=center>	<a href=# target=_blank style=color: #596167; font-family: Arial, Helvetica, sans-serif; float:left; width:100%; padding:20px;text-align:center; font-size: 13px;><font face=Arial, Helvetica, sans-seri; font-size: 13px; size=3 color=><img></font></a></td><td align=right></td></tr></table></td></tr><tr><td align=center><font face=Arial, Helvetica, sans-serif size=4 style=font-size: 15px;><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td> <font> Hello "+groupleadname+",<br/><br><font><b>Congratulations..Your application has been submitted successfully.</b></font><br/><br> Your Submitted Details Are<br/><br> Sig Group Name:"+siggroupname+"<br/>Area Of Specialization:"+areaofspecialisation+"<br/>Group Leader Name:"+groupleadname+"<br/>Mobile Number:"+mobilenumber+"<BR>Email ID: "+sigemail+"<br/><br> Your Password Reset Link Will be forwarded to your registered mail ID. After verification of your Application.<br/><br ><br></font><font>If you have not registered it,Please forward this mail to incubation@samruddhitbi.com<BR>Mention <b>Cancellation of Registration</b> in the subject.<BR><br>TEAM STBI Foundation.</td></tr><tr><td align=center><div style=line-height: 24px;></div><!-- padding --><div style=height: 60px; line-height: 60px; font-size: 10px;></div></td></tr></table></font></td></tr><tr><td class=iage_footer align=center bgcolor=#ffffff><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td align=center style=padding:20px;flaot:left;width:100%; text-align:center;><font face=Arial, Helvetica, sans-serif size=3 color=#96a5b5 style=font-size: 13px;><span style=font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #96a5b5;>2015 © ALL Rights Reserved.</span></font></td></tr></table></td></tr><tr><td></td></tr></table></center>","text/html" );
  	            t = sessionn.getTransport("smtps");
  	            try {
  	            t.connect(host, username, pass);
  	            t.sendMessage(msg, msg.getAllRecipients());
  	                }
  	            finally 
  	                {
  	               t.close();
  	                }
  	      SigmailToadmin.sendEmail();
  	      
  	      
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
