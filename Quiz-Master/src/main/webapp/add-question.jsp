<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question - QuizMaster</title>
    <style>
        body{margin:0;font-family:'Segoe UI',sans-serif;background:linear-gradient(180deg,#061226,#071b2b);color:#e9f4ff}
        .wrap{max-width:900px;margin:40px auto;padding:20px}
        .card{background:rgba(255,255,255,0.02);padding:20px;border-radius:12px;border:1px solid rgba(255,255,255,0.03)}
        label{display:block;font-size:14px;margin-top:8px;color:rgba(233,244,255,0.9)}
        input[type=text]{width:100%;padding:10px;border-radius:8px;border:1px solid rgba(255,255,255,0.06);background:transparent;color:inherit;margin-top:8px}
        .row{display:flex;gap:12px}
        .col{flex:1}
        .btn{margin-top:12px;padding:10px 14px;border-radius:10px;background:linear-gradient(90deg,#7c3aed,#06b6d4);border:none;color:white;cursor:pointer}
        .opts{margin-top:12px}
        .opts label{display:flex;align-items:center;gap:10px;margin:8px 0;padding:8px;border-radius:8px;background:rgba(255,255,255,0.01);cursor:pointer}
        .opts input[type=radio]{transform:scale(1.1)}
        .note{font-size:13px;color:rgba(233,244,255,0.7);margin-top:8px}
        @media (max-width:600px){.row{flex-direction:column}}
    </style>
</head>
<body>
<div class="wrap">
    <div class="card">
        <h2 style="margin:0 0 6px 0">Add Question</h2>
        <p style="margin:0 0 12px 0;color:rgba(233,244,255,0.8)">Enter the question and options below. Select the radio next to the correct option to auto-fill the answer field.</p>

        <form id="qForm" action="AddQuestionServlet" method="post">
            <label>Question</label>
            <input id="question" type="text" name="question" placeholder="Enter Question" required>

            <div class="opts">
                <label><input type="radio" name="correct" value="opt1"> <input class="opt" id="opt1" type="text" name="opt1" placeholder="Option 1" required></label>
                <label><input type="radio" name="correct" value="opt2"> <input class="opt" id="opt2" type="text" name="opt2" placeholder="Option 2" required></label>
                <label><input type="radio" name="correct" value="opt3"> <input class="opt" id="opt3" type="text" name="opt3" placeholder="Option 3"></label>
                <label><input type="radio" name="correct" value="opt4"> <input class="opt" id="opt4" type="text" name="opt4" placeholder="Option 4"></label>
            </div>

            <label>Correct Answer (auto-filled if you select one of the options)</label>
            <input id="answer" type="text" name="answer" placeholder="Correct Answer">

            <button class="btn" type="submit">Add Question</button>
            <div class="note">Tip: Select the radio next to the correct option to auto-fill the answer field.</div>
        </form>
    </div>
</div>

<script>
    // When user selects the radio, copy the corresponding option text into answer field
    document.querySelectorAll('input[name="correct"]').forEach(r=>{
        r.addEventListener('change', (e)=>{
            const val = e.target.value; // opt1, opt2, ...
            const input = document.getElementById(val);
            if(input) document.getElementById('answer').value = input.value || '';
        })
    })

    // Also update answer if option text changes while selected
    document.querySelectorAll('.opt').forEach(inp=>{
        inp.addEventListener('input', ()=>{
            const idx = inp.id; // opt1
            const radio = document.querySelector('input[name="correct"][value="'+idx+'"]');
            if(radio && radio.checked){ document.getElementById('answer').value = inp.value }
        })
    })
</script>

</body>
</html>