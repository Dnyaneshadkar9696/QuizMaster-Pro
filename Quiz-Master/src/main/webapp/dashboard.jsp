<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - QuizMaster</title>
    <style>
```css id="qf4k3i"
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Segoe UI',sans-serif;
    background:linear-gradient(135deg,#fffdf7,#fff7ed);
    min-height:100vh;
    overflow-x:hidden;
    position:relative;
}

/* Floating Background Shapes */

.shape{
    position:absolute;
    border-radius:50%;
    opacity:0.15;
    animation:float 8s infinite ease-in-out;
}

.shape1{
    width:220px;
    height:220px;
    background:#FC4A1A;
    top:-50px;
    left:-50px;
}

.shape2{
    width:300px;
    height:300px;
    background:#F7B733;
    bottom:-100px;
    right:-100px;
    animation-duration:10s;
}

.shape3{
    width:120px;
    height:120px;
    background:#4ABDAC;
    top:30%;
    right:15%;
    animation-duration:7s;
}

@keyframes float{

    0%{
        transform:translateY(0px);
    }

    50%{
        transform:translateY(-20px);
    }

    100%{
        transform:translateY(0px);
    }
}

/* Navbar */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 40px;
    background:white;
    box-shadow:0 4px 20px rgba(0,0,0,0.05);
    position:sticky;
    top:0;
    z-index:100;
}

.brand{
    display:flex;
    align-items:center;
    gap:14px;
}

.logo{
    width:55px;
    height:55px;
    border-radius:50%;
    background:linear-gradient(135deg,#FC4A1A,#F7B733);
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
    font-weight:bold;
    font-size:20px;
    box-shadow:0 8px 20px rgba(252,74,26,0.3);
    animation:pulse 2s infinite;
}

@keyframes pulse{

    0%{
        transform:scale(1);
    }

    50%{
        transform:scale(1.05);
    }

    100%{
        transform:scale(1);
    }
}

/* Navbar Buttons */

.nav-actions{
    display:flex;
    gap:12px;
}

.nav-btn{
    text-decoration:none;
    padding:11px 18px;
    border-radius:14px;
    background:linear-gradient(135deg,#FC4A1A,#F7B733);
    color:white;
    font-weight:600;
    transition:0.3s;
    box-shadow:0 6px 15px rgba(252,74,26,0.2);
}

.nav-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 22px rgba(252,74,26,0.3);
}

/* Main Container */

.container{
    max-width:1200px;
    margin:auto;
    padding:40px 25px;
    position:relative;
    z-index:5;
}

/* Welcome Section */

.hero{
    margin-bottom:35px;
}

.hero h1{
    font-size:38px;
    color:#33363b;
}

.hero span{
    color:#FC4A1A;
}

.hero p{
    margin-top:10px;
    color:#6b7280;
    font-size:16px;
}

/* Grid */

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
    gap:25px;
}

/* Cards */

.card{
    background:white;
    border-radius:24px;
    padding:28px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
    transition:0.35s;
    position:relative;
    overflow:hidden;
}



.card::before{
    content:'';
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:6px;
    background:linear-gradient(90deg,#FC4A1A,#F7B733);
}

.card:hover{
    transform:translateY(-10px) scale(1.02);
    box-shadow:0 20px 40px rgba(252,74,26,0.15);
}

.card h3{
    color:#33363b;
    margin-bottom:12px;
    font-size:24px;
}

.card p{
    color:#6b7280;
    line-height:1.5;
    margin-bottom:20px;
}

/* Card Button */

.card a{
    text-decoration:none;
    display:inline-block;
    padding:12px 20px;
    border-radius:14px;
    background:linear-gradient(135deg,#FC4A1A,#F7B733);
    color:white;
    font-weight:bold;
    transition:0.3s;
}

.card a:hover{
    transform:scale(1.05);
}

/* Stats */

.stats{
    display:flex;
    gap:18px;
    margin-bottom:35px;
    flex-wrap:wrap;
}

.stat-box{
    flex:1;
    min-width:200px;
    background:white;
    padding:22px;
    border-radius:20px;
    box-shadow:0 8px 20px rgba(0,0,0,0.06);
}

.stat-box h2{
    color:#FC4A1A;
    font-size:32px;
}

.stat-box p{
    color:#6b7280;
    margin-top:6px;
}

/* Mobile */

@media(max-width:768px){

    .navbar{
        flex-direction:column;
        gap:15px;
    }

    .hero h1{
        font-size:28px;
    }
}
```
```css id="lcm2vg"
/* Funny Quiz Animation Section */

.quiz-animation{
    margin-top:50px;
    background:white;
    border-radius:28px;
    padding:40px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
    position:relative;
    overflow:hidden;
    min-height:320px;
}

/* Floating Question Marks */

.question-mark{
    position:absolute;
    font-size:40px;
    font-weight:bold;
    color:rgba(252,74,26,0.15);
    animation:floatQuestion 6s infinite ease-in-out;
}

.question-mark:nth-child(1){
    top:20px;
    left:40px;
}

.question-mark:nth-child(2){
    top:80px;
    right:60px;
    animation-duration:8s;
}

.question-mark:nth-child(3){
    bottom:40px;
    left:50%;
    animation-duration:7s;
}

@keyframes floatQuestion{

    0%{
        transform:translateY(0px) rotate(0deg);
    }

    50%{
        transform:translateY(-15px) rotate(10deg);
    }

    100%{
        transform:translateY(0px) rotate(0deg);
    }
}

/* Cartoon Student */

.student{
    position:absolute;
    bottom:20px;
    left:80px;
    animation:shakeHead 2s infinite;
}

/* Head */

.head{
    width:80px;
    height:80px;
    background:#ffd6a5;
    border-radius:50%;
    position:relative;
    margin:auto;
}

/* Hair */

.hair{
    width:85px;
    height:40px;
    background:#33363b;
    border-radius:50px 50px 10px 10px;
    position:absolute;
    top:-5px;
    left:-2px;
}

/* Eyes */

.eye{
    width:10px;
    height:10px;
    background:#333;
    border-radius:50%;
    position:absolute;
    top:35px;
}

.eye.left{
    left:22px;
}

.eye.right{
    right:22px;
}

/* Mouth */

.mouth{
    width:24px;
    height:10px;
    border-bottom:4px solid #333;
    border-radius:50%;
    position:absolute;
    bottom:18px;
    left:28px;
}

/* Body */

.body{
    width:110px;
    height:130px;
    background:linear-gradient(135deg,#FC4A1A,#F7B733);
    border-radius:25px;
    margin:auto;
    margin-top:-10px;
    position:relative;
}

/* Hands */

.hand{
    width:22px;
    height:80px;
    background:#ffd6a5;
    position:absolute;
    top:10px;
    border-radius:20px;
}

.hand.left{
    left:-18px;
    transform:rotate(25deg);
}

.hand.right{
    right:-18px;
    transform:rotate(-25deg);
}

/* Legs */

.leg{
    width:25px;
    height:80px;
    background:#2563eb;
    position:absolute;
    bottom:-70px;
    border-radius:20px;
}

.leg.left{
    left:20px;
}

.leg.right{
    right:20px;
}

/* Desk */

.desk{
    width:280px;
    height:18px;
    background:#8b5e3c;
    position:absolute;
    bottom:0;
    left:20px;
    border-radius:10px;
}

/* Paper */

.paper{
    width:100px;
    height:70px;
    background:white;
    position:absolute;
    top:40px;
    right:-120px;
    border-radius:10px;
    transform:rotate(-10deg);
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.paper::before{
    content:'2 + 2 = ?';
    position:absolute;
    top:12px;
    left:15px;
    color:#333;
    font-weight:bold;
}

.paper::after{
    content:'😵';
    position:absolute;
    bottom:10px;
    right:12px;
    font-size:24px;
}

/* Brain Loading */

.brain{
    position:absolute;
    top:-45px;
    right:-70px;
    font-size:50px;
    animation:brainSpin 2s infinite linear;
}

@keyframes brainSpin{

    0%{
        transform:rotate(0deg);
    }

    100%{
        transform:rotate(360deg);
    }
}

/* Head Shake */

@keyframes shakeHead{

    0%{
        transform:rotate(0deg);
    }

    25%{
        transform:rotate(3deg);
    }

    50%{
        transform:rotate(-3deg);
    }

    75%{
        transform:rotate(3deg);
    }

    100%{
        transform:rotate(0deg);
    }
}

/* Funny Text */

.quiz-text{
    position:absolute;
    right:60px;
    top:80px;
    max-width:350px;
}

.quiz-text h2{
    font-size:34px;
    color:#FC4A1A;
    margin-bottom:12px;
}

.quiz-text p{
    font-size:17px;
    color:#6b7280;
    line-height:1.6;
}

/* Mobile */

@media(max-width:768px){

    .quiz-animation{
        min-height:520px;
    }

    .student{
        left:50%;
        transform:translateX(-50%);
    }

    .quiz-text{
        position:relative;
        top:250px;
        right:0;
        text-align:center;
        max-width:100%;
    }
}
```

    </style>
</head>
<body>
<div class="navbar">
    <div class="brand">
        <div class="logo">QM</div>
        <div>
            <div style="font-weight:700">QuizMaster</div>
            <div style="font-size:12px;color:rgba(234,242,255,0.7)">Welcome to your dashboard</div>
        </div>
    </div>
    <div style="display:flex;gap:12px;align-items:center">
        <a href="add-question.jsp" style="color:inherit;text-decoration:none;padding:8px 12px;border-radius:8px;background:rgba(255,255,255,0.02)">Add Question</a>
        <a href="LogoutServlet" style="color:inherit;text-decoration:none;padding:8px 12px;border-radius:8px;background:rgba(255,255,255,0.02)">Logout</a>
    </div>
</div>

<div class="container">
    <div class="grid">
        <div class="card">
            <h3>Start Quiz</h3>
            <p class="small">Take a quick timed quiz to test your skills.</p>
            <a href="StartQuizServlet">Begin</a>
        </div>

        <div class="card">
            <h3>View Results</h3>
            <p class="small">Check previous attempts and scores.</p>
            <a href="ResultServlet">View</a>
        </div>

        <div class="card">
            <h3>Manage Questions</h3>
            <p class="small">Add new questions.</p>
            <a href="add-question.jsp">Manage</a>
        </div>

        <div class="card">
            <h3>Profile</h3>
            <p class="small">View your profile information.</p>
            <a href="ProfileServlet">Open</a>
        </div>
    </div>
</div>

</body>
</html>