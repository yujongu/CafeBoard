package com.yujongu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yujongu.DAO.SignUpDAO;

@WebServlet("/SignUp")
public class SignupServlet extends HttpServlet {
	SignUpDAO dao;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		dao = new SignUpDAO();
		
		String username = request.getParameter("uname");
		String pword = request.getParameter("pword1");
		if(!pword.equals(request.getParameter("pword2"))) {
			session.setAttribute("pwordMessage", "passwords do not match");
			response.sendRedirect("login.jsp");
		} else {
			if(dao.checkUsername(username)) {
				session.setAttribute("usernameDuplicate", "username : " + username + " is already taken");
				response.sendRedirect("login.jsp");
			} else {
				dao.createUser(username, pword);
				session.setAttribute("SignupSuccess", "You have successfully made your account!");
				response.sendRedirect("login.jsp");
			}
		}
	}

}
