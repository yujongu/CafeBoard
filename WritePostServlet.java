package com.yujongu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yujongu.DAO.PostDAO;

@WebServlet("/WritePost")
public class WritePostServlet extends HttpServlet {
	
	PostDAO dao;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		dao = new PostDAO();

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String user = (String) session.getAttribute("nickname");
		Post post = new Post(title, content, user);
		dao.addPost(post);

		response.sendRedirect("mainPage.jsp");
		
		
	}

}
