<%@page import="java.util.List"%>
<%@page import="com.quizmaster.model.Result"%>

<%
List<Result> results = (List<Result>) request.getAttribute("results");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Quiz History - QuizMaster</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #fff8f1, #fff1e6);
	padding: 40px;
	min-height: 100vh;
}

.container {
	max-width: 900px;
	margin: auto;
	background: white;
	padding: 35px;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 25px;
	color: #FC4A1A;
}

table {
	width: 100%;
	border-collapse: collapse;
	overflow: hidden;
	border-radius: 15px;
}

th {
	background: linear-gradient(135deg, #FC4A1A, #F7B733);
	color: white;
	padding: 15px;
}

td {
	padding: 14px;
	text-align: center;
	border-bottom: 1px solid #eee;
}

tr:nth-child(even) {
	background: #fff7f1;
}

tr:hover {
	background: #ffe5d3;
	transition: 0.3s;
}

.empty {
	text-align: center;
	padding: 25px;
	font-size: 18px;
	color: gray;
}

.btn {
	display: inline-block;
	margin-top: 25px;
	padding: 12px 22px;
	background: linear-gradient(135deg, #FC4A1A, #F7B733);
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
}

.bottom {
	text-align: center;
}
</style>

</head>

<body>

	<div class="container">

		<h1>📊 Previous Quiz Results</h1>

		<%
		if (results != null && !results.isEmpty()) {
		%>

		<table>

			<tr>

				<th>Attempt</th>

				<th>Score</th>

				<th>Total Questions</th>

				<th>Date</th>

			</tr>

			<%
			int count = 1;

			for (Result r : results) {
			%>

			<tr>

				<td><%=count++%></td>

				<td><%=r.getScore()%></td>

				<td><%=r.getTotalQuestions()%></td>

				<td><%=r.getQuizDate()%></td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		} else {
		%>

		<div class="empty">No previous attempts found.</div>

		<%
		}
		%>

		<div class="bottom">

			<a href="dashboard.jsp" class="btn"> Back To Dashboard </a>

		</div>

	</div>

</body>

</html>