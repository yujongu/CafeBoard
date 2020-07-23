package com.yujongu.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	String sql = "SELECT * FROM login WHERE uname=? and upass=?;";
	String retrieveNicknameSql = "SELECT nickname FROM login WHERE uname=? and upass=?;";
	String url = "jdbc:mysql://localhost:3306/users?characterEncoding=UTF-8&serverTimezone=UTC";
	String username = "root";
	String password = "Password1";
	
	public boolean checkCred(String uname, String pword) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setNString(1, uname);
			st.setNString(2, pword);
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public String retrieveNickname(String uname, String pword) {
		String nickname = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(retrieveNicknameSql);
			st.setNString(1, uname);
			st.setNString(2, pword);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				nickname = rs.getString("nickname");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nickname;
	}
	
	

}
