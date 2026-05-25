package com.quizmaster;

import java.io.IOException;
import java.util.List;

import com.quizmaster.dao.ResultDao;
import com.quizmaster.model.Questions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            // No session - redirect to login or start page
            resp.sendRedirect("login.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        List<Questions> list = (List<Questions>) session.getAttribute("questions");

        if (list == null || list.isEmpty()) {
            // nothing to grade
            resp.sendRedirect("dashboard.jsp");
            return;
        }

        int score = 0;
        int total = list.size();

        for (Questions q : list) {
            String paramName = "q" + q.getId();
            String userAnswer = req.getParameter(paramName);

            if (userAnswer != null) {
                // compare trimmed, case-insensitive to be more forgiving
                if (userAnswer.trim().equalsIgnoreCase(q.getCorrect_answer().trim())) {
                    score++;
                }
            }
        }
        
     // Save result in database
          // From the blow block of code we are getting the user id and all to store the test results 
        // when the user submit the result gets added.
        Integer userId = (Integer) session.getAttribute("userId");

        if(userId != null){

            ResultDao dao = new ResultDao();

            dao.saveResult(
                    userId,
                    score,
                    total);
        }

        // Optionally remove questions from session
        session.removeAttribute("questions");
        session.removeAttribute("page");

        // Put score in request and forward to result.jsp
        req.setAttribute("score", score + " / " + total);

        req.getRequestDispatcher("result.jsp").forward(req, resp);
    }
}
