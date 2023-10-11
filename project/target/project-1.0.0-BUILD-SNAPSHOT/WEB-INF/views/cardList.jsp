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
    <title>PIB</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/cardlist.css'/>"/>

</head>
<body>
<div class="wrap__card">
        <section id="nav">
            <div class="return" onclick="location.href='<c:url value='/'/>'">
                <img src="<c:url value='/iconImg/goback.png'/>" alt=""/>
            </div>
        </section>
        <ul class="cards">
            <li>
                <a href="<c:url value='/card/select?no=${ind}_1'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_1.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_2'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_2.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_3'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_3.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_4'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_4.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_5'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_5.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_6'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_6.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_7'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_7.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_8'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_8.jpg'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_9'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_9.jpg'/>" alt=""/>
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
    function copyUrl(){
        navigator.clipboard.writeText(window.location.href).then(res=>{
            alert("주소가 복사되었습니다");
        })
    }

</script>

</body>
</html>
