<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbarSearchX.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/loginform.css'/>"/>
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>

    <style>
        #navbar.login{
            -webkit-box-shadow: 0px 4px 0px -200px rgba(189,189,189,1);
            -moz-box-shadow: 0px 4px 0px -200px rgba(189,189,189,1);
            box-shadow: 0px 4px 0px -200px rgba(189,189,189,1);
        }
    </style>

</head>
<body>

<%--<section id="background"--%>
<%--         style="background-image:  url('https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60') ;"></section>--%>
<%--<h1 class="h1">로그인</h1>--%>
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
                        <input name="id" type="text" >
                    </div>
                    <div class="loginBox1 password">
                        <span>
                          <i class="fa-solid fa-lock"></i>
                        </span>
                        <input name="pwd" type="password" >
                    </div>
                </div>
                <div id="loginBox2">
                    <button id="loginBtn">Login</button>
                </div>
            </div>
            <div class="buttons">
                <button>
                    <a href="<c:url value="/register/addUser"/>">신규 가입 </a>
                </button>
                <button>
                    <a href="<c:url value="/register/findPwd"/>">비밀번호 찾기 </a>
                </button>
            </div>
        </form>
    </div>
</section>




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

    if(${not empty sns_email}){
        document.getElementById("loginBtn").click();
    }




</script>

</body>
</html>
