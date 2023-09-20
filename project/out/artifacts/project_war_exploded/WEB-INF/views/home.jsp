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
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>
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
            width: 90%;
            vertical-align: top;
        }
        body {
            background: #f5f3fa;
        }
        .wrap__card {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width:700px;
            height: 960px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
        }

        .wrap__card #nav,
        .wrap__card #footer{
            width: 100%;
            height: 60px;
            background : red;
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
            height: calc(100% / 4 - 20px);
            perspective: 1000px;
            transform-style: preserve-3d;
            position: relative;
        }
        .cards li .view {
            position: absolute;
            padding: 10%;
            transition: transform 0.5s linear;
            width: 100%;
            height: 100%;
            user-select: none;
        }


    </style>
</head>
<body>

    <div class="wrap__card">
        <section id="nav">
            <button class="return">
                <i class="fa-solid fa-lock"></i>
            </button>
            <button class="return">
                <i class="fa-solid fa-lock"></i>
            </button>
        </section>

            <ul class="cards">
                <li>
                    <a href="<c:url value='/card/list?index=1'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index1.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=2'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index2.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=3'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index3.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=4'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index4.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=5'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index5.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=6'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index6.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=7'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index7.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=8'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index8.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=9'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index9.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=10'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index10.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=11'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index11.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/card/list?index=12'/>">
                        <div class="view">
                            <img src="<c:url value='/img/index12.png'/>" alt=""/>
                        </div>
                    </a>
                </li>
            </ul>
        <section id="footer">
            <button class="return">
                <i class="fa-solid fa-lock"></i>
            </button>
            <button class="return">
                <i class="fa-solid fa-lock"></i>
            </button>
            <button class="return">
                <i class="fa-solid fa-lock"></i>
            </button>
        </section>
    </div>


</body>
</html>
