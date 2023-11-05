<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PIB</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/card.css'/>"/>


</head>
<body>
<div class="wrap__card">
    <section id="nav">
        <div class="return">
            <img src="<c:url value='/iconImg/goback.png'/>"
                 onclick="location.href='<c:url value='/card/prevPage?no=${No}'/>'" alt=""/>
            <img src="<c:url value='/iconImg/bottleImg.png'/>" onclick="location.href='<c:url value='/'/>'" alt=""/>
            <div class="return" onclick="location.href='<c:url value='/'/>'">
    </section>
    <div class="card__inner">
        <ul class="cards">
            <li>
                <div class="view front">
                    <img src="<c:url value='/img/card${No}.jpg'/>" alt=""/>
                </div>
                <div class="view back">
                    <img src="<c:url value='/img/card${No}f.jpg'/>" alt=""/>
                </div>
            </li>
        </ul>
    </div>
    <section id="footer">
        <button class="return" type="button" onclick="copyUrl()">
            <img src="<c:url value='/iconImg/link.png'/>" alt=""/>
        </button>
        <button class="return" type="button" id="deleteAll">
            <img src="<c:url value='/iconImg/rotate.png'/>" alt=""/>
        </button>
        <button class="return" type="button" onclick="location.href='<c:url value='/card/selectedCardList'/>'">
            <img src="<c:url value='/iconImg/cardImg.png'/>" alt=""/>
        </button>
    </section>
</div>


<script>
    const cards = document.querySelectorAll(".cards li");
    const deleteAll = document.querySelector("#deleteAll");
    deleteAll.addEventListener("click", () => {
        const msg = confirm("리스트 전체를 삭제합니다. 진행하시겠습니까?");

        if (msg) {
            location.href = '<c:url value='/card/deleteAll'/>';
        }


    })

    cards.forEach(card => {
        card.addEventListener("click", flipCard);
    });


    let selectCard; // 선택한 카드

    function flipCard(e) {
        let clickedCard = e.target;
        if (clickedCard !== selectCard) {
            selectCard = clickedCard
            selectCard.classList.add("flip");
        } else {
            selectCard.classList.remove("flip");
            selectCard = ""
        }
    }


    function copyUrl() {
        navigator.clipboard.writeText(window.location.href).then(res => {
            alert("주소가 복사되었습니다");
        })
    };


</script>

</body>
</html>