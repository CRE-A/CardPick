<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib
        prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page
        session="false" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Registration</title>
    <!-- CSS -->
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
                    <input required placeholder="아이디" type="text" name="id" data-name="아이디" value="${userDto.id}"/>
                </div>
                <button
                        class="checkBtn"
                        id="chkIdBtn"
                        type="button"
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
                    <input
                            id="password"
                            required
                            placeholder="패스워드"
                            type="password"
                            name="pwd"
                    />
                    <span class="sub">패스워드를 다섯글자 이상 입력하세요</span>
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
                    <input required placeholder="이메일" type="text" name="email" data-name="이메일"
                           value="${userDto.email}"/>
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
                    <input required placeholder="전화번호" type="text" name="phone" data-name="전화번호"
                           value="${userDto.phone}"/>
                </div>
                <button class="none"></button>
            </li>
        </ul>
        <div class="infoBox">
            <div class="agreement">
                <input required type="checkbox" data-name="정보동의"/>
                <label for="">정보 동의</label>
            </div>
            <button class="registerBtn" type="button" id="registerBtn">
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
            3.정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제 3자의 급박한 생명, 신체, 재산의 이익을 위햐여
            필요하다고 인정되는 경우<br/>
            4.통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정한 개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우<br/>
            5.개인정보를 목적 외의 용도로 이용하거나 이를 제 3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우<br/>
            6.조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우<br/>
            7.범죄의 수사와 공소의 제기 및 유치를 위하여 필요한 경우<br/>
            8.법원의 재판업무 수행을 위하여 필요한 경우<br/>
            9.형 및 감호, 보호처분의 집행을 위하여 필요한 경우<br/>
            <br/>
            제 3조 (개인정보처리 위탁)<br/>
            PIB는 위탁계약 시 개인정보 관련 법규를 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 보관하고 있습니다. 또한 업체 변경 시는 개인정보
            처리방침을 통해 고지하고 있습니다.<br/>
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
            개인정보 파기의 절차 및 방법은 다음과 같습니다.<br/>
            1.파기절차:파기 사유가 발생한 개인정보를 선정한 후, PIB의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br/>
            2.파기방법:PIB는 전자적 파일형태로 기록,저장된 개인정보를 재생할 수 없도록 파기합니다.<br/>
            <br/>
            제 7조(개인정보의 안전성 확보조치)<br/>
            개인정보보호법 제29조에 따라 다음과 같이 안정성 확보에 필요한 기술적 관리적 및 물리적 조취를 하고 있습니다.<br/>
            1.내부관리계획의 수립 및 시행<br/>
            PIB는 [서울혁신파크 개인정보 보호지침] 을 수립하여 시행하고 있습니다.<br/>
            2.개인정보의 암호화<br/>
            이용자의 개인정보 중 고유식별번호, 비밀번호는 암호화된 상태로 저장 및 관리되고 있습니다.<br/>
            3.해킹 등에 대비한 기술적 대책<br/>
            해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 추가적인 갱신 점검을 하여, 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적 물리적으로
            감시 및 차단하고 있습니다.<br/>
            4.개인정보처리시스템 접근제한<br/>
            개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단접근을 통제하고
            있습니다.<br/>
            5.접속기록의 보관 및 위변조 방지<br/>
            개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관,관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 관리하고 있습니다.<br/>
            6.비인가자에 대한 출입 통제<br/>
            개인정보를 보관하고 있는 개인정보처리시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.<br/>
            7.개인정보 취급 직원의 최소화 및 교육<br/>
            개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하고 있으며, 관련규정 및 법규 등을 준수하도록 주기적인 교육을 실시하고 있습니다.<br/>
            <br/>
            제 8조(권익침해 구제방법)<br/>
            1)정보주체는 개인정보침해로 인한 피해를 구제 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다.<br/>
            이 밖에 기타 개인정보침해의 신고 및 상담에 대하여는 아래기관에 문의하시기 바랍니다.<br/>
            가. 개인정보 분쟁조정위원회 : 02-2100-2499<br/>
            ([http://www.kopico.or.kr%29]/www.kopico.or.kr)<br/>
            나. 개인정보 침해신고센터 : 국번없이 118번 (privacy.kisa.or.kr)<br/>
            다. 대검찰청 사이버범죄수사단 : 02-3480-3571(cybercid@spo.go.kr)<br/>
            라. 경찰청 사이버테러대응센터 : 1566-0112<br/>
            ([http://www.netan.go.kr%29]www.netan.go.kr)<br/>
            2)개인정보의 열람,정정,삭제,처리정지 등에 대한 정보주체의 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익을 침해 받은 자는 행정심판법이 정하는 바에 따라
            행정심판틀 청구할 수 있습니다.<br/>
            #행정심판에 대한 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr)의 홈페이지를 참조하시기 바랍니다.<br/>
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
            <br/>
            <br/>
            <br/>


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

            // IDCheck 검사
            let isRight = true;
            let isIdChecked = $("#isIdChecked").val()
            if (isIdChecked !== "true") {
                alert("체크아이디를 눌러 아이디 유효성 검사를 진행해 주세요.")
                <%--location.href ="<c:url value='/register/addUser'/>"--%>
                return;
            }


            // 각 항목 별 유효성 검사
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



            //password 유효성 검사
            const password = document.querySelector("#password").value;
            if (password.length < 5) {
                // 비밀번호 길이가 5 미만이면 제출을 중단하고 에러 메시지를 표시
                document.querySelector(".sub").classList.add("error");
                alert("패스워드를 5자 이상 입력하세요");
                return;
            } else {
                // 비밀번호가 유효하면 에러 메시지를 지우고 제출을 허용
                document.querySelector(".sub").classList.remove("error");
            }
            // // alert("1");


            //회원가입 post 요청
            let form = $("#form");
            form.attr("action", "<c:url value='/register/addUser'/>")
            form.attr("method", "post")
            form.submit();

        }); // register


        $("#chkIdBtn").on("click", function () {

            if ($("#form").find("input[data-name=아이디]").val().trim() == '') {
                alert("사용하실 아이디를 입력해 주세요");
                return;
            }else if($("#form").find("input[data-name=아이디]").val().length <6){
                alert("아이디를 6자 이상 입력하세요");
                return;
            }

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
