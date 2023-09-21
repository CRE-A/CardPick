<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>findPassword</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/findPwdForm.css'/>"/>
</head>
<body>
<section id="container">
    <div class="box">
        <div class="title">
            회원 등록시 입력한 아이디, 이메일을 입력해주세요
        </div>
        <form id="form" method="post" action="<c:url value='/register/findPwd'/>">
            <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}"
            />
            <div class="inputBox">
                <div class="item">
<%--                    <span class="message">아이디를 입력해주세요</span>--%>
                    <span class="id">아이디:</span>
                    <input class="inputitem" type="text" required name="id"/>
                </div>
                <button class="none"></button>
            </div>
            <div class="inputBox">
                <div class="item">
<%--                    <span class="message">이메일을 입력해주세요</span>--%>
                    <span class="id">이메일:</span>
                    <input class="inputitem" type="text" required name="email"/>
                </div>
                <button class="sendBtn">메일발송</button>
            </div>
        </form>
        <span class="infomessage">비밀번호 초기화 메일이 발송됩니다.</span>
    </div>
</section>

<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>

</body>
</html>
