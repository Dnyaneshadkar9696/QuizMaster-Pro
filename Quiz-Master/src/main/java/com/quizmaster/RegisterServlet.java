package com.quizmaster;

import java.io.IOException;
import java.io.PrintWriter;

import com.quizmaster.dao.UserDao;
import com.quizmaster.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();
		// all the user registered data will be stored from here to the database
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String year = req.getParameter("year");
		String college = req.getParameter("college");
		String branch = req.getParameter("branch");
		String skills = req.getParameter("skills");

		User u = new User(name, email, password, phone, college, branch, year, skills);

		// create ooject of UserDao

		// Created object of dao class so that i can userd their methods
		UserDao doo = new UserDao();
		try {
			doo.insertData(u);
			resp.sendRedirect("login.jsp");
			// This RequestDispatcher sends me to the next page

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
