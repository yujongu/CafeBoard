package com.yujongu.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yujongu.Post;

public class PostDAO {
	String insertSql = "INSERT INTO posts VALUES(?, ?, ?, curdate());";
	String retrieveMyPostSql = "SELECT * FROM posts WHERE author=?;";
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
	
	public ArrayList<Post> retrievePosts(String author) {
		ArrayList<Post> posts = new ArrayList<Post>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(retrieveMyPostSql);
			st.setString(1, author);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				posts.add(
						new Post(
								rs.getString("title"), 
								rs.getString("content"), 
								rs.getString("author"), 
								rs.getDate("writtenDate")
								)
						);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return posts;
	}
	

}
