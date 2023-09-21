<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib
        prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page
        session="false" %>  

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    pageContext.setAttribute("br","<br/>");
    pageContext.setAttribute("cn","\n");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Registration</title>
    <!-- CSS -->
    <%--
    <link rel="stylesheet" href="<c:url value='/css/navbarSearchX.css'/>" />
    --%>
    <link rel="stylesheet" href="<c:url value='/css/registerForm.css'/>"/>

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
    <form action="" name="frm" method="post" id="form">
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
<%--                    <span class="requestField">이름을 입력해주세요.</span>--%>
                    <input required placeholder="이름" type="text" name="name" data-name="이름" valud="${userDto.name}"/>
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
<%--                    <span class="requestField">아이디를 입력해주세요.</span>--%>
                    <input required placeholder="아이디" type="text" name="id" data-name="아이디" value="${userDto.id}"/>
                </div>
                <button
                        class="checkBtn"
                        id="chkIdBtn"
                        type="button"
                <%--              onclick="idChk()"--%>
                >
                    체크아이디
                </button>
                <input type="hidden" id="isIdChecked" placeholder="false" value="${chk}">
            </li>
            <li class="inputBox">
                <div class="inputBox items">
                    <div class="inputBox items item1">
                        <span>⊙</span>
                    </div>
                    <div class="inputBox items name">
                        <span>패스워드:</span>
                    </div>
<%--                    <span class="requestField">패스워드를 입력해주세요.</span>--%>
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
<%--                    <span class="requestField">이메일을 입력해주세요.</span>--%>
                    <input required placeholder="이메일" type="text" name="email" data-name="이메일" value="${userDto.email}"/>
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
<%--                    <span class="requestField">소속을 입력해주세요.</span>--%>
                    <input required placeholder="소속" type="text" name="dpt" data-name="소속" value="${userDto.dpt}"/>
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
<%--                    <span class="requestField">전화번호를 입력해주세요.</span>--%>
                    <input required placeholder="전화번호" type="text" name="phone" data-name="전화번호" value="${userDto.phone}"/>
                </div>
                <button class="none"></button>
            </li>
        </ul>
        <div class="infoBox">
            <div class="agreement">
                <input required type="checkbox" data-name="정보동의"/>
                <label for="">정보 동의</label>
            </div>
            <button class="registerBtn" type="submit" id="registerBtn">
                신규가입
            </button>
        </div>
    </form>
    <section id="footer">
        <div class="info">
            개인정보 수집 및 이용 방침<br/>
            퍼스널이미지브랜딩(이하 PIB) 개인정보 처리방침<br/>
            PIB는 개인정보법 제30조 등 관련법령상의 개인정보 보호규정을 준수하며, 개인정보 처리방침은 아래와 같습니다.<br/>
            <br/>
            제 1조 (개인정보의 처리 및 보유기간)<br/>
            1. PIB는 법령에 따른 개인정보 보유,이용기간 또는 정보주체로부터 수집할 때 동의받은 보유기간 내에서 개인정보를 처리합니다.<br/>
            <br/>
            2.각각의 개인정보 처리 및 보유기간은 다음과 같습니다.<br/>
            1) 홈페이지 회원 가입 및 관리 : 홈페이지 탈퇴시까지<br/>
            다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br/>
             (1)관계 법령 위반에 따른 수사,조사 등이 진행중인 경우에는 해당 수사,조사,종료시 까지<br/>
             (2)홈페이지 이용에 따른 채권,채무관계 잔존시에는 해당 채권,채무관계 정산시까지<br/>
            <br/>
            2. 재화 또는 서비스 제공 : 재화,서비스 공급완료 및 요금결제, 정산 완료시까지<br/>
            다만 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지<br/>
             1)[전자상거래 등에서의 소비자 보호에 관한 법률] 에 따른 표시,광고,계약내용 및 이행 등 거래에 관한 기록<br/>
             -표시,광고에 관한 기록:6월<br/>
             -계약 또는 청약철회, 대금결제, 재화 등 공급기록:5년<br/>
             -소비자 불만 또는 분쟁처리에 관한 기록:3년<br/>
             2) [통신비밀보호법] 제 41조에 따른 통신사실확인자료 보관<br/>
             -컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료:3개월<br/>
            <br/>
            제 2조 (개인정보의 제3자 제공)<br/>
            PIB는 원칙적으로 정보주체의 개인정보를 본래의 목적 범위를 초과하여 처리하거나 제 3자에게 제공하지 않습니다. 단, 다음의 경우에는 개인정보를 제 3자에게 제공할 수 있습니다.<br/>
            1.정보 주체로부터 별도의 동의를 받은 경우<br/>
            2.법률에 특별한 규정이 있는 경우<br/>
            3.정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제 3자의 급박한 생명, 신체, 재산의 이익을 위햐여 필요하다고 인정되는 경우<br/>
            4.통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정한 개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우<br/>
            5.개인정보를 목적 외의 용도로 이용하거나 이를 제 3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우<br/>
            6.조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우<br/>
            7.범죄의 수사와 공소의 제기 및 유치를 위하여 필요한 경우<br/>
            8.법원의 재판업무 수행을 위하여 필요한 경우<br/>
            9.형 및 감호, 보호처분의 집행을 위하여 필요한 경우<br/>
            <br/>
            제 3조 (개인정보처리 위탁)<br/>
            PIB는 위탁계약 시 개인정보 관련 법규를 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 보관하고 있습니다. 또한 업체 변경 시는 개인정보 처리방침을 통해 고지하고 있습니다.<br/>
            <br/>
            제 4조 (정보주체의 권리,의무 및 행사방법)<br/>
            정보주차는 자신의 개인정보에 대해 다음과 같은 권리를 행사할 수 있습니다.<br/>
            1.개인정보 열람 요구 : [개인정보보호법] 제35(개인정보의 열람)에 따라 열람을 요구할 수 있습니다.<br/>
            2.개인정보 정정,삭제 요구 : [개인정보보호법] 제36(개인정보 정정,삭제)에 따라 정정,삭제를 요구할 수 있습니다.<br/>
            3.개인정보 처리정지 요구 : [개인정보보호법] 제37(개인정보의 처리정지 등)에 따라 처리정지를 요구할 수 있습니다.<br/>
            <br/>
            제 5조(처리하는 개인정보 항목)<br/>
            PIB는 다음의 개인정보 항목을 처리하고 있습니다.<br/>
            1. 홈페이지 회원 가입 및 관리<br/>
            .필수항목:단체명,성명,아이디(이메일주소),비밀번호,주소,전화번호,성별<br/>
            2.재화 또는 서비스 제공<br/>
            .필수항목:단체명,성명,생년월일,아이디(이메일주소),비밀번호,주소,전화번호,신용카드번호,은행계좌정보 등 결제정보<br/>
            3.인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.<br/>
            .IP주소,쿠키,MAC주소,서비스 이용기록,방문기록,불량 이용기록 등<br/>
            <br/>
            제 6조(개인정보의 파기 절차 및 방법)<br/>
            PIB는 개인정보 보유기간과 경과,처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br/>
            1.파기절차:파기 사유가 발생한 개인정보를 선정한 후, PIB의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br/>
            2.파기방법:PIB는 전자적 파일형태로 기록,저장된 개인정보를 재생할 수 없도록 파기합니다.<br/>
            <br/>
            제 9조(개인정보 보호책임자 및 담당자 연락처)<br/>
            1.PIB 개인정보 보호책임자:김옥기<br/>
            2.개인정보보호 실무담당자<br/>
            부서명:사업지원단<br/>
            성명:김성준<br/>
            연락처:(02)<br/>
            메일:<br/>
            팩스:(02)<br/>
            <br/>
            제 10조(개인정보 처리방침 변경)<br/>
            1.이 개인정보 처리방침은 2017.5.1부터 적용됩니다.<br/>





        </div>
    </section>
</section>


<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>




<script>
    $(document).ready(() => {


        $("#registerBtn").on("click", () => {

            let isRight = true;
            let isIdChecked = $("#isIdChecked").val()
            if(isIdChecked !== "true"){
              alert("체크아이디를 눌러 아이디 유효성 검사를 진행해 주세요.")
              location.href ="<c:url value='/register/addUser'/>"
              return ;
            }

            $("#form").find("input[type=text]").each(function (index, item) {
                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                if ($(this).val().trim() == '') {
                    alert($(this).attr("data-name") + " 항목을 입력하세요.");
                    isRight = false;
                    return false;
                }

            });

            if (!isRight) {
                return;
            }


            $(this).prop("disabled", true);
            $(this).prop("disabled", false);


            let form = $("#form");
            // alert("btn clicked")
            form.attr("action", "<c:url value='/register/addUser'/>")
            form.attr("method", "post")
            form.submit();

        }); // register



        $("#chkIdBtn").on("click", function () {
            // alert("chk btn clicked")
            let form = $("#form");
            form.attr("action", "<c:url value='/register/checkID'/>")
            form.attr("method", "post");
            form.submit();
            // isIdChk = true;

        }); // id check



    });
</script>
</body>
</html>
