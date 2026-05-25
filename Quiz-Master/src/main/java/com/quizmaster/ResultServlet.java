package com.quizmaster;

import java.io.IOException;
import java.util.List;

import com.quizmaster.dao.ResultDao;
import com.quizmaster.model.Result;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		  HttpSession session =  req.getSession(false);
		  
		  // get current session if exists, otherwise return null. This is important to avoid creating a new session if one doesn't exist.

	        if(session == null){

	            resp.sendRedirect("login.jsp");
	            return;

	        }

	        Integer userId = (Integer) session.getAttribute("userId");
	        // If userId is null, it means the user is not logged in or session has expired. Redirect to login page.

	        if(userId == null){

	            resp.sendRedirect(
	                    "login.jsp");

	            return;

	        }

	        ResultDao dao = new ResultDao();

	        List<Result> results =dao.getUserResults( userId);
	        
	        // Store the results in request scope to be accessed in the JSP
	        // store the data returned from db in results and then we will forward this data to the result-history.jsp page to show the user his past results

	        req.setAttribute( "results",results);
	        
	        // we setattribute the results in the request scope and then forward to the result-history.jsp page to show the user his past results

	        req.getRequestDispatcher("result-history.jsp").forward(req,resp);
	        
	        // above line means we are forwarding the request to the result-history.jsp page to show the user his past results and in that page we will use the results attribute to show the data in a table format

	        // getrequestDispatcher is used to forward the request to the result-history.jsp page and in that page we will use the results attribute to show the data in a table format
	        
	    }
		
		
	
	
	

}
