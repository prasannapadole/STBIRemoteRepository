package com.sig.institute.incubation.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.Dao;

public class InstituteLoginDao
{
	public static boolean checkUser(String email,String password)  //call a static checkUser mentod with three urgument 
	{
     Connection con;//create connection object
     PreparedStatement pst; //create preparedstatement object
     ResultSet rs;// create resultset object
     boolean st =false;  //bydefault st is false
     try{
    	 con=Dao.getConnection();//access dao class that contain database connection data.
    	 pst =con.prepareStatement("select emailid,password,registrationstatus from instituteregi where emailid=? and password=?");//fire a query
    	 pst.setString(1, email);//set email
    	 pst.setString(2, password);//set password
    	 rs =pst.executeQuery();//execute query
    	 String dbinstituteemail="",dbpassword="",dbregistrationstatus="";//write variable and stored table data.
    	 while(rs.next())
    	 {
    		 dbinstituteemail=rs.getString(1);
    		 dbpassword= rs.getString(2);
    		 dbregistrationstatus=rs.getString(3);
    		 if(dbinstituteemail.equals(email) && dbpassword.equals(password) && dbregistrationstatus.equals("Approved"))//check three conditions.
    		 {
    			 st=true; //if resultset true then go to next page
    		 }
    	 }
     }
     catch(Exception e)
     {
    	 e.printStackTrace();
     }
     return st;                 
	}
	
	
	
	
}
