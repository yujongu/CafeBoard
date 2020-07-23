package com.yujongu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yujongu.DAO.NicknameDAO;

/**
 * Servlet implementation class checkNicknameServlet
 */
@WebServlet("/checkNickname")
public class checkNicknameServlet extends HttpServlet {
	NicknameDAO dao;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		dao = new NicknameDAO();
		
		String username = (String) session.getAttribute("username");
		String nickname = request.getParameter("nickname");
		
		if(dao.checkDuplicate(nickname)) {
			session.setAttribute("nicknameDuplicate", "Nickname : " + nickname + " is already taken");
			response.sendRedirect("createNickname.jsp");
		} else {
			dao.createUser(username, nickname);
			session.setAttribute("nicknameSuccess", "Nickname : " + nickname + " has successfully been set!");
			session.setAttribute("nickname", nickname);
			response.sendRedirect("mainPage.jsp");
		}
		
		
	}

}
