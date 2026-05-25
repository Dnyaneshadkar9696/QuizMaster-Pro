package com.quizmaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import com.quizmaster.model.Questions;
import com.quizmaster.util.DbConnection;

public class QuestionDao {

	public List<Questions> getQuestions(int start) {

		// Means method returns the list of questions

		List<Questions> list = new ArrayList<>();

		try {
			// DATABASE CONNECTION

			Connection con = DbConnection.getConnections();

			// SQL QUERY

			String sql = "SELECT * FROM questions LIMIT ?,10";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, start);

			// EXECUTE QUERY

			ResultSet rs = ps.executeQuery();

			// FETCH DATA

			while (rs.next()) {
				Questions q = new Questions();

				q.setId(rs.getInt("id"));

				q.setQuestion(rs.getString("question"));

				q.setOption1(rs.getString("option1"));

				q.setOption2(rs.getString("option2"));

				q.setOption3(rs.getString("option3"));

				q.setOption4(rs.getString("option4"));

				q.setCorrect_answer(rs.getString("correct_answer"));

				// ADD QUESTION TO LIST
				
				// Got the quesiton and added to the list

				list.add(q);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// return total number of questions in DB
	public int getQuestionCount() {
		int count = 0;
		try (Connection con = DbConnection.getConnections()) {
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS cnt FROM questions");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	public int addQuestion(Questions q) {
		try (Connection con = DbConnection.getConnections()) {
			String sql = "INSERT INTO questions (question, option1, option2, option3, option4, correct_answer) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOption1());
			ps.setString(3, q.getOption2());
			ps.setString(4, q.getOption3());
			ps.setString(5, q.getOption4());
			ps.setString(6, q.getCorrect_answer());
			int a = ps.executeUpdate();
			
			
			if(a > 0) {
				return a;
			}
			
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
}