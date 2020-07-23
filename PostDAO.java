package com.yujongu.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.yujongu.Post;

public class PostDAO {
	String insertSql = "insert into posts values(?, ?, ?);";
	String url = "jdbc:mysql://localhost:3306/users?characterEncoding=UTF-8&serverTimezone=UTC";
	String username = "root";
	String password = "Password1";
	
	
	public void addPost(Post post) {
		String title = post.getTitle();
		String content = post.getContent();
		String author = post.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(insertSql);
			st.setString(1, title);
			st.setString(2, content);
			st.setString(3, author);
			st.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
