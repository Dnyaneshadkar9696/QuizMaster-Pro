package com.quizmaster;

import java.io.IOException;
import java.io.PrintWriter;

import com.quizmaster.dao.QuestionDao;
import com.quizmaster.model.Questions;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServelet extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		PrintWriter out = resp.getWriter();

		
		
		String questions = req.getParameter("question");
		String option1 = req.getParameter("opt1");
		String option2 = req.getParameter("opt2");
		String option3 = req.getParameter("opt3");
		String option4 = req.getParameter("opt4");
        String correct_answer = req.getParameter("answer");
        
        // we got this fields from the form and now first we have to set them in questions
        
        Questions q = new Questions();
        q.setQuestion(questions);
        q.setOption1(option1);
        q.setOption2(option2);
        q.setOption3(option3);
        q.setOption4(option4);
        q.setCorrect_answer(correct_answer);
        
        // we set those values in the question and now store in db
        
        QuestionDao dao = new QuestionDao();
        int ad = dao.addQuestion(q);
        
        if (1 == ad) {

            req.setAttribute("msg", "Question Added Successfully");

            RequestDispatcher rd =
                    req.getRequestDispatcher("dashboard.jsp");

            rd.forward(req, resp);

        } else {

            req.setAttribute("msg", "Data not inserted");

            RequestDispatcher rd =
                    req.getRequestDispatcher("dashboard.jsp");

            rd.forward(req, resp);
        }
        
        
        
        
        
        
        
        
		
	}
	
	

}
