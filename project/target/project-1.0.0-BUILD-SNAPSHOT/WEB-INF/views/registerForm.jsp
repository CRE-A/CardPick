<%@ page language="java" contentType="text/html; charset=UTF-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
prefix="security" uri="http://www.springframework.org/security/tags" %> <%@ page
session="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%--    <meta name="_csrf" th:content="${_csrf.token}" />--%>
<%--    <meta name="_csrf_header" th:content="${_csrf.headerName}" />--%>
    <title>Registration</title>
    <!-- CSS -->
    <%--
    <link rel="stylesheet" href="<c:url value='/css/navbarSearchX.css'/>" />
    --%>
    <link rel="stylesheet" href="<c:url value='/css/registerForm.css'/>" />

    <%-- script --%>
    <script
      src="https://kit.fontawesome.com/43ede2213f.js"
      crossorigin="anonymous"
    ></script>

    <!-- JQUERY -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  </head>

  <body>
    <section id="container">
      <section id="nav">
        <button class="return" type="button">
          <a href="<c:url value='/login/login'/>">
            <i class="fa-solid fa-circle-arrow-left"></i>
          </a>
        </button>
      </section>
      <form action="" name="frm" method="post">
        <input
          type="hidden"
          name="${_csrf.parameterName}"
          value="${_csrf.token}"
        />
        <ul class="inputList">
          <li class="inputBox">
            <div class="inputBox items">
              <div class="inputBox items item1">
                <span>⊙</span>
              </div>
              <div class="inputBox items name">
                <span>이름:</span>
              </div>
              <span class="requestField">이름을 입력해주세요.</span>
              <input required placeholder="이름" type="text" name="name" />
            </div>
            <button class="none"></button>
          </li>
          <li class="inputBox">
            <div class="inputBox items">
              <div class="inputBox items item1">
                <span>⊙</span>
              </div>
              <div class="inputBox items name">
                <span>아이디:</span>
              </div>
              <span class="requestField">아이디를 입력해주세요.</span>
              <input required placeholder="아이디" type="text" name="id" />
            </div>
            <button
              class="checkBtn"
              id="chkIdBtn"
              type="button"
              onclick="idChk()"
            >
              체크아이디
            </button>
          </li>
          <li class="inputBox">
            <div class="inputBox items">
              <div class="inputBox items item1">
                <span>⊙</span>
              </div>
              <div class="inputBox items name">
                <span>패스워드:</span>
              </div>
              <span class="requestField">패스워드를 입력해주세요.</span>
              <input
                required
                placeholder="패스워드"
                type="password"
                name="pwd"
              />
              <div class="inputBox items span">
                <span id="pwdSpan"> (5자 이상 입력)</span>
              </div>
            </div>
          </li>
          <li class="inputBox">
            <div class="inputBox items">
              <div class="inputBox items item1">
                <span>⊙</span>
              </div>
              <div class="inputBox items name">
                <span>이메일:</span>
              </div>
              <span class="requestField">이메일을 입력해주세요.</span>
              <input required placeholder="이메일" type="text" name="email" />
            </div>
            <button class="none"></button>
          </li>
          <li class="inputBox">
            <div class="inputBox items">
              <div class="inputBox items item1">
                <span>⊙</span>
              </div>
              <div class="inputBox items name">
                <span>소 속:</span>
              </div>
              <span class="requestField">소속을 입력해주세요.</span>
              <input required placeholder="소속" type="text" name="dpt" />
            </div>
            <button class="none"></button>
          </li>
          <li class="inputBox">
            <div class="inputBox items">
              <div class="inputBox items item1">
                <span>⊙</span>
              </div>
              <div class="inputBox items name">
                <span>전화번호:</span>
              </div>
              <span class="requestField">전화번호를 입력해주세요.</span>
              <input required placeholder="전화번호" type="text" name="phone" />
            </div>
            <button class="none"></button>
          </li>
        </ul>
        <div class="infoBox">
          <div class="agreement">
            <input required type="checkbox" />
            <label for="">정보 동의</label>
          </div>
          <button class="registerBtn" type="submit" id="registerBtn">
            신규가입
          </button>
        </div>
      </form>
      <section id="footer">
        <div class="info">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima sint
          debitis reprehenderit labore id est impedit nihil. Nemo, in qui
          dignissimos unde incidunt officia perferendis, quia suscipit
          voluptates facere enim. Lorem ipsum dolor sit amet consectetur
          adipisicing elit. Minima sint debitis reprehenderit labore id est
          impedit nihil. Nemo, in qui dignissimos unde incidunt officia
          perferendis, quia suscipit voluptates facere enim. Lorem ipsum dolor
          sit amet consectetur adipisicing elit. Minima sint debitis
          reprehenderit labore id est impedit nihil. Nemo, in qui dignissimos
          unde incidunt officia perferendis, quia suscipit voluptates facere
          enim. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima
          sint debitis reprehenderit labore id est impedit nihil. Nemo, in qui
          dignissimos unde incidunt officia perferendis, quia suscipit
          voluptates facere enim. Lorem ipsum dolor sit amet consectetur
          adipisicing elit. Minima sint debitis reprehenderit labore id est
          impedit nihil. Nemo, in qui dignissimos unde incidunt officia
          perferendis, quia suscipit voluptates facere enim. Lorem ipsum dolor
          sit amet consectetur adipisicing elit. Minima sint debitis
          reprehenderit labore id est impedit nihil. Nemo, in qui dignissimos
          unde incidunt officia perferendis, quia suscipit voluptates facere
          enim. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima
          sint debitis reprehenderit labore id est impedit nihil. Nemo, in qui
          dignissimos unde incidunt officia perferendis, quia suscipit
          voluptates facere enim. Lorem ipsum dolor sit amet consectetur
          adipisicing elit. Minima sint debitis reprehenderit labore id est
          impedit nihil. Nemo, in qui dignissimos unde incidunt officia
          perferendis, quia suscipit voluptates facere enim. Lorem ipsum dolor
          sit amet consectetur adipisicing elit. Minima sint debitis
          reprehenderit labore id est impedit nihil. Nemo, in qui dignissimos
          unde incidunt officia perferendis, quia suscipit voluptates facere
          enim. Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima
          sint debitis reprehenderit labore id est impedit nihil. Nemo, in qui
          dignissimos unde incidunt officia perferendis, quia suscipit
          voluptates facere enim.
        </div>
      </section>
    </section>



    <c:if test="${msg!=null}">
      <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
      </script>
    </c:if>


<%--    <span id="resultText">msg</span>--%>

    <script>

      <%--    const token = $("meta[name='_csrf']").attr("content")--%>
      <%--    const header = $("meta[name='_csrf_header']").attr("content");--%>
      <%--    const name = $("#userName").val();--%>


      <%--    let passCheck = true;--%>
      <%--    let idCheck = true;--%>

      <%--    function idChk() {--%>
      <%--        const id = document.frm.id.value;--%>
      <%--        console.log(id)--%>
      <%--        let resultText = document.querySelector("#resultText");--%>

      <%--        // if (id.indexOf('@') != -1 && id.indexOf('.com') != -1) {--%>
      <%--        if (id.indexOf('') !== -1) {--%>

      <%--            &lt;%&ndash;            <security:authorize access="isAnonymous()">&ndash;%&gt;--%>
      <%--            $.ajax({--%>
      <%--                type: 'POST',--%>
      <%--                &lt;%&ndash;url:'${pageContext.request.contextPath}/member/readId',&ndash;%&gt;--%>
      <%--                url: '<c:url value='/register/checkID'/>',--%>
      <%--                header: {"Content-Type": "application/json"},--%>
      <%--                dateType: 'json',--%>
      <%--                data: {id: id},--%>
      <%--                beforeSend : function(xhr) {--%>
      <%--                    xhr.setRequestHeader(header, token);--%>
      <%--                    xhr.setRequestHeader("Content-type","application/json");--%>
      <%--                },--%>
      <%--                success: function (result) {--%>
      <%--                    console.log("result = " + result)--%>
      <%--                    if (result == true) {--%>
      <%--                        resultText.style.color = 'red'--%>
      <%--                        resultText.innerHTML = '중복되는 아이디'--%>
      <%--                        idCheck = true--%>
      <%--                        inputCheck()--%>
      <%--                    } else {--%>
      <%--                        resultText.style.color = 'blue'--%>
      <%--                        resultText.innerHTML = '사용가능한 아이디'--%>
      <%--                        idCheck = false--%>
      <%--                        inputCheck()--%>
      <%--                    }--%>
      <%--                }--%>
      <%--            })--%>
      <%--        } else {--%>
      <%--            result.style.color = 'red'--%>
      <%--            result.innerHTML = '일치하지 않는 형식'--%>
      <%--        }--%>
      <%--        &lt;%&ndash;        </security:authorize>&ndash;%&gt;--%>
      <%--    }--%>

      <%--   function inputCheck() {--%>
      <%--       if (idCheck == false) {--%>
      <%--           const submit = document.querySelector("#registerBtn");--%>
      <%--           submit.disabled = false;--%>
      <%--       } else {--%>
      <%--           submit.disabled = true;--%>
      <%--       }--%>
      <%--   }--%>

          // function passChk() {
          //     const pass = document.frm.pwd.value
          //     const passChk = document.querySelector(".user_pwd_check").value;
          //     console.log(passChk);
          //     let result = document.querySelector("#passResult")
          //
          //     if (pass == passChk) {
          //         result.style.color = 'blue'
          //         result.innerHTML = '일치하는 비밀번호'
          //         passCheck = false
          //         inputCheck()
          //
          //     } else {
          //         result.style.color = 'red'
          //         result.innerHTML = '일치하지 않는 비밀번호'
          //
          //         passCheck = true
          //         inputCheck()
          //     }
          // }
    </script>

    <script>
          $(document).ready(() => {

              $("#registerBtn").on("click", () => {

                  let form = $("#form");
                  alert("btn clicked")
                  <%--form.attr("action", "<c:url value='/review/write?${_csrf.parameterName}=${_csrf.token}'/>")--%>
                  form.attr("action", "<c:url value='/register/addUser'/>")
                  form.attr("method", "post")
                  // form.attr("enctype", "multipart/form-data")
                  form.submit();

              }); // submit



              // $("#chkIdBtn").on("click", () => {
              //
              //     alert("ChkID BTN btn clicked")
              //     const id = document.frm.id.value;
              //     console.log(id)
              //     let resultText = document.querySelector("#resultText");
              //     console.log(resultText)


      <%--            // if (id.indexOf('@') != -1 && id.indexOf('.com') != -1) {--%>
      <%--            if (id.indexOf('') !== -1) {--%>

      <%--&lt;%&ndash;                            <security:authorize access="isAnonymous()">&ndash;%&gt;--%>
      <%--                $.ajax({--%>
      <%--                    type: 'POST',--%>
      <%--                    &lt;%&ndash;url:'${pageContext.request.contextPath}/member/readId',&ndash;%&gt;--%>
      <%--                    url: '<c:url value='/register/checkID'/>',--%>
      <%--                    header: {"Content-Type": "application/json"},--%>
      <%--                    dateType: 'json',--%>
      <%--                    data: {id: id},--%>
      <%--                    beforeSend : function(xhr) {--%>
      <%--                        xhr.setRequestHeader(header, token);--%>
      <%--                    },--%>
      <%--                    success: function (result) {--%>
      <%--                        console.log("result = " + result)--%>
      <%--                        if (result == true) {--%>
      <%--                            resultText.style.color = 'red'--%>
      <%--                            resultText.innerHTML = '중복되는 아이디'--%>
      <%--                            idCheck = true--%>
      <%--                            inputCheck()--%>
      <%--                        } else {--%>
      <%--                            resultText.style.color = 'blue'--%>
      <%--                            resultText.innerHTML = '사용가능한 아이디'--%>
      <%--                            idCheck = false--%>
      <%--                            inputCheck()--%>
      <%--                        }--%>
      <%--                    }--%>
      <%--                })--%>
      <%--            } else {--%>
      <%--                result.style.color = 'red'--%>
      <%--                result.innerHTML = '일치하지 않는 형식'--%>
      <%--            }--%>
      <%--&lt;%&ndash;            </security:authorize>&ndash;%&gt;--%>


      <%--            &lt;%&ndash;let form = $("#form");&ndash;%&gt;--%>
      <%--            &lt;%&ndash;alert("btn clicked")&ndash;%&gt;--%>
      <%--            &lt;%&ndash;&lt;%&ndash;form.attr("action", "<c:url value='/review/write?${_csrf.parameterName}=${_csrf.token}'/>")&ndash;%&gt;&ndash;%&gt;--%>
      <%--            &lt;%&ndash;form.attr("action", "<c:url value='/register/checkID'/>")&ndash;%&gt;--%>
      <%--            &lt;%&ndash;form.attr("method", "post")&ndash;%&gt;--%>
      <%--            &lt;%&ndash;// form.attr("enctype", "multipart/form-data")&ndash;%&gt;--%>
      <%--            &lt;%&ndash;form.submit();&ndash;%&gt;--%>

      <%--        }); // submit--%>

      <%--        function inputCheck() {--%>
      <%--            if (idCheck == false) {--%>
      <%--                const submit = document.querySelector("#registerBtn");--%>
      <%--                submit.disabled = false;--%>
      <%--            } else {--%>
      <%--                submit.disabled = true;--%>
      <%--            }--%>
      <%--        }--%>

          });
    </script>
  </body>
</html>
