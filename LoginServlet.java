package com.yujongu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yujongu.DAO.LoginDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
	LoginDAO loginCred;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("uname");
		String password = request.getParameter("pword");
		HttpSession session = request.getSession();
		loginCred = new LoginDAO();
		
		if (loginCred.checkCred(userName, password)) {
			session.setAttribute("username", userName);
			session.setAttribute("password", password);
			String nickname = loginCred.retrieveNickname(userName, password);
			session.setAttribute("nickname", nickname);
			response.sendRedirect("mainPage.jsp");
		} else {
			session.setAttribute("message", "  * Incorrect username or password");
			response.sendRedirect("login.jsp");
		}
	}

}
