<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/loginform.css'/>"/>
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>


</head>
<body>

<section id="login">
    <div class="container">

        <form id="loginForm" action="<c:url value="/login/loginProcess"/>" method="post"
              onsubmit="return loginFormCheck(this);">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div>
                <img src="<c:url value='/img/loginImg.png'/>" alt=""/>
            </div>
            <div id="msg">
                <c:if test="${LoginFailMessage!=null}">
                    <p> Error : <c:out value="${LoginFailMessage}"/></p><br/>
                </c:if>
            </div>
            <div id="loginBox">
                <div id="loginBox1">
                    <div class="loginBox1 userid">
                        <span>
                          <i class="fa-solid fa-user"></i>
                        </span>
                        <input name="id" type="text">
                    </div>
                    <div class="loginBox1 password">
                        <span>
                          <i class="fa-solid fa-lock"></i>
                        </span>
                        <input name="pwd" type="password">
                    </div>
                </div>
                <div id="loginBox2">
                    <button id="loginBtn">Login</button>
                </div>
            </div>
            <div class="buttons">
                <button type="button" onclick="location.href='<c:url value='/register/addUser'/>'">
                    신규가입
                </button>
                <button type="button" onclick="location.href='<c:url value='/register/findPwd'/>'">
                    비밀번호 찾기
                </button>
            </div>
        </form>
    </div>
</section>


<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>

<script>
    function loginFormCheck(frm) {
        if (frm.user_email.value.length == 0) {
            setMessage("** 아이디를 입력해 주세요  ")
            return false;
        }
        if (frm.user_pwd.value.length == 0) {
            setMessage("** 패스워드를 입력해 주세요")
            return false;
        }
        return true;
    }

    function setMessage(msg) {
        document.getElementById("msg").innerHTML = `${'${msg}'}`;
    }


</script>

</body>
</html>
