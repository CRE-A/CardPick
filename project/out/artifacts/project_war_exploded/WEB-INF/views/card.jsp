<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>project</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        ul {
            list-style: none;
        }
        img {
            width: 100%;
            vertical-align: top;
        }
        body {
            background: #f5f3fa;
        }
        .wrap__card {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .card__inner {
            width: 700px;
            height: 900px;
            background-color: #fff;
            border-radius: 20px;
            padding: 30px;
        }
        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            align-content: space-around;
            width: 100%;
            height: 100%;

        }
        .cards li {
            width: calc(100% / 3 - 20px);
            height: calc(100% / 3 - 20px);
            perspective: 1000px;
            transform-style: preserve-3d;
            position: relative;
        }
        .cards li .view {
            position: absolute;
            padding: 10%;
            transition: transform 0.5s linear;
            backface-visibility: hidden;
            width: 100%;
            height: 100%;
            user-select: none;
            pointer-events: none;
        }
        .cards li .view.front {
            z-index: 10;

            transform: rotateY(0deg);
        }
        .cards li .view.back {
            transform: rotateY(180deg);
        }
        .cards li.flip .view.front {
            transform: rotateY(-180deg);
        }
        .cards li.flip .view.back {
            transform: rotateY(0deg);
        }

    </style>
</head>
<body>
<div class="wrap__card">
    <div class="card__inner">
        <ul class="cards">
            <li>
                <div class="view front">
                    <img src="<c:url value='/img/card${No}.png'/>" alt=""/>
                </div>
                <div class="view back">
                    <img src="<c:url value='/img/card${No}f.png'/>" alt=""/>
                </div>
            </li>
        </ul>
    </div>
</div>



<script>
    const cards =document.querySelectorAll(".cards li");

    cards.forEach(card => {
        card.addEventListener("click", flipCard);
    });


    let selectCard; // 선택한 카드

    function flipCard(e) {
        let clickedCard = e.target;
        if(clickedCard !== selectCard){
            selectCard = clickedCard
            selectCard.classList.add("flip");
        }else{
            selectCard.classList.remove("flip");
            selectCard = ""
        }

    }

</script>

</body>
</html>