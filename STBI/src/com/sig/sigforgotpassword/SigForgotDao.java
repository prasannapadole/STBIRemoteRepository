package com.sig.sigforgotpassword;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.Dao;

public class SigForgotDao
{
	static Connection con;
	PreparedStatement pst;

public static boolean checkUser(String email) 
 	{
	boolean st =false;
	try
		{
		con=Dao.getConnection();
		PreparedStatement ps =con.prepareStatement("select * from sigregi where emailid=? ");
		ps.setString(1, email);
		ResultSet rs =ps.executeQuery();
		String dbpass="";
		st = rs.next();
		}
	catch(Exception e)
		{
      e.printStackTrace();
		}
     	return st;                 
 	}   
}
