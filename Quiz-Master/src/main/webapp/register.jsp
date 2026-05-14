<!DOCTYPE html>
<html>
<head>
    <title>Register - QuizMaster</title>
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

:root{
    --primary:#ff9a76;
    --secondary:#ffd699;
    --light:#fffaf5;
    --card:#ffffff;
    --text:#374151;
}

body{
    font-family:'Segoe UI',sans-serif;
    background:linear-gradient(135deg,#fffdfb,#fff7f2);
    min-height:100vh;
    overflow-x:hidden;
    position:relative;
}

/* Floating Background */

.bg-circle{
    position:absolute;
    border-radius:50%;
    opacity:0.18;
    animation:float 8s infinite ease-in-out;
}

.circle1{
   width:260px;
    height:260px;
    background:#ffbfa8;
    top:-90px;
    left:-90px;
}

.circle2{
   width:320px;
    height:320px;
    background:#ffe08a;
    bottom:-120px;
    right:-120px;
    animation-delay:2s;
}

.circle3{
    width:180px;
    height:180px;
    background:#b8e7ff;
    top:55%;
    left:10%;
    animation-delay:4s;
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

/* Wrapper */

.wrap{
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:40px;
    position:relative;
    z-index:2;
}

/* Main Card */

.card{
    width:950px;
    background:white;
    border-radius:34px;
    padding:35px;
    display:flex;
    gap:35px;
    box-shadow:0 20px 50px rgba(0,0,0,0.06);
    animation:popup 0.7s ease;
}

@keyframes popup{

    from{
        opacity:0;
        transform:scale(0.8);
    }

    to{
        opacity:1;
        transform:scale(1);
    }
}

/* Sections */

.left{
    flex:1.3;
}

.right{
    flex:1;
    background:#fff4ea;
    border-radius:28px;
    padding:35px;
    color:#5b3a29;
    position:relative;
    overflow:hidden;
}

/* Decorative Shapes */

.right::before{
    content:'';
    position:absolute;
    width:220px;
    height:220px;
    background:rgba(255,255,255,0.18);
    border-radius:50%;
    top:-80px;
    right:-60px;
}

.right::after{
    content:'';
    position:absolute;
    width:180px;
    height:180px;
    background:rgba(255,255,255,0.12);
    border-radius:50%;
    bottom:-70px;
    left:-50px;
}

/* Heading */

h2{
    color:#ff8a65;
    font-size:34px;
    margin-bottom:8px;
}

.sub{
    color:#6b7280;
    margin-bottom:25px;
    font-size:15px;
}

/* Form */

.form-row{
    display:flex;
    gap:15px;
}

/* Inputs */

input{
    width:100%;
    padding:15px;
    border-radius:18px;
    border:2px solid #f6d7c3;
    background:#fffaf7;
    outline:none;
    margin-top:12px;
    font-size:15px;
    color:#374151;
    transition:0.3s;
}

input:focus{
    border-color:#ffb799;
    background:white;
    box-shadow:0 0 12px rgba(255,183,153,0.2);
}

/* Password Meter */

.meter{
    height:10px;
    background:#f8e4d8;
    border-radius:20px;
    overflow:hidden;
    margin-top:12px;
}

.meter span{
    display:block;
    height:100%;
    width:0;
    background:linear-gradient(90deg,#ffb799,#ffd699);
    transition:0.3s;
}

/* Small Text */

.small{
    margin-top:8px;
    font-size:13px;
    color:#6b7280;
    line-height:1.7;
}

/* Button */

.btn{
    margin-top:22px;
    padding:15px 24px;
    border:none;
    border-radius:18px;
    background:linear-gradient(135deg,#ffb799,#ffd699);
    color:#5b3a29;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
    box-shadow:0 10px 25px rgba(255,183,153,0.18);
}

.btn:hover{
    transform:translateY(-3px);
}

/* Right Side */

.right h3{
    font-size:32px;
    margin-bottom:18px;
    position:relative;
    z-index:2;
}

.right ul{
    margin-top:18px;
    padding-left:22px;
    position:relative;
    z-index:2;
}

.right li{
    margin-bottom:16px;
    line-height:1.7;
    font-size:15px;
}

.right p{
    position:relative;
    z-index:2;
}

.right .btn{
    background:white;
    color:#ff8a65;
    text-decoration:none;
    display:inline-block;
    margin-top:20px;
}

/* Responsive */

@media(max-width:900px){

    .card{
        flex-direction:column;
        width:100%;
    }

    .form-row{
        flex-direction:column;
        gap:0;
    }
}

</style>
</head>
<body>
<!-- Background Circles -->

<div class="bg-circle circle1"></div>

<div class="bg-circle circle2"></div>

<div class="bg-circle circle3"></div>
<div class="wrap">
    <div class="card">
        <div class="left">
            <h2>Create your account</h2>
            <p class="sub">Join QuizMaster to create and take quizzes.</p>

            <form id="registerForm" action="RegisterServlet" method="post">

                <div class="form-row">
                    <input type="text" name="name" placeholder="Full Name" required>
                    <input type="email" name="email" placeholder="Email" required>
                </div>

                <div style="margin-top:10px">
                    <input id="regPassword" type="password" name="password" placeholder="Password" required>
                    <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Confirm Password" required>

                    <div class="meter"><span id="strength"></span></div>
                    <div class="small">Use letters, numbers and symbols.</div>
                </div>

                <div style="margin-top:10px" class="form-row">
                    <input type="text" name="phone" placeholder="Phone Number">
                    <input type="text" name="year" placeholder="Year (e.g. 3rd or 4th)">
                </div>

                <div style="margin-top:10px" class="form-row">
                    <input type="text" name="college" placeholder="College">
                    <input type="text" name="branch" placeholder="Branch">
                </div>

                <div style="margin-top:10px">
                    <input type="text" name="skills" placeholder="Skills (Java, SQL, etc)">
                </div>

                <button class="btn" type="submit">Create account</button>
            </form>
        </div>

        <div class="right">
            <h3>Why QuizMaster?</h3>
            <ul class="small">
                <li>Create quizzes quickly</li>
                <li>Track your progress</li>
                <li>Share with friends</li>
            </ul>

            <div style="margin-top:20px">
                <p class="small">Already have an account?</p>
                <a href="login.jsp" class="btn" style="display:inline-block;text-decoration:none">Sign in</a>
            </div>
        </div>
    </div>
</div>

<script>
    const pwd = document.getElementById('regPassword');
    const confirmPwd = document.getElementById('confirmPassword');
    const meter = document.getElementById('strength');

    function scorePassword(s){
        let score=0;
        if(s.length>=8) score+=2;
        if(/[A-Z]/.test(s)) score++;
        if(/[0-9]/.test(s)) score++;
        if(/[^A-Za-z0-9]/.test(s)) score++;
        return Math.min(5,score);
    }

    pwd.addEventListener('input', ()=>{
        const s = scorePassword(pwd.value);
        meter.style.width = (s/5*100)+'%';

        if(s<=2) meter.style.background='linear-gradient(90deg,#f97316,#f43f5e)';
        else if(s==3) meter.style.background='linear-gradient(90deg,#f59e0b,#f97316)';
        else meter.style.background='linear-gradient(90deg,#10b981,#06b6d4)';
    });

    document.getElementById('registerForm').addEventListener('submit', (e)=>{
        if(pwd.value !== confirmPwd.value){
            alert("Passwords do not match!");
            e.preventDefault();
            return;
        }

        const btn = document.querySelector('.btn');
        btn.disabled = true;
        btn.innerText = "Creating...";
    });
</script>
</body>
</html>