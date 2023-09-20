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
            width: 90%;
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
            width: 100%;
            height: 100%;
            user-select: none;
        }


    </style>
</head>
<body>
<div class="wrap__card">
    <div class="card__inner">
        <ul class="cards">
            <li>
                <a href="<c:url value='/card/select?no=${ind}_1'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_1.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_2'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_2.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_3'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_3.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_4'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_4.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_5'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_5.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_6'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_6.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_7'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_7.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_8'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_8.png'/>" alt=""/>
                    </div>
                </a>
            </li>
            <li>
                <a href="<c:url value='/card/select?no=${ind}_9'/>">
                    <div class="view">
                        <img src="<c:url value='/img/card${ind}_9.png'/>" alt=""/>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>


</body>
</html>
