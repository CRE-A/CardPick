<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Mypage</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/myPage.css'/>"/>
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>
    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>

<section id="container">
    <section id="nav">
        <div class="return" onclick="location.href='<c:url value='/'/>'">
            <img src="<c:url value='/iconImg/goback.png'/>" alt=""/>
        </div>
    </section>
    <section id="mypage">
        <div class="itemBox">
            <span class="icon">⊙</span>
            <span class="title">이름:</span>
<%--            <span class="info">사용가능 기간(2023.1.1~2023.1.1)</span>--%>
<%--            <span class="info">사용가능 기간(${userDetailsDto.regdate}~2023.1.1)</span>--%>
<%--            <span class="name">임휘성</span>--%>
            <span class="name">${userDetailsDto.name}</span>
        </div>
        <div class="itemBox">
            <span class="icon">⊙</span>
            <span class="title">아이디:</span>
<%--            <span class="name">testId</span>--%>
<%--            <span class="name">${userDetailsDto.id}</span>--%>
            <span class="name">${id}</span>
        </div>
        <div class="itemBox">
            <span class="icon">⊙</span>
            <span class="title">이메일:</span>
            <span class="name">${userDetailsDto.email}</span>
        </div>
    </section>
    <hr/>
    <section id="updatePWD">
        <div class="itemBox">
            <span class="icon">⊙</span>
            <span class="title">패스워드 변경</span>
        </div>
        <form id="pwdForm" class="passwords">
            <div class="itemPwd">
                <div class="password">
                    <span class="title">기존 패스워드 : </span>
                    <input type="text" required/>
                    <span class="message">비밀번호를 입력하세요</span>
                </div>
                <button class="none">패스워드 변경</button>
            </div>
            <div class="itemPwd">
                <div class="password">
                    <span class="title">변경 패스워드 : </span>
                    <input type="text" name="pwd" required/>
                </div>
                <button class="none">패스워드 변경</button>
            </div>
            <div class="itemPwd">
                <div class="password">
                    <span class="title">확인 패스워드 : </span>
                    <input type="text" name="pwd2" required/>
                </div>
                <button class="updateBtn" type="button" id="changePwdBtn">패스워드 변경</button>
            </div>
        </form>
    </section>
    <hr/>
    <section id="updatePersonal">
        <div class="itemBox">
            <span class="icon">⊙</span>
            <span class="title">소속, 전화번호 변경</span>
        </div>
        <form id="modifyForm" method="post">
            <div class="itemPersonal">
                <div class="item">
                    <span class="title">소속 : </span>
                    <input type="text" name="dpt" value="${userDetailsDto.dpt}"/>
                </div>
                <button class="none">수정</button>
            </div>
            <div class="itemPersonal">
                <div class="item">
                    <span class="title">전화번호 : </span>
                    <input type="text" name="phone" ${userDetailsDto.phone}/>
                </div>
                <button class="modifyBtn" type="button" id="changeDptPhoneBtn">수정</button>
            </div>
        </form>
    </section>
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
</section>



<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>


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
                Sheader: {"Content-Type": "application/json"},
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

        if (pass == passChk) {
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

<%--JQuery--%>
<script>
    $(document).ready(() => {

        $("#changePwdBtn").on("click", function () {
            alert("btn clicked")
            let form = $("#pwdForm");
            form.attr("action", "<c:url value="/user/changePwd?${_csrf.parameterName}=${_csrf.token}"/>");
            form.attr("method", "post");
            form.submit();

        }) //암호(pwd) 수정




        $("#changeDptPhoneBtn").on("click", function () {
            alert("btn clicked")
            let form = $("#modifyForm");
            form.attr("action", "<c:url value="/user/changeDptPhone?${_csrf.parameterName}=${_csrf.token}"/>");
            form.attr("method", "post");
            form.submit();

        }) //부서,전화번호(dpt,phone) 수정



    }); // ready()
</script>

</body>
</html>

