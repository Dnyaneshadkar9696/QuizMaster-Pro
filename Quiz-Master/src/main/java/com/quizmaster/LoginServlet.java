package com.quizmaster;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.quizmaster.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet r = null;

        try {

            con = DbConnection.getConnections();

            ps = con.prepareStatement("Select * from users where email= ? and password = ?");

            ps.setString(1, email);
            ps.setString(2, password);

            r = ps.executeQuery();
            if (r.next()) {

                // store user email in session so profile and other pages can use it
                HttpSession session = req.getSession(true);
                session.setAttribute("userEmail", email);
                session.setAttribute("userId", r.getInt("id"));

                resp.sendRedirect("dashboard.jsp");

            } else {
                out.println("INVALID CREDENTIALS ... !");
                RequestDispatcher rr = req.getRequestDispatcher("register.html");
                rr.include(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try { if (r != null) r.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

}