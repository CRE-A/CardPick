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
    <link rel="stylesheet" href="<c:url value='/css/selectedCardList.css'/>"/>
    <%-- FontAwesome--%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>
    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div class="wrap__card">
    <%--    <div class="card__inner">--%>
    <section id="nav">
        <div class="return">
            <%--            <img src="<c:url value='/iconImg/white.png'/>" alt="" onclick="location.href='<c:url value='/'/>'"/>--%>
            <img src="<c:url value='/iconImg/white.png'/>" alt=""/>
        </div>
    </section>

    <%--        <div class="card__inner">--%>
    <ul class="cards">
        <c:forEach var="selectedCardsList" items="${selectedCardsList}">
            <li>
                <i id="deleteBtn" class="fa-regular fa-circle-xmark" onclick="location.href='<c:url
                        value='/card/deleteCard?${_csrf.parameterName}=${_csrf.token}&cardNo=${selectedCardsList.cardNo}'/>'"></i>
                <div class="view front">
                    <img src="<c:url value='/img/card${selectedCardsList.cardNo}.jpg'/>" alt=""/>
                </div>
                <div class="view back">
                    <img src="<c:url value='/img/card${selectedCardsList.cardNo}f.jpg'/>" alt=""/>
                </div>
            </li>

        </c:forEach>
    </ul>


    <%--        </div>--%>
    <section id="footer">
        <button class="return" type="button" onclick="copyUrl()">
            <img src="<c:url value='/iconImg/link.png'/>" alt=""/>
        </button>
        <button id="minus" class="return" type="button" onclick="">
            <img src="<c:url value='/iconImg/minus.png'/>" alt=""/>
        </button>
        <%--        <button id="deleteAll" class="return" type="button" onclick="location.href='<c:url value='/card/deleteAll'/>'">--%>
        <button id="deleteAll" class="return" type="button">
            <img src="<c:url value='/iconImg/rotate.png'/>" alt=""/>
        </button>
        <button class="return" type="button" onclick="location.href='<c:url value='/'/>'">
            <img src="<c:url value='/iconImg/bottleImg.png'/>" alt=""/>
        </button>
    </section>
    <%--    </div>--%>
</div>

<c:if test="${clicked !=null}">
<%--<c:if test="${clicked eq 'true'}">--%>
    <script type="text/javascript">
        $(document).ready(function () {
            document.querySelector("#minus").click();
        });
    </script>
</c:if>


<script>
    const cards = document.querySelectorAll(".cards li");
    const deleteBtn = document.querySelectorAll("#deleteBtn");
    const minus = document.querySelector("#minus");
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
    };

    function copyUrl() {
        navigator.clipboard.writeText(window.location.href).then(res => {
            alert("주소가 복사되었습니다");
        })
    };

    minus.addEventListener("click", () => {
        deleteBtn.forEach(btn => btn.classList.toggle("active")
        )
    })


    <%--deleteBtn.forEach(btn =>--%>
    <%--    btn.addEventListener("click", () => {--%>
    <%--        const cardNo = btn.dataset.id;--%>
    <%--        $.ajax({--%>
    <%--            type: 'POST',--%>
    <%--            url: '<c:url value='/card/deleteCard?${_csrf.parameterName}=${_csrf.token}'/>',--%>
    <%--            Sheader: {"Content-Type": "application/json"},--%>
    <%--            dateType: 'json',--%>
    <%--            data: {cardNo: cardNo},--%>
    <%--            success: function (data, textStatus) {--%>
    <%--                if (data.redirect) {--%>
    <%--                    // data.redirect contains the string URL to redirect to--%>
    <%--                    window.location.href = data.redirect;--%>
    <%--                }--%>
    <%--            }--%>

    <%--        })--%>
    <%--    })--%>
    <%--)--%>


</script>


</body>
</html>
