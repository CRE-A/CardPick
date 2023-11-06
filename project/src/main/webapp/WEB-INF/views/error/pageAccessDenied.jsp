<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PIB</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <%--  script --%>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script
          src="https://kit.fontawesome.com/43ede2213f.js"
          crossorigin="anonymous"
  ></script>
  <script
          defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGgEEcmo8EbPKj8kwDcpC8W18nIZvnq2U&callback=initMap"
  ></script>
  <style type="text/css">
    * {
      box-sizing: border-box;
      margin: auto;
    }

    .error {
      width: 600px;
    }

    .view {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);

    }

    .btn {
      cursor: pointer;
      display: inline-block;
      font-size: 0.85rem;
      font-weight: 400;
      padding: 12px 20px;
    }
  </style>

</head>
<body>

<div class="view">
  <img class="error" src="<c:url value='/images/accessDeny.jpg'/>" alt=""/>
  <button id="sendMain" class='btn' onclick="window.location.href='${request.contextPath}/'">홈으로</button>

</div>



</body>
</html>
