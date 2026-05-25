package com.quizmaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.quizmaster.model.Result;
import com.quizmaster.util.DbConnection;

public class ResultDao {
	
	public boolean saveResult(
            int userId,
            int score,
            int totalQuestions) {

        boolean f = false;

        try {

        	Connection con = DbConnection.getConnections();

            String sql =
            "insert into results(user_id,score,total_questions) values(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1,userId);
            ps.setInt(2,score);
            ps.setInt(3,totalQuestions);

            int ad = ps.executeUpdate();

            if(ad == 1){
                f = true;
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return f;
    }

	public List<Result> getUserResults(Integer userId) {
		
		List<Result> list = null;

		try {

			Connection con = DbConnection.getConnections();

			String sql =
					"select * from results where user_id = ? order by id desc";

			PreparedStatement ps =
					con.prepareStatement(sql);

			ps.setInt(1,userId);

			list = new java.util.ArrayList<>();

			java.sql.ResultSet rs = ps.executeQuery();

			while(rs.next()){

				Result r = new Result();

				r.setId(rs.getInt("id"));
				r.setUserId(rs.getInt("user_id"));
				r.setScore(rs.getInt("score"));
				r.setTotalQuestions(rs.getInt("total_questions"));
				r.setQuizDate(rs.getTimestamp("quiz_date"));

				list.add(r);
			}

		} catch(Exception e){
			e.printStackTrace();
			
		}
		return list;
		
	}

}
