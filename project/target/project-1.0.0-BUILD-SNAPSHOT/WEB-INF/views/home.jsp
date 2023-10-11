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
    <link rel="stylesheet" href="<c:url value='/css/home.css'/>"/>
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>

</head>
<body>
<div class="wrap__card">
    <section id="nav">
        <button class="return" type="button" onclick="location.href='<c:url value='/user/main'/>'">
            <i class="fa-solid fa-gears fa-rotate-270"></i>
        </button>
    </section>
    <ul class="cards">
        <li>
            <a href="<c:url value='/card/list?ind=1'/>">
                <div class="view">
                    <img src="<c:url value='/img/index1.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=2'/>">
                <div class="view">
                    <img src="<c:url value='/img/index2.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=3'/>">
                <div class="view">
                    <img src="<c:url value='/img/index3.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=4'/>">
                <div class="view">
                    <img src="<c:url value='/img/index4.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=5'/>">
                <div class="view">
                    <img src="<c:url value='/img/index5.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=6'/>">
                <div class="view">
                    <img src="<c:url value='/img/index6.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=7'/>">
                <div class="view">
                    <img src="<c:url value='/img/index7.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=8'/>">
                <div class="view">
                    <img src="<c:url value='/img/index8.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=9'/>">
                <div class="view">
                    <img src="<c:url value='/img/index9.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=10'/>">
                <div class="view">
                    <img src="<c:url value='/img/index10.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=11'/>">
                <div class="view">
                    <img src="<c:url value='/img/index11.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
        <li>
            <a href="<c:url value='/card/list?ind=12'/>">
                <div class="view">
                    <img src="<c:url value='/img/index12.PNG'/>" alt=""/>
                </div>
            </a>
        </li>
    </ul>
    <section id="footer">
        <button class="return" type="button" onclick="copyUrl()">
            <img src="<c:url value='/iconImg/link.png'/>" alt=""/>
        </button>
        <button class="return" type="button" onclick="location.href='<c:url value='/card/deleteAll'/>'">
            <img src="<c:url value='/iconImg/rotate.png'/>" alt=""/>
        </button>
        <button class="return" type="button" onclick="location.href='<c:url value='/card/selectedCardList'/>'">
            <img src="<c:url value='/iconImg/cardImg.png'/>" alt=""/>
        </button>
    </section>
</div>


<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>

<script>
    function copyUrl() {
        navigator.clipboard.writeText(window.location.href).then(res => {
            alert("주소가 복사되었습니다");
        })
    }

</script>

</body>
</html>
