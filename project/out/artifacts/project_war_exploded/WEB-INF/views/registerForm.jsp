<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbarSearchX.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/registerForm_hb.css'/>"/>
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>

    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

    <style>

        body{
            overflow: hidden;
        }
        section#wrap {
            width: 100vw;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: absolute;
            align-items: center;
            /*background-color: rgba(255, 0, 0, 0.31);*/
        }

    </style>
</head>

<body>

<section id="wrap">

    <!-- NAVBAR -->
    <section id="navbar" class="register">
        <ul class="menu">
            <li class="menu item">
                <a href="<c:url value='/hotdeal/list'/>">
                    <i class="fa-solid fa-user"></i>
                </a>
            </li>
            <li class="menu item">
                <a href="<c:url value='/hotdeal/list'/>">
                    <i class="fa-solid fa-user"></i>
                </a>
            </li>
        </ul>
    </section>

    <%-- New Register Form --%>

    <section id="register">
        <form name="frm" action="" id="registerForm" method="post">
            <%--            --%>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <%--            --%>

            <div class="inputBox">
                <span id="result">id</span>
                <input type="text" name="id" onkeyup="return idChk()" required/>
                <span>체크아이디</span>
            </div>

            <div class="inputBox">
                <span>이름</span>
                <input type="text" name="name" required/>
            </div>
            <div class="inputBox">
                <span>핸드폰</span>
                <input type="text" name="phone" required/>
            </div>
            <div class="inputBox">
                <span id="passResult">비밀번호 - 대문자 혹은 소문자와 숫자를 합해 6자리 이상 12자리 이하</span>
                <%--                <input type="password" name="pwd" pattern="^(?=.*[a-zA-z])(?=.*[0-9]).{6,12}$" required/>--%>
                <input type="password" name="pwd" required/>
            </div>


            <div class="inputBox">
                <span>비밀번호 확인</span>
                <%--                <input type="password" class="user_pwd_check" pattern="^(?=.*[a-zA-z])(?=.*[0-9]).{6,12}$" onkeyup="passChk()" required/>--%>
                <input type="password" class="user_pwd_check" onkeyup="passChk()" required/>
            </div>

            <div class="inputBox">
                <span>이메일</span>
                <%--                <input type="text" name="email" required/>--%>
                <input type="email" name="email" required/>
            </div>
            <div class="inputBox">
                <span>부서</span>
                <input type="text" name="dpt" required/>
            </div>
            <button type="submit" id="registerBtn">회원가입</button>
        </form>
    </section>

</section>



<script>

    let passCheck = true;
    let idCheck = true;

    function idChk() {
        const id = document.frm.id.value;
        console.log(id)
        let resultText = document.querySelector("#result");

        // if (id.indexOf('@') != -1 && id.indexOf('.com') != -1) {
        if (id.indexOf('') !== -1) {

<%--            <security:authorize access="isAnonymous()">--%>
            $.ajax({
                type: 'POST',
                <%--url:'${pageContext.request.contextPath}/member/readId',--%>
                url: '<c:url value='/register/checkID'/>',
                header: {"Content-Type": "application/json"},
                dateType: 'json',
                data: {id: id},
                success: function (result) {
                    console.log("result = " + result)
                    if (result == true) {
                        resultText.style.color = 'red'
                        resultText.innerHTML = '중복되는 아이디'
                        idCheck = true
                        inputCheck()
                    } else {
                        resultText.style.color = 'blue'
                        resultText.innerHTML = '사용가능한 아이디'
                        idCheck = false
                        inputCheck()
                    }
                }
            })
        } else {
            result.style.color = 'red'
            result.innerHTML = '일치하지 않는 형식'
        }
<%--        </security:authorize>--%>
    }

    function inputCheck() {
        if (idCheck == false) {
            const submit = document.querySelector("#registerBtn");
            submit.disabled = false;
        } else {
            submit.disabled = true;
        }
    }

    function passChk() {
        const pass = document.frm.pwd.value
        const passChk = document.querySelector(".user_pwd_check").value;
        console.log(passChk);
        let result = document.querySelector("#passResult")

        if(pass == passChk){
            result.style.color = 'blue'
            result.innerHTML = '일치하는 비밀번호'
            passCheck = false
            inputCheck()

        } else {
            result.style.color = 'red'
            result.innerHTML = '일치하지 않는 비밀번호'

            passCheck = true
            inputCheck()
        }
    }


</script>


</body>
</html>

