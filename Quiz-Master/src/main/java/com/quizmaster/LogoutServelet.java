package com.quizmaster;

import java.io.IOException;
import java.net.Authenticator.RequestorType;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServelet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	     HttpSession session = request.getSession(false);
	     
	     // it checks the user loged in or not

		if (session != null) {
			session.invalidate();
		}

		response.sendRedirect("login.jsp");

	}
}
