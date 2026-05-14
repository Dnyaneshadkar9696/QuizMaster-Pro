package com.quizmaster;

import java.io.IOException;
import java.util.List;

import com.quizmaster.dao.QuestionDao;
import com.quizmaster.dao.UserDao;
import com.quizmaster.model.Questions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StartQuizServlet")

public class StartQuizServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // create session
        HttpSession session = req.getSession();

        // create dao objects
        QuestionDao qdao = new QuestionDao();
        UserDao udao = new UserDao();

        // total questions and pages
        int totalQuestions = qdao.getQuestionCount();
        if (totalQuestions <= 0) {
            // no questions in DB
            resp.sendRedirect("dashboard.jsp");
            return;
        }
        int pageSize = 10;
        int totalPages = (totalQuestions + pageSize - 1) / pageSize; // ceil

        Integer page = null;

        // If explicit page param provided, respect it (useful for navigation)
        String p = req.getParameter("page");
        if (p != null) {
            try {
                int parsed = Integer.parseInt(p);
                if (parsed >= 0 && parsed < totalPages) {
                    page = parsed;
                }
            } catch (NumberFormatException e) {
                // ignore and compute below
            }
        }

        String userEmail = (String) session.getAttribute("userEmail");

        // If no explicit page, compute next page for the user
        if (page == null) {
            if (userEmail != null) {
                try {
                    Integer lastPage = udao.getLastPageForUser(userEmail);
                    if (lastPage == null) {
                        page = 0;
                    } else {
                        page = (lastPage + 1) % totalPages;
                    }
                } catch (Exception e) {
                    // DB access for user progress failed — fallback to session-based counter
                    Integer sessionLast = (Integer) session.getAttribute("lastPageCounter");
                    if (sessionLast == null) sessionLast = 0;
                    page = (sessionLast + 1) % totalPages;
                    session.setAttribute("lastPageCounter", page);
                }
            } else {
                // anonymous user - use session-based page counter
                Integer sessionLast = (Integer) session.getAttribute("lastPageCounter");
                if (sessionLast == null) sessionLast = -1;
                page = (sessionLast + 1) % totalPages;
                session.setAttribute("lastPageCounter", page);
            }
        }

        // calculate starting question
        int start = page * pageSize;

        // fetch questions from database
        List<Questions> list = qdao.getQuestions(start);

        if (list == null || list.isEmpty()) {
            // nothing fetched — redirect back
            resp.sendRedirect("dashboard.jsp");
            return;
        }

        // store questions in session
        session.setAttribute("questions", list);

        // store current page
        session.setAttribute("page", page);

        // persist last page for logged-in users
        if (userEmail != null) {
            try {
                udao.updateLastPageForUser(userEmail, page);
            } catch (Exception e) {
                // ignore persistence errors — progress tracked in session already
            }
        }

        // forward to quiz.jsp
        req.getRequestDispatcher("quiz.jsp").forward(req, resp);

    }
}