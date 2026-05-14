<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quizmaster.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile - QuizMaster</title>
    <style>
        body{font-family:'Segoe UI',sans-serif;background:linear-gradient(180deg,#fffdf7,#fff7ed);min-height:100vh;display:flex;align-items:center;justify-content:center;padding:40px}
        .card{background:white;padding:30px;border-radius:16px;box-shadow:0 15px 40px rgba(0,0,0,0.08);max-width:720px;width:100%}
        h2{color:#33363b;margin-bottom:8px}
        .field{display:flex;gap:18px;margin:10px 0}
        .label{width:160px;color:#6b7280}
        .value{color:#111827;font-weight:600}
        .actions{margin-top:18px;text-align:right}
        .btn{padding:10px 14px;border-radius:10px;background:linear-gradient(90deg,#7c3aed,#06b6d4);color:white;text-decoration:none}
    </style>
</head>
<body>

<%
    User user = (User) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<div class="card">
    <h2>Your Profile</h2>
    <div class="field"><div class="label">Name</div><div class="value"><%=user.getName()%></div></div>
    <div class="field"><div class="label">Email</div><div class="value"><%=user.getEmail()%></div></div>
    <div class="field"><div class="label">Phone</div><div class="value"><%=user.getPhone()%></div></div>
    <div class="field"><div class="label">College</div><div class="value"><%=user.getCollege()%></div></div>
    <div class="field"><div class="label">Branch</div><div class="value"><%=user.getBranch()%></div></div>
    <div class="field"><div class="label">Year</div><div class="value"><%=user.getYear()%></div></div>
    <div class="field"><div class="label">Skills</div><div class="value"><%=user.getSkills()%></div></div>

    <div class="actions">
        <a class="btn" href="dashboard.jsp">Back to Dashboard</a>
    </div>
</div>

</body>
</html>