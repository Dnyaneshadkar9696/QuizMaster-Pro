package com.quizmaster;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServelet extends HttpServlet{
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String questions = req.getParameter("question");
		String option1 = req.getParameter("opt1");
		String option2 = req.getParameter("opt2");
		String option3 = req.getParameter("opt3");
		String option4 = req.getParameter("opt4");
        String answer = req.getParameter("answer");
        
        
        
		
	}
	
	

}
