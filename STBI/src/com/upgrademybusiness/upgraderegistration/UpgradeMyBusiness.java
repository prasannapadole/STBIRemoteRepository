package com.upgrademybusiness.upgraderegistration;

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

/**
 * Servlet implementation class UpgradeMyBusiness
 */
//@WebServlet("/UpgradeMyBusiness")
public class UpgradeMyBusiness extends HttpServlet {
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
		        	int mybusinessId=100001;
		        	String companyname=request.getParameter("fname");
		        	String companyownername=request.getParameter("Middlename");
		        	String mobilenumber=request.getParameter("mobilenumber");
		        	String emailid=request.getParameter("email");
		        	String password="-";
		        	String yearofestablish=request.getParameter("someDate");
		        	String noofdepartment=request.getParameter("dept");
		        	String noofemp=request.getParameter("emp");
		        	String annualturnover=request.getParameter("annnual");
		        	String companyaddress=request.getParameter("address");
		        	String companydescription="-";
		        	String companyemailid=request.getParameter("companyemailid");
		        	String officecontactnumber=request.getParameter("officeno");
		        	String city=request.getParameter("city");
		        	int pincode=Integer.parseInt(request.getParameter("pincode"));
		        	String regiverification=request.getParameter("check");
					String registatus="Pending";
					String uuidnumber=null;
					String toemailid=null;
					String emailstatus=null;
					String adminconfirmation="-";
					
					

					  if(BusinessEmailMatch.checkUser(emailid)) // call EmailMatch class method and check email present or not
				       {
					   //mail present  then below code execute
				    	    out.println("<html><body style=background-color:>");
				    	    out.println("<script type=\"text/javascript\">");
					        out.println("alert('Email Already Present,Please Try Another Email Id')");
					        out.println("document.location.href = 'scaleup-login.jsp';\n");
					        out.println("</script>");
					        out.println("</body></html>");
					        RequestDispatcher rd=request.getRequestDispatcher("/scaleup-login.jsp");
				    	    rd.include(request,response);
				       	   }else
				          {
					    query="select max(mybusinessId) from upgrademybusiness"; //get max id of user database
				        pst=con.prepareStatement(query);
				        rs=pst.executeQuery();
				        int dbmybusinessId=0;
				        while(rs.next())
				        {
				        	dbmybusinessId=rs.getInt(1);
				        	
				        }
				        if(dbmybusinessId==0)
			        	{
				        	mybusinessId=dbmybusinessId+mybusinessId;
			        	}
			        	else
			        	{
			        		mybusinessId=dbmybusinessId+1;
			        	}
				        System.out.println(mybusinessId);
				        //insert the records into database
				        query1="insert into upgrademybusiness values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				        pst1=con.prepareStatement(query1);
				    	pst1.setLong(1,mybusinessId);
				    	pst1.setString(2,companyname);
				    	pst1.setString(3,companyownername);
				    	pst1.setString(4,mobilenumber);
				    	pst1.setString(5,emailid);
				    	pst1.setString(6,password);
				    	pst1.setString(7,yearofestablish);
				    	pst1.setString(8,noofdepartment);
				        pst1.setString(9,noofemp);
				        pst1.setString(10,annualturnover);
				    	pst1.setString(11,companyaddress);
				    	pst1.setString(12,companydescription);
				    	pst1.setString(13,companyemailid);
				    	pst1.setString(14,officecontactnumber);
				    	pst1.setString(15,city);
				    	pst1.setInt(16,pincode);
				    	pst1.setString(17,regiverification);
				    	pst1.setString(18,registatus);
				    	pst1.setString(19,uuidnumber);
				    	pst1.setString(20,toemailid);
				    	pst1.setString(21,emailstatus);
				    	pst1.setString(22,adminconfirmation);
				    	
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
						msg.setSubject("Registered Upgrade My Bussiness");
		    	        msg.setContent("<center><table border=0 cellspacing=0 cellpadding=0 class=table_width_100 width=100% style=max-width: 680px; min-width: 300px;> <tr><td></td></tr><tr><td align=center><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td align=center>	<a href=# target=_blank style=color: #596167; font-family: Arial, Helvetica, sans-serif; float:left; width:100%; padding:20px;text-align:center; font-size: 13px;><font face=Arial, Helvetica, sans-seri; font-size: 13px; size=3 color=><img></font></a></td><td align=right></td></tr></table></td></tr><tr><td align=center><font face=Arial, Helvetica, sans-serif size=4 style=font-size: 15px;><table width=90% border=0 cellspacing=0 cellpadding=0><tr><td> <font> Dear "+companyownername+",<br/><br><font><b>Congratulations..Your application has been submitted successfully.</b></font><br/><br> Your Submitted Details Are<br/><br>Company Owner Name:"+companyownername+"<br/>Company Name:"+companyname+"<br/>Year Of Establishment:"+yearofestablish+"<br/>Company Office Address:"+companyaddress+"<br/>Mobile Number:"+mobilenumber+"<BR>Email ID: "+emailid+"<br/><br> Your Password Reset Link Will be forwarded to your registered mail ID. After verification of your Application.<br/><br ><br></font><font>If you have not registered it,Please forward this mail to incubation@samruddhitbi.com<BR>Mention <b>Cancellation of Registration</b> in the subject.<BR><br>TEAM STBI Foundation.</td></tr><tr><td align=center><div style=line-height: 24px;></div><!-- padding --><div style=height: 60px; line-height: 60px; font-size: 10px;></div></td></tr></table></font></td></tr><tr><td class=iage_footer align=center bgcolor=#ffffff><table width=100% border=0 cellspacing=0 cellpadding=0><tr><td align=center style=padding:20px;flaot:left;width:100%; text-align:center;><font face=Arial, Helvetica, sans-serif size=3 color=#96a5b5 style=font-size: 13px;><span style=font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #96a5b5;>2015 © ALL Rights Reserved.</span></font></td></tr></table></td></tr><tr><td></td></tr></table></center>","text/html" );
		    	        t = sessionn.getTransport("smtps");
		    	        try {
		    	         t.connect(host, username, pass);
		    	         t.sendMessage(msg, msg.getAllRecipients());
		    	          }
		    	       finally 
		    	         {
		    	         t.close();
		    	         }  
		    	       Mailtoadmin_BusinessUpgrade.sendEmail();
				        
		    	        out.println("<html><body style=background-color:#FFFFFF>");
		    	        out.println("<script type=\"text/javascript\">");
		    	        out.println("alert('Your application will be verified by administration.Then your account will be enable for further access')");
		    	        out.println("document.location.href = 'scaleup-login.jsp';\n");
		    	        out.println("</script>");
		    	        out.println("</body></html>");
			            RequestDispatcher rd=request.getRequestDispatcher("/scaleup-login.jsp");
		    	        rd.include(request,response);
		                }
		              }
		        catch(Exception e)
		        {
		        	out.println(e);
		        }
			  }
           }
