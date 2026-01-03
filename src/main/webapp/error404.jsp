<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>404 - Not Found | Space Quest</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        :root{
            --bg1:#7c3aed;
            --bg2:#22c55e;
            --bg3:#38bdf8;

            --ink:#0b1020;
            --paper:#fff6d9;
            --paper2:#ffe7a3;
            --panel:#ffffff;
            --muted:rgba(11,16,32,.72);
        }

        *{ box-sizing:border-box; }
        html, body{ height:100%; }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;

            padding: 24px 16px;
            color: var(--ink);
            font-family: "Comic Sans MS", "Trebuchet MS", system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;

            background:
                    radial-gradient(800px 520px at 18% 12%, rgba(255,255,255,.35), transparent 60%),
                    radial-gradient(900px 620px at 82% 22%, rgba(255,255,255,.25), transparent 62%),
                    radial-gradient(700px 560px at 55% 92%, rgba(255,255,255,.22), transparent 60%),
                    radial-gradient(circle at 20% 25%, rgba(255,200,0,.33), transparent 36%),
                    radial-gradient(circle at 80% 30%, rgba(0,255,170,.26), transparent 40%),
                    radial-gradient(circle at 50% 85%, rgba(0,170,255,.24), transparent 42%),
                    linear-gradient(135deg, var(--bg1), var(--bg2), var(--bg3));
            position: relative;
            overflow-x: hidden;
        }

        /* confetti stars */
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

        h1{
            margin: 0 0 8px 0;
            font-size: clamp(28px, 4vw, 46px);
            letter-spacing: .3px;
            line-height: 1.05;
            color: var(--ink);
            text-shadow: 0 3px 0 rgba(255,255,255,.75);
            position: relative;
            padding-right: 90px; /* space for the alien */
        }

        /* alien sticker */
        h1::after{
            content:"";
            position:absolute;
            top:-14px;
            right:-6px;
            width:80px;
            height:80px;
            background-size:contain;
            background-repeat:no-repeat;
            background-position:center;
            transform: rotate(8deg);
            filter: drop-shadow(0 12px 0 rgba(0,0,0,.14));
            pointer-events:none;

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
</svg>");
            animation: alienBob 2.6s ease-in-out infinite;
        }

        @keyframes alienBob{
            0%,100%{ transform: translateY(0) rotate(8deg); }
            50%{ transform: translateY(-6px) rotate(5deg); }
        }

        div, p, h1, h2, h3 { max-width: 900px; }

        .panel{
            border: 4px solid var(--ink);
            background: var(--paper);
            border-radius: 22px;
            padding: 14px 16px;
            box-shadow: 0 14px 0 rgba(0,0,0,.14);
        }

        hr {
            width: 80%;
            max-width: 900px;
            margin: 16px 0;
            border: 0;
            height: 4px;
            background: rgba(11,16,32,.85);
            border-radius: 999px;
            box-shadow: 0 6px 0 rgba(0,0,0,.12);
        }

        h2{
            margin: 10px 0 8px 0;
            border: 4px solid var(--ink);
            background: #ffffff;
            border-radius: 18px;
            padding: 10px 14px;
            box-shadow: 0 14px 0 rgba(0,0,0,.14);
        }

        p{
            margin: 10px 0;
            color: rgba(11,16,32,.88);
            line-height: 1.45;
        }

        .badge{
            display:inline-block;
            border: 4px solid var(--ink);
            border-radius: 999px;
            background: var(--paper2);
            padding: 8px 14px;
            font-weight: 900;
            box-shadow: 0 10px 0 rgba(0,0,0,.14);
            margin-top: 6px;
        }

        /* Links as buttons */
        a{
            display:inline-flex;
            align-items:center;
            justify-content:center;

            padding: 12px 18px;
            margin: 6px 8px 0;
            line-height: 1.25;

            border: 4px solid var(--ink);
            border-radius: 16px;
            background: linear-gradient(90deg, #ffd166, #7bdcff, #7cffcb);
            color: var(--ink);
            font-weight: 900;
            text-decoration: none;
            white-space: nowrap;

            box-shadow: 0 5px 0 var(--ink);
            transition: transform .12s ease, filter .12s ease, box-shadow .12s ease;
        }

        a:hover{
            transform: translateY(-2px);
            filter: brightness(1.03);
            box-shadow: 0 12px 0 var(--ink);
        }
        a:active{
            transform: translateY(0px);
            filter: brightness(.98);
            box-shadow: 0 8px 0 var(--ink);
        }

        .tiny{
            margin-top: 12px;
            color: rgba(11,16,32,.72);
            font-size: 12px;
        }
    </style>
</head>

<body>

<h1>Space Quest</h1>

<div class="badge">404 — Not Found</div>

<hr>

<h2>Lost in space! This page doesn't exist.</h2>

<div class="panel">
    <p>The page you requested is not here.</p>
    <p>Either you typed the address wrong… or a space gremlin stole it.</p>

    <p>
        <a href="start">Go to Home</a>
        <a href="game?step=start">Start the Game</a>
    </p>

    <p class="tiny">
        Tip: If you got here after pressing a big red button — yes, it’s related.
    </p>
</div>

</body>
</html>
