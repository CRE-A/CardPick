<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>adminPage</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script
            src="https://kit.fontawesome.com/43ede2213f.js"
            crossorigin="anonymous"
    ></script>
    <style>
        a {
            text-decoration: none;
            margin : 0px 5px 0 5px;
        }
        body {
            background: #f5f3fa;
        }
        #section{
            width:900px;
            height: 600px;
            transform: translate(20%, 10%);
            background-color: white;
            padding: 20px 20px 20px 20px;
        }
        #pageBar{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            left:50%;
        }
    </style>
</head>
<body>

<section id="section">
    <button onclick="location.href='<c:url value='/'/>'">home</button>
    <button onclick="logout()">logout</button>
    <div class="main">
        <div class="content index active">
            <h1> 회원 정보 ️</h1>
            <div class="container item">
                <form id="userInfoForm"
                      action="<c:url value='/admin/search?option=${option}&keyword=${keyword}'/>">
                    <select class="user-search-option" name="option">
                        <option value="id">아이디</option>
                        <option value="name">이름</option>
                        <option value="dpt">부서</option>
                        <option value="email">이메일</option>
                        <option value="phone">전화번호</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색">
                    <button type="submit" class="searchBtn_user">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>                       <!--일반 회원 검색-->
            <c:if test="${empty userDtoList}"> <!--초기 화면 이거나 검색 결과가 없는 경우 띄우는 창-->
                <div class="msg__wrap">
                    <i class="fa-solid fa-circle-info"></i>
                    <h3>검색 결과가 없습니다.</h3>
                </div>
            </c:if>
            <div class="container item" id="container item">
                <div class="userList">
                    <c:if test="${not empty userDtoList}">
                        <table>
                            <thead>
                            <tr>
                                <th class="title">아이디</th>
                                <th>이름</th>
                                <th>부서</th>
                                <th>이메일</th>
                                <th>전화번호</th>
                                <th>가입일</th>
                                <th>계정만료일</th>
                                <th></th>
                                <th>계정상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="userDtoList" items="${userDtoList}">
                                <form action="<c:url value='/admin/accountManagement'/>" method="post"
                                      id="adminForm">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <tr>
                                        <td class="id"><input type="hidden" name="id"
                                                              value="${userDtoList.id}">${userDtoList.id}</td>
                                        <td class="name"><input type="hidden" name="name"
                                                                value="${userDtoList.name}">${userDtoList.name}</td>
                                        <td class="dpt"><input type="hidden" name="dpt"
                                                               value="${userDtoList.dpt}">${userDtoList.dpt}</td>
                                        <td class="email"><input type="hidden" name="email"
                                                                 value="${userDtoList.email}">${userDtoList.email}</td>
                                        <td class="phone"><input type="hidden" name="phone"
                                                                 value="${userDtoList.phone}">${userDtoList.phone}</td>
                                        <td class="regdate">
                                            <input type="date" name="regdate"readonly
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userDtoList.regdate}"/>">
                                        </td>
                                        <td class="expirationDate">
                                            <input type="date" name="expirationDate" max="2040-12-31" min="2023-09-01"
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userDtoList.expirationDate}"/>">
                                        </td>
                                        <td>
                                            <input class="userBtn" type="submit" value="저장">
                                        </td>
                                        <td class="userState">
                                            <c:if test="${userDtoList.enabled ==  1}"><span style="color: green">활성</span></c:if>
                                            <c:if test="${userDtoList.enabled ==  0}"><span style="color: orangered">정지</span></c:if>
                                            <c:if test="${userDtoList.enabled == -1}"><span style="color: blue">승인대기</span></c:if>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                </div>
            </div>                       <!--회원 검색 리스트-->
        </div>      <!--일반회원-->
    </div>

    <div id="pageBar">
        <c:if test="${ph.showPrev}">
            <a href="<c:url value="/admin/search${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a href="<c:url value='/admin/search${ph.sc.getQueryString(i)}'/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
            <a href="<c:url value="/admin/search${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
        </c:if>
    </div>
</section>


<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>


<script>
    function logout() {
        let f = document.createElement('form');
        f.setAttribute('method', 'post');
        f.setAttribute('action', '<c:url value='/login/logout?${_csrf.parameterName}=${_csrf.token}'/>');
        document.body.appendChild(f);
        f.submit();
    }
</script>


</body>
</html>
