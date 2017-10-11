package com.institute.institute.view.all.details;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.Dao;

public class InstituteViewAll
{
	public static boolean checkUser(long ideaid)  //call a static checkUser mentod with three urgument 
	{
  	boolean st =false;  //bydefault st is false
  	Connection con;//create connection object
  	PreparedStatement pst; //create preparedstatement object
  	ResultSet rs;// create resultset object
  		try{
  			con=Dao.getConnection();//access dao class that contain database connection data.
  			pst =con.prepareStatement("select ideaid from user_ideasubmit_updateprogress where ideaid=?");//fire a query
  			pst.setLong(1, ideaid);//set email
  			rs =pst.executeQuery();//execute query
  			long dbideaid=0;
  			
  				while(rs.next())
  				{
  					dbideaid=rs.getLong(1);
  				
  						if(dbideaid==ideaid)
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
