<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>HelloQuest (||) Start</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        :root{
            --bg1:#7c3aed;
            --bg2:#22c55e;
            --bg3:#38bdf8;

            --ink:#0b1020;           /* толстая “обводка” */
            --paper:#fff6d9;         /* карточки */
            --paper2:#ffe7a3;        /* стикеры */
            --panel:#ffffff;
            --muted:rgba(11,16,32,.72);
            --shadow:rgba(0,0,0,.22);
        }

        *{ box-sizing:border-box; }
        html, body{ height:100%; }

        body{
            margin:0;
            min-height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
            padding:28px 16px;

            color:var(--ink);
            font-family: "Comic Sans MS", "Trebuchet MS", system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;

            background:
                    radial-gradient(800px 520px at 18% 12%, rgba(255,255,255,.35), transparent 60%),
                    radial-gradient(900px 620px at 82% 22%, rgba(255,255,255,.25), transparent 62%),
                    radial-gradient(700px 560px at 55% 92%, rgba(255,255,255,.22), transparent 60%),
                    radial-gradient(circle at 20% 25%, rgba(255,200,0,.33), transparent 36%),
                    radial-gradient(circle at 80% 30%, rgba(0,255,170,.26), transparent 40%),
                    radial-gradient(circle at 50% 85%, rgba(0,170,255,.24), transparent 42%),
                    linear-gradient(135deg, var(--bg1), var(--bg2), var(--bg3));
            position:relative;
            overflow-x:hidden;
        }

        /* “конфетти-звёзды” */
        body::before{
            content:"";
            position:absolute;
            inset:0;
            pointer-events:none;
            opacity:.55;
            background:
                    radial-gradient(2px 2px at 8% 12%, #fff, transparent 60%),
                    radial-gradient(2px 2px at 18% 72%, #fff, transparent 60%),
                    radial-gradient(2px 2px at 35% 25%, #fff, transparent 60%),
                    radial-gradient(2px 2px at 55% 15%, #fff, transparent 60%),
                    radial-gradient(2px 2px at 76% 68%, #fff, transparent 60%),
                    radial-gradient(2px 2px at 90% 28%, #fff, transparent 60%),
                    radial-gradient(1.5px 1.5px at 62% 45%, #fff, transparent 60%),
                    radial-gradient(1.5px 1.5px at 42% 82%, #fff, transparent 60%);
            filter: drop-shadow(0 2px 0 rgba(0,0,0,.14));
        }

        /* Main card wrapper */
        .wrap{
            width:min(980px, 100%);
            position:relative;
            z-index:1;
        }

        .badge{
            display:inline-flex;
            gap:10px;
            align-items:center;
            padding:8px 12px;
            border:3px solid var(--ink);
            background: rgba(255,255,255,.72);
            border-radius:999px;
            color: rgba(11,16,32,.78);
            font-size:13px;
            letter-spacing:.2px;
            box-shadow: 0 12px 0 rgba(0,0,0,.16);
        }
        .dot{
            width:10px;height:10px;border-radius:50%;
            background:#22c55e;
            border:2px solid var(--ink);
            box-shadow: 0 0 0 3px rgba(255,255,255,.55) inset;
        }

        .card{
            margin-top:14px;
            border:4px solid var(--ink);
            background: var(--paper);
            border-radius:28px;
            padding:26px 22px;
            box-shadow:
                    0 22px 0 rgba(0,0,0,.18),
                    0 28px 70px var(--shadow);
            position:relative;
        }

        /* мультяшные “стикеры” */
        .card::before, .card::after{
            content:"";
            position:absolute;
            width:46px; height:46px;
            border:4px solid var(--ink);
            border-radius:16px;
            background: var(--paper2);
            top:-20px;
            box-shadow: 0 12px 0 rgba(0,0,0,.14);
            transform: rotate(10deg);
        }
        .card::before{ left:22px; }
        .card::after{ right:22px; transform: rotate(-12deg); }

        header{
            display:flex;
            flex-direction:column;
            gap:10px;
            align-items:center;
            text-align:center;
            margin-bottom:18px;
            position:relative;
            padding-top: 6px;
        }

        /* ВОТ ТУТ “КАРТИНКА ПРИШЕЛЬЦА” — чисто стилем, без изменения HTML */
        header::after{
            content:"";
            position:absolute;
            top:-16px;
            right:-6px;
            width:86px;
            height:86px;
            background-size:contain;
            background-repeat:no-repeat;
            background-position:center;
            transform: rotate(8deg);
            filter: drop-shadow(0 12px 0 rgba(0,0,0,.14));
            pointer-events:none; /* важно: не мешает кликам по input/button */
            opacity:1;

            /* SVG data-uri (мультяшный пришелец) */
            background-image: url("data:image/svg+xml;utf8,\
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 120 120'>\
<path d='M60 14 C60 6 80 6 80 18' fill='none' stroke='rgb(11,16,32)' stroke-width='6' stroke-linecap='round'/>\
<circle cx='82' cy='18' r='10' fill='rgb(124,255,203)' stroke='rgb(11,16,32)' stroke-width='6'/>\
<ellipse cx='60' cy='58' rx='44' ry='38' fill='rgb(124,255,203)' stroke='rgb(11,16,32)' stroke-width='6'/>\
<circle cx='32' cy='64' r='6' fill='rgb(255,107,107)' opacity='0.75'/>\
<circle cx='88' cy='64' r='6' fill='rgb(255,107,107)' opacity='0.75'/>\
<ellipse cx='42' cy='58' rx='14' ry='20' fill='rgb(11,16,32)'/>\
<ellipse cx='78' cy='58' rx='14' ry='20' fill='rgb(11,16,32)'/>\
<circle cx='46' cy='52' r='4' fill='white'/>\
<circle cx='82' cy='52' r='4' fill='white'/>\
<path d='M44 78 C54 90 66 90 76 78' fill='none' stroke='rgb(11,16,32)' stroke-width='6' stroke-linecap='round'/>\
<path d='M30 92 C44 80 76 80 90 92 L86 112 C74 102 46 102 34 112 Z' fill='white' stroke='rgb(11,16,32)' stroke-width='6' stroke-linejoin='round'/>\
<circle cx='52' cy='98' r='4' fill='rgb(255,209,102)' stroke='rgb(11,16,32)' stroke-width='4'/>\
<circle cx='68' cy='98' r='4' fill='rgb(123,220,255)' stroke='rgb(11,16,32)' stroke-width='4'/>\
</svg>");
            animation: alienBob 2.6s ease-in-out infinite;
        }

        @keyframes alienBob{
            0%,100%{ transform: translateY(0) rotate(8deg); }
            50%{ transform: translateY(-6px) rotate(5deg); }
        }

        h1{
            margin:0;
            font-size: clamp(28px, 3.8vw, 48px);
            letter-spacing: .3px;
            line-height:1.05;
            color: var(--ink);
            text-shadow: 0 3px 0 rgba(255,255,255,.75);
        }

        .subtitle{
            margin:0;
            color: var(--muted);
            max-width: 72ch;
            font-size: 14.6px;
        }

        .grid{
            display:grid;
            grid-template-columns: 1fr;
            gap:14px;
        }
        @media (min-width: 860px){
            .grid{ grid-template-columns: 1fr 1fr; }
        }

        .panel{
            border:4px solid var(--ink);
            border-radius:22px;
            padding:16px 16px 14px;

            /* пастельный градиент + лёгкий узор */
            background:
                    radial-gradient(16px 16px at 18px 18px, rgba(255,209,102,.35), transparent 60%),
                    radial-gradient(16px 16px at 70px 40px, rgba(124,255,203,.28), transparent 60%),
                    radial-gradient(16px 16px at 40px 78px, rgba(123,220,255,.28), transparent 60%),
                    linear-gradient(180deg, #ffffff, #f7fbff);

            box-shadow: 0 14px 0 rgba(0,0,0,.14);
        }

        /* Разные “вкусы” для левой и правой колонки */
        .grid .panel:nth-child(1){
            background:
                    radial-gradient(16px 16px at 18px 18px, rgba(255,209,102,.38), transparent 60%),
                    radial-gradient(16px 16px at 70px 40px, rgba(255,107,107,.22), transparent 60%),
                    linear-gradient(180deg, #ffffff, #fff7e6);
        }
        .grid .panel:nth-child(2){
            background:
                    radial-gradient(16px 16px at 18px 18px, rgba(124,255,203,.34), transparent 60%),
                    radial-gradient(16px 16px at 70px 40px, rgba(123,220,255,.30), transparent 60%),
                    linear-gradient(180deg, #ffffff, #e9fbff);
        }

        /* Заголовки чуть “мультяшнее” */
        .panel h2{
            margin:0 0 10px;
            font-size: 17px;
            letter-spacing: .2px;
        }

        /* Бейджи Log/Briefing сделаем ярче */
        .panel h2 .tag{
            border:3px solid var(--ink);
            padding:2px 10px;
            border-radius:999px;
            background:#fde68a; /* по умолчанию */
        }
        .grid .panel:nth-child(2) h2 .tag{
            background:#a7f3d0;
        }

        /* Текст внутри — темнее, крупнее, приятнее читается */
        pre{
            margin:0;
            white-space: pre-wrap;
            color: rgba(11,16,32,.90);
            line-height: 1.65;
            font-size: 14.4px;
        }

        form{
            margin-top: 16px;
            display:flex;
            flex-direction:column;
            gap:10px;
            align-items:stretch;
        }

        label{
            color: rgba(11,16,32,.86);
            font-size: 13.8px;
        }

        .inputRow{
            display:flex;
            gap:10px;
            flex-wrap:wrap;
            align-items:center;
            justify-content:center;
        }

        input[type="text"]{
            width: min(520px, 100%);
            padding: 12px 14px;
            border-radius: 16px;
            border:4px solid var(--ink);
            background: #fff;
            color: var(--ink);
            outline:none;
            box-shadow: 0 10px 0 rgba(0,0,0,.12);
            transition: transform .12s ease;
        }
        input[type="text"]::placeholder{ color: rgba(11,16,32,.45); }
        input[type="text"]:focus{ transform: translateY(-1px); }

        button{
            appearance:none;
            border:4px solid var(--ink);
            cursor:pointer;
            padding: 12px 18px;
            border-radius: 16px;
            font-weight: 900;
            letter-spacing: .3px;
            color: var(--ink);
            background: linear-gradient(90deg, #7CFFCB, #7bdcff, #ffd166);
            box-shadow: 0 12px 0 rgba(0,0,0,.16);
            transition: transform .12s ease;
            min-width: 190px;
            white-space: nowrap;
        }
        button:hover{ transform: translateY(-2px); }
        button:active{ transform: translateY(0px); }

        .footerHint{
            margin-top: 10px;
            text-align:center;
            font-size: 12.8px;
            color: rgba(11,16,32,.62);
        }

        .ufo{
            width: 18px; height: 18px;
            display:inline-block;
            filter: drop-shadow(0 0 0 rgba(0,0,0,0));
        }
    </style>
</head>

<body>
<div class="wrap">
    <div class="badge">
        <span class="dot"></span>
        <span>UFO Quest • Prologue • Launch Pad</span>
    </div>

    <section class="card">
        <header>
            <h1><span class="ufo">🛸</span> HelloQuest — Start</h1>
            <p class="subtitle">
                A tiny text adventure with a suspiciously friendly crew and an even more suspiciously quiet universe.
            </p>
        </header>

        <div class="grid">
            <div class="panel">
                <h2>Prologue <span class="tag">Log</span></h2>
                <pre>
You wake up in a spaceport, and your head is gently bobbing around aboard
your ship. Isn’t this what you always dreamed of? Becoming the captain
of an interstellar vessel with a crew that will do heroic stuff…
mostly because you told them to.

So… onward, Captain!
          </pre>
            </div>

            <div class="panel">
                <h2>Meet the Crew <span class="tag">Briefing</span></h2>
                <pre>
When you step onto the ship, a girl greets you with a smart smile in her eyes:

— Hello, Commander! I’m Zinaida — your assistant.
See that corner? That’s our helmsman, Sergeant “Hangover Trail,” drinking coffee.
Under the wheel, our ship mechanic, Bogdan “The Dark One,” is asleep on duty (as tradition demands).
And yes, Sergey “Steel Heel” is photographing him — he’s our navigator. Don’t ask.

So… what should we call you, Captain?
          </pre>

                <form action="start" method="post">
                    <label for="playerName">Introduce yourself, Commander:</label>
                    <div class="inputRow">
                        <input
                                type="text"
                                id="playerName"
                                name="playerName"
                                placeholder="Enter your name"
                                required
                                value="${sessionScope.playerName != null ? sessionScope.playerName : ''}"
                        />
                        <button type="submit">Start the adventure</button>
                    </div>
                    <div class="footerHint">Tip: you can use any name — the universe won’t judge.</div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>
