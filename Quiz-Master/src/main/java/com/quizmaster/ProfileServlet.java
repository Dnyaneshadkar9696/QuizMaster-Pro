package com.quizmaster;

import java.io.IOException;

import com.quizmaster.dao.UserDao;
import com.quizmaster.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");
        if (email == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        UserDao dao = new UserDao();
        try {
            User user = dao.getUserByEmail(email);
            if (user == null) {
                // no user found, redirect to dashboard
                resp.sendRedirect("dashboard.jsp");
                return;
            }

            req.setAttribute("user", user);
            req.getRequestDispatcher("profile.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("dashboard.jsp");
        }
    }
}
