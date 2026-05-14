package com.quizmaster.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.quizmaster.model.User;
import com.quizmaster.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

public class UserDao {
	
	
	// user Dao basically handles the 

    // 🔹 INSERT
    public boolean insertData(User u) throws Exception {

      Connection con = DbConnection.getConnections();

        PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (name, email, password, phone, college, branch, year, skills) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

        ps.setString(1, u.getName());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getPassword());
        ps.setString(4, u.getPhone());
        ps.setString(5, u.getCollege());
        ps.setString(6, u.getBranch());
        ps.setString(7, u.getYear());
        ps.setString(8, u.getSkills());

        int check = ps.executeUpdate();

        ps.close();
        con.close();

        return check > 0;
    }

    // 🔹 DELETE
    public boolean deleteData(int id) throws Exception {

      Connection con = DbConnection.getConnections();

        PreparedStatement ps = con.prepareStatement(
                "DELETE FROM users WHERE id = ?");

        ps.setInt(1, id);

        int check = ps.executeUpdate();

        ps.close();
        con.close();

        return check > 0;
    }

    // 🔹 UPDATE
    public boolean updateData(User u) throws Exception {

       Connection con = DbConnection.getConnections();

        PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET name=?, email=?, password=?, phone=?, college=?, branch=?, year=?, skills=? WHERE id=?");

        ps.setString(1, u.getName());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getPassword());
        ps.setString(4, u.getPhone());
        ps.setString(5, u.getCollege());
        ps.setString(6, u.getBranch());
        ps.setString(7, u.getYear());
        ps.setString(8, u.getSkills());
        ps.setInt(9, u.getId()); // IMPORTANT

        int check = ps.executeUpdate();

        ps.close();
        con.close();

        return check > 0;
    }
    
    
    public void fetchRecore(User u)  throws Exception{
    	
    	
    	Connection con = DbConnection.getConnections();
    	
    	PreparedStatement p = con.prepareStatement("Select * from users where name = ? and email = ?");
    	
    	p.setString(1, "Dnyanesh");
    	p.setString(2, "dnyanesh@gmail.com");
    	
    	
    	int ac = p.executeUpdate();
    	
    	
    	con.close();
    	
    	
    	
    }

    // fetch user by email
    public User getUserByEmail(String email) throws Exception {
        User user = null;

        Connection con = DbConnection.getConnections();

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email = ?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setPhone(rs.getString("phone"));
            user.setCollege(rs.getString("college"));
            user.setBranch(rs.getString("branch"));
            user.setYear(rs.getString("year"));
            user.setSkills(rs.getString("skills"));
        }

        rs.close();
        ps.close();
        con.close();

        return user;
    }
    
    // fetch user's last page from users table (expects a column last_page INT)
    public Integer getLastPageForUser(String email) throws Exception {
        Integer lastPage = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DbConnection.getConnections();
            ps = con.prepareStatement("SELECT last_page FROM users WHERE email = ?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                lastPage = rs.getObject("last_page") == null ? null : rs.getInt("last_page");
            }
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
        return lastPage;
    }

    // update user's last page in users table (expects a column last_page INT)
    public void updateLastPageForUser(String email, int page) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DbConnection.getConnections();
            ps = con.prepareStatement("UPDATE users SET last_page = ? WHERE email = ?");
            ps.setInt(1, page);
            ps.setString(2, email);
            ps.executeUpdate();
            ps.close();
            con.close();
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

}