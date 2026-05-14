<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<title>Login - QuizMaster</title>

<style>

:root{
    --bg1:#fffdf7;
    --bg2:#fff7ed;
    --primary:#FC4A1A;
    --secondary:#F7B733;
}

html,body{
    height:100%;
    margin:0;
    font-family:'Segoe UI',Tahoma,Arial;
    background:linear-gradient(135deg,var(--bg1),var(--bg2));
    overflow:hidden;
}

/* Background Animation */

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
    top:55%;
    left:8%;
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

/* Main Wrapper */

.wrap{
    min-height:100%;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:30px;
    position:relative;
    z-index:2;
}

/* Login Card */

.card{
    width:400px;
    padding:35px;
    border-radius:28px;
    background:white;
    box-shadow:0 20px 45px rgba(0,0,0,0.08);
    animation:popup 0.7s ease;
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

/* Branding */

.brand{
    display:flex;
    align-items:center;
    gap:14px;
    margin-bottom:18px;
}

.logo{
    width:58px;
    height:58px;
    border-radius:18px;
    background:linear-gradient(135deg,var(--primary),var(--secondary));
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:700;
    color:white;
    font-size:24px;
    box-shadow:0 10px 25px rgba(252,74,26,0.25);
}

h2{
    margin:0;
    color:#33363b;
    font-size:28px;
}

p.sub{
    margin:6px 0 16px 0;
    color:#6b7280;
    font-size:14px;
}

/* Input Fields */

.field{
    position:relative;
}

input{
    width:100%;
    padding:15px;
    border-radius:16px;
    border:2px solid #ffe0c7;
    background:#fffaf5;
    color:#333;
    margin:10px 0;
    outline:none;
    font-size:15px;
    transition:0.3s;
}

input:focus{
    border-color:#FC4A1A;
    background:white;
    box-shadow:0 0 10px rgba(252,74,26,0.15);
}

/* Show Password */

.toggle{
    position:absolute;
    right:14px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    color:#FC4A1A;
    font-size:13px;
    font-weight:600;
}

/* Actions */

.actions{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:14px;
}

/* Button */

.btn{
    padding:13px 22px;
    border-radius:16px;
    border:none;
    background:linear-gradient(135deg,var(--primary),var(--secondary));
    color:white;
    font-weight:700;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
    box-shadow:0 10px 20px rgba(252,74,26,0.2);
}

.btn:hover{
    transform:translateY(-3px) scale(1.03);
}

/* Link */

a.link{
    color:#FC4A1A;
    text-decoration:none;
    font-size:14px;
    font-weight:600;
}

.hint{
    font-size:14px;
    color:#6b7280;
    text-align:center;
    margin-top:20px;
}

/* Responsive */

@media(max-width:420px){

    .card{
        width:95%;
        padding:25px;
    }
}

</style>

</head>

<body>

<!-- Animated Background -->

<div class="bg-circle circle1"></div>
<div class="bg-circle circle2"></div>
<div class="bg-circle circle3"></div>

<div class="wrap">

    <div class="card">

        <!-- Brand -->

        <div class="brand">

            <div class="logo">
                QM
            </div>

            <div>

                <h2>Welcome Back</h2>

                <p class="sub">
                    Sign in to continue to QuizMaster
                </p>

            </div>

        </div>

        <!-- Form -->

        <form id="loginForm"
              action="LoginServlet"
              method="post">

            <div class="field">

                <input type="email"
                       name="email"
                       placeholder="Enter your email"
                       required>

            </div>

            <div class="field">

                <input id="password"
                       type="password"
                       name="password"
                       placeholder="Enter your password"
                       required>

                <span id="toggle"
                      class="toggle">

                      Show

                </span>

            </div>

            <div class="actions">

                <label style="font-size:14px;color:#6b7280">

                    <input type="checkbox">

                    Remember

                </label>

                <button class="btn"
                        type="submit">

                    Login

                </button>

            </div>

        </form>

        <!-- Bottom -->

        <p class="hint">

            New here?

            <a class="link"
               href="register.jsp">

               Create an account

            </a>

        </p>

    </div>

</div>

<script>

const toggle =
document.getElementById('toggle');

const pwd =
document.getElementById('password');

toggle.addEventListener('click', ()=>{

    if(pwd.type === 'password')
    {
        pwd.type = 'text';

        toggle.innerText = 'Hide';
    }
    else
    {
        pwd.type = 'password';

        toggle.innerText = 'Show';
    }

});

/* Button Animation */

document.getElementById('loginForm')
.addEventListener('submit',(e)=>{

    const btn =
    e.target.querySelector('.btn');

    btn.disabled = true;

    btn.innerText =
    'Signing in...';

});

</script>

</body>

</html>