<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<title>Quiz Result - QuizMaster</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Segoe UI',sans-serif;
    height:100vh;
    overflow:hidden;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#fff8f1,#fff1e6);
    position:relative;
}

/* Animated Background */

.bg-circle{
    position:absolute;
    border-radius:50%;
    opacity:0.25;
    animation:float 8s infinite ease-in-out;
}

.circle1{
    width:260px;
    height:260px;
    background:#FC4A1A;
    top:-80px;
    left:-80px;
}

.circle2{
    width:320px;
    height:320px;
    background:#F7B733;
    bottom:-120px;
    right:-120px;
    animation-delay:2s;
}

.circle3{
    width:180px;
    height:180px;
    background:#ff9a76;
    top:50%;
    left:10%;
    animation-delay:4s;
}

@keyframes float{

    0%{
        transform:translateY(0px);
    }

    50%{
        transform:translateY(-25px);
    }

    100%{
        transform:translateY(0px);
    }
}

/* Result Box */

.result-box{
    width:450px;
    background:white;
    border-radius:35px;
    padding:45px;
    text-align:center;
    position:relative;
    z-index:2;
    box-shadow:0 20px 50px rgba(0,0,0,0.1);
    overflow:hidden;
    animation:popup 0.8s ease;
}

@keyframes popup{

    from{
        opacity:0;
        transform:scale(0.7);
    }

    to{
        opacity:1;
        transform:scale(1);
    }
}

/* Trophy */

.trophy{
    font-size:75px;
    animation:bounce 1.8s infinite;
}

@keyframes bounce{

    0%,100%{
        transform:translateY(0);
    }

    50%{
        transform:translateY(-12px);
    }
}

h1{
    margin-top:15px;
    color:#FC4A1A;
    font-size:38px;
}

.sub{
    margin-top:10px;
    color:#6b7280;
    font-size:17px;
}

/* Score Circle */

.score-circle{
    width:190px;
    height:190px;
    border-radius:50%;
    margin:35px auto;
    background:linear-gradient(135deg,#FC4A1A,#F7B733);
    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;
    color:white;
    box-shadow:0 15px 35px rgba(252,74,26,0.3);
    animation:rotateGlow 3s infinite alternate;
}

@keyframes rotateGlow{

    from{
        transform:scale(1);
    }

    to{
        transform:scale(1.05);
    }
}

.score{
    font-size:55px;
    font-weight:bold;
}

.score-text{
    font-size:18px;
    margin-top:5px;
}

/* Buttons */

.btn-area{
    display:flex;
    gap:15px;
    justify-content:center;
    margin-top:25px;
}

.btn{
    padding:15px 28px;
    border-radius:18px;
    text-decoration:none;
    font-size:16px;
    font-weight:bold;
    transition:0.3s;
}

.dashboard-btn{
    background:linear-gradient(135deg,#FC4A1A,#F7B733);
    color:white;
    box-shadow:0 10px 25px rgba(252,74,26,0.25);
}

.retry-btn{
    background:#fff3e8;
    color:#FC4A1A;
    border:2px solid #ffd4b5;
}

.btn:hover{
    transform:translateY(-4px) scale(1.04);
}

/* Confetti */

.confetti{
    position:absolute;
    width:12px;
    height:12px;
    background:#FC4A1A;
    top:-20px;
    animation:fall linear infinite;
    opacity:0.8;
}

.confetti:nth-child(1){
    left:10%;
    animation-duration:5s;
}

.confetti:nth-child(2){
    left:25%;
    animation-duration:6s;
    background:#F7B733;
}

.confetti:nth-child(3){
    left:45%;
    animation-duration:4s;
}

.confetti:nth-child(4){
    left:60%;
    animation-duration:7s;
    background:#ff9a76;
}

.confetti:nth-child(5){
    left:80%;
    animation-duration:5.5s;
}

@keyframes fall{

    0%{
        transform:translateY(-20px) rotate(0deg);
    }

    100%{
        transform:translateY(110vh) rotate(720deg);
    }
}

</style>

</head>

<body>

<!-- Background -->

<div class="bg-circle circle1"></div>
<div class="bg-circle circle2"></div>
<div class="bg-circle circle3"></div>

<!-- Confetti -->

<div class="confetti"></div>
<div class="confetti"></div>
<div class="confetti"></div>
<div class="confetti"></div>
<div class="confetti"></div>

<!-- Result Box -->

<div class="result-box">

    <div class="trophy">
        🏆
    </div>

    <h1>Quiz Completed!</h1>

    <p class="sub">
        Awesome effort! Here’s your final score
    </p>

    <!-- Score -->

    <div class="score-circle">

        <div class="score">

            ${score}

        </div>

        <div class="score-text">

            Final Score

        </div>

    </div>

    <!-- Buttons -->

    <div class="btn-area">

        <a href="dashboard.jsp"
           class="btn dashboard-btn">

           Dashboard

        </a>

        <a href="StartQuizServlet?page=0"
           class="btn retry-btn">

           Retry Quiz

        </a>

    </div>

</div>

</body>

</html>