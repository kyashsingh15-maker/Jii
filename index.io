<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>From My Heart ❤️</title>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;600&family=Inter:wght@400;500&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    height: 100vh;
    background: radial-gradient(circle at top, #ffd6e0, #ee9ca7, #9d174d);
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Inter', sans-serif;
    overflow: hidden;
}

.heart {
    position: absolute;
    color: rgba(255,255,255,0.9);
    animation: float 13s linear infinite;
    filter: drop-shadow(0 0 14px rgba(255,255,255,0.9));
}

@keyframes float {
    from { transform: translateY(130vh) scale(0.8); opacity: 0; }
    20% { opacity: 1; }
    to { transform: translateY(-20vh) scale(1.3); opacity: 0; }
}

.card {
    background: rgba(255,255,255,0.98);
    padding: 60px 70px;
    border-radius: 30px;
    box-shadow: 0 50px 150px rgba(0,0,0,0.3);
    text-align: center;
    max-width: 480px;
    z-index: 2;
    animation: popIn 1.4s ease;
    position: relative;
}

@keyframes popIn {
    from { transform: scale(0.7); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
}

h1 {
    font-family: 'Playfair Display', serif;
    font-size: 26px;
    color: #b71c1c;
    margin-bottom: 20px;
}

input {
    width: 100%;
    padding: 15px 20px;
    border-radius: 18px;
    border: 1px solid #ddd;
    font-size: 14px;
    outline: none;
    margin-top: 20px;
}

.buttons {
    display: flex;
    gap: 20px;
    justify-content: center;
    margin-top: 30px;
    position: relative;
}

button {
    border-radius: 999px;
    border: 1px solid #b71c1c;
    background: transparent;
    cursor: pointer;
    transition: all 0.25s ease;
    padding: 15px 42px;
    font-size: 14px;
}

button:hover {
    background: #b71c1c;
    color: white;
    box-shadow: 0 0 20px rgba(183,28,28,0.6);
}

#message {
    margin-top: 22px;
    font-size: 13px;
    color: #b71c1c;
}
</style>
</head>

<body>

<script>
for (let i = 0; i < 80; i++) {
    const h = document.createElement("div");
    h.className = "heart";
    h.innerHTML = "❤";
    h.style.left = Math.random() * 100 + "vw";
    h.style.fontSize = (18 + Math.random() * 28) + "px";
    h.style.animationDuration = (8 + Math.random() * 7) + "s";
    h.style.animationDelay = Math.random() * 8 + "s";
    document.body.appendChild(h);
}
</script>

<div class="card">
    <h1 id="question"></h1>
    <input id="answerInput" type="text" placeholder="Type your answer here…" style="display:none;">
    <div class="buttons">
        <button id="yesBtn" onclick="yes()">Yes</button>
        <button id="noBtn" onclick="no()">No</button>
    </div>
    <div id="message"></div>
</div>

<script>
let step = 0;

let answers = {
  q1:"", q2:"", q3:"", q4:"", q5:"", q6:"", q7:""
};

const questions = [
  { q: "Will you be my Valentine ? ❤️", type: "yesno" },
  { q: "Kya aap meri life mein hamesha ke liye rehna chahti ho? 🫶", type: "input" },
  { q: "And who is closest to your heart? (Either Parents?) 💞", type: "input" },
  { q: "Mujhme aapko kya kya achcha lagta hai? ✨", type: "input" },
  { q: "Iss Valentine pe aapko kya gift chahiye? 🎁", type: "input" },
  { q: "Any wish that you want to complete in your life? 🌙", type: "input" },
  { q: "Tumhari zindagi ka konsa moment tum hamesha yaad rakhna chahti ho? 💭", type: "input" }
];

function render() {
  const q = document.getElementById("question");
  const input = document.getElementById("answerInput");
  const noBtn = document.getElementById("noBtn");
  const yesBtn = document.getElementById("yesBtn");

  if (step < questions.length) {
    q.innerText = questions[step].q;
    if (questions[step].type === "input") {
      input.style.display = "block";
      yesBtn.innerText = step === questions.length - 1 ? "Finish ❤️" : "Next";
      noBtn.style.display = "none";
    } else {
      input.style.display = "none";
      yesBtn.innerText = "Yes";
      noBtn.style.display = "inline-block";
    }
  }
}

render();

function no() {
  const noBtn = document.getElementById("noBtn");
  const card = document.querySelector(".card");
  noBtn.style.position = "absolute";
  noBtn.style.left = Math.random() * (card.offsetWidth - 110) + "px";
  noBtn.style.top = Math.random() * (card.offsetHeight - 55) + "px";
  document.getElementById("message").innerText = "Hehe 😏 NO itna asaan nahi";
}

function yes() {
  const input = document.getElementById("answerInput");

  if (step > 0 && !input.value.trim()) {
    document.getElementById("message").innerText = "Please answer this 💕";
    return;
  }

  if (step === 0) answers.q1 = "Yes";
  if (step > 0) answers["q" + (step + 1)] = input.value;

  input.value = "";
  document.getElementById("message").innerText = "";

  step++;

  if (step === questions.length) {
    document.getElementById("question").innerText = "I promise 😉❤️";
    document.getElementById("answerInput").style.display = "none";
    document.querySelector(".buttons").style.display = "none";

    setTimeout(() => {
      const text =
`Valentine Answers ❤️

1️⃣ Valentine: ${answers.q1}
2️⃣ Hamesha saath?: ${answers.q2}
3️⃣ Closest to heart: ${answers.q3}
4️⃣ Mujhme kya acha laga: ${answers.q4}
5️⃣ Gift: ${answers.q5}
6️⃣ Life wish: ${answers.q6}
7️⃣ Yaadgar moment: ${answers.q7}`;

      window.location.href =
        "https://wa.me/919411409919?text=" + encodeURIComponent(text);
    }, 3000);

  } else {
    render();
  }
}
</script>

</body>
</html>
