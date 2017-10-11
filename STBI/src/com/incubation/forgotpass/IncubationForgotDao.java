package com.incubation.forgotpass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.dao.Dao;

public class IncubationForgotDao 
	{
	static Connection con;
	PreparedStatement pst;
public static boolean checkUser(String email) 
	{
	  boolean st =false;
	  try
		 	{
				con=Dao.getConnection();
				PreparedStatement ps =con.prepareStatement("select * from incubationregi where emailid=?");
				ps.setString(1, email);
				ResultSet rs =ps.executeQuery();
				st = rs.next();
		 	}
	  catch(Exception e)
			{
		  		e.printStackTrace();
			}
     		return st;                 
 	   	}   
	  	}


