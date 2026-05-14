<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.quizmaster.model.Questions"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>QuizMaster</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #fffdf7, #fff7ed);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	padding: 20px;
}

/* Main Container */
.quiz-container {
	width: 100%;
	max-width: 850px;
	background: white;
	border-radius: 30px;
	padding: 40px;
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.08);
	position: relative;
	overflow: hidden;
}

/* Header */
.quiz-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
	gap: 20px;
}

.quiz-title h1 {
	color: #FC4A1A;
	font-size: 34px;
}

.quiz-title p {
	margin-top: 6px;
	color: #6b7280;
}

/* Question Counter */
.question-count {
	background: #fff7ed;
	padding: 14px 20px;
	border-radius: 16px;
	font-weight: bold;
	color: #FC4A1A;
	min-width: 140px;
	text-align: center;
}

/* Timer */
.timer-box {
	margin-top: 20px;
	margin-bottom: 35px;
}

.timer-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.timer-top h3 {
	color: #33363b;
}

.timer {
	font-size: 20px;
	font-weight: bold;
	color: #FC4A1A;
}

.progress-bar {
	width: 100%;
	height: 14px;
	background: #ffe4c7;
	border-radius: 10px;
	overflow: hidden;
}

.progress {
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, #FC4A1A, #F7B733);
	transition: 0.3s linear;
}

/* Question Section */
.question-box {
	animation: slide 0.5s ease;
}

@keyframes slide {
	from {
		opacity: 0;
		transform: translateX(40px);
	}

	to {
		opacity: 1;
		transform: translateX(0px);
	}
}

.question {
	font-size: 28px;
	color: #33363b;
	line-height: 1.5;
	margin-bottom: 35px;
	font-weight: 600;
}

/* Options */
.option {
	margin-bottom: 18px;
}

.option label {
	display: flex;
	align-items: center;
	gap: 16px;
	background: #fff7ed;
	padding: 18px;
	border-radius: 18px;
	cursor: pointer;
	transition: 0.3s;
	border: 2px solid transparent;
	font-size: 17px;
	color: #374151;
}

.option label:hover {
	background: #ffe8d2;
	border-color: #FC4A1A;
	transform: translateX(6px);
}

.option input {
	transform: scale(1.4);
	accent-color: #FC4A1A;
}

/* Buttons */
.btn-area {
	display: flex;
	justify-content: flex-end;
	margin-top: 35px;
}

.btn {
	padding: 16px 34px;
	border: none;
	border-radius: 18px;
	background: linear-gradient(135deg, #FC4A1A, #F7B733);
	color: white;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
	box-shadow: 0 10px 25px rgba(252, 74, 26, 0.2);
}

.btn:hover {
	transform: translateY(-4px) scale(1.03);
}

/* Responsive */
@media ( max-width :768px) {
	.quiz-container {
		padding: 25px;
	}
	.quiz-header {
		flex-direction: column;
		align-items: flex-start;
	}
	.question {
		font-size: 22px;
	}
	.quiz-title h1 {
		font-size: 28px;
	}
}
</style>

</head>

<body>

	<%
	List<Questions> list = (List<Questions>) session.getAttribute("questions");

	// If questions are not present in session, redirect to start so user can fetch questions
	if (list == null || list.isEmpty()) {
		response.sendRedirect("StartQuizServlet");
		return;
	}
	%>

	<div class="quiz-container">

		<!-- Header -->

		<div class="quiz-header">

			<div class="quiz-title">

				<h1>Quiz Challenge</h1>

				<p>Answer all questions before time runs out</p>

			</div>

			<div class="question-count">

				Question <span id="currentQuestion">1</span> /
				<%=list.size()%>

			</div>

		</div>

		<!-- Timer -->

		<div class="timer-box">

			<div class="timer-top">

				<h3>Time Remaining</h3>

				<div class="timer">

					<span id="timer">60</span>s

				</div>

			</div>

			<div class="progress-bar">

				<div class="progress" id="progress"></div>

			</div>

		</div>

		<!-- Form -->

		<form id="quizForm" action="SubmitQuizServlet" method="post">

			<%
			for (int i = 0; i < list.size(); i++) {
				Questions q = list.get(i);
			%>

			<div class="question-box" id="question<%=i%>"
				style="<%=i == 0 ? "" : "display:none;"%>">

				<div class="question">

					<%=q.getQuestion()%>

				</div>

				<div class="option">

					<label> <input type="radio" name="q<%=q.getId()%>"
						value="<%=q.getOption1()%>"> <%=q.getOption1()%>

					</label>

				</div>

				<div class="option">

					<label> <input type="radio" name="q<%=q.getId()%>"
						value="<%=q.getOption2()%>"> <%=q.getOption2()%>

					</label>

				</div>

				<div class="option">

					<label> <input type="radio" name="q<%=q.getId()%>"
						value="<%=q.getOption3()%>"> <%=q.getOption3()%>

					</label>

				</div>

				<div class="option">

					<label> <input type="radio" name="q<%=q.getId()%>"
						value="<%=q.getOption4()%>"> <%=q.getOption4()%>

					</label>

				</div>

			</div>

			<%
			}
			%>

			<!-- Button -->

			<div class="btn-area">

				<button type="button" class="btn" id="nextBtn">Next →</button>

			</div>

		</form>

	</div>

	<script>

let current = 0;

const totalQuestions =
<%=list.size()%>;

const nextBtn =
document.getElementById("nextBtn");

const currentQuestion =
document.getElementById("currentQuestion");

/* NEXT BUTTON */

nextBtn.addEventListener("click",()=>{

    document.getElementById(
    "question"+current).style.display="none";

    current++;

    if(current < totalQuestions)
    {
        document.getElementById(
        "question"+current).style.display="block";

        currentQuestion.innerText =
        current + 1;

        if(current == totalQuestions-1)
        {
            nextBtn.innerText =
            "Submit Quiz";
        }
    }
    else
    {
        document.getElementById(
        "quizForm").submit();
    }

});

/* TIMER */

let total = 60;

let remaining = total;

const timer =
document.getElementById("timer");

const progress =
document.getElementById("progress");

function updateTimer()
{
    timer.innerText = remaining;

    progress.style.width =
    (remaining/total)*100 + "%";

    if(remaining <= 10)
    {
        progress.style.background =
        "linear-gradient(90deg,#ff5f6d,#ffc371)";
    }
}

updateTimer();

const interval = setInterval(()=>{

    remaining--;

    if(remaining <= 0)
    {
        clearInterval(interval);

        document.getElementById(
        "quizForm").submit();
    }

    updateTimer();

},1000);

</script>

</body>

</html>