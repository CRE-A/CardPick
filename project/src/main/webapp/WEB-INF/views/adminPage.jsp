<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
</head>
<body>

<%--<section id="nav">--%>
<%--    <div class="return">--%>
<%--        <img src="<c:url value='/iconImg/goback.png'/>" onclick="location.href='<c:url value='/'/>'" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/white.png'/>" alt=""/>--%>
<%--        <img src="<c:url value='/iconImg/logout4.png'/>" onclick="location.href='<c:url value='/login/logout'/>'"--%>
<%--             alt=""/>--%>
<%--    </div>--%>
<%--</section>--%>
<section>
    <div class="main">

        <div class="content index active">
            <h1> 회원 정보 ️</h1>
            <div class="container item">
                <form id="userInfoForm"
                      action="<c:url value='/admin/search?option=${option}&keyword=${keyword}'/>">
                    <select class="user-search-option" name="option">
<%--                        <option value="all">전체</option>--%>
                        <option value="id">아이디</option>
                        <option value="name">이름</option>
                        <option value="dpt">부서</option>
                        <option value="email">이메일</option>
                        <option value="phone">전화번호</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색">
                    <button type="button" class="searchBtn_user">
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
            <div class="container item">
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
                                <th>계정상태</th>
                                <th>계정관리</th>
                                <th>회원등급변경</th>
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
                                        <td class="userState"><input type="hidden" name="userState">
                                                <%--                                                                   value="${userDtoList.enabled}">--%>
                                            <c:if test="${userDtoList.enabled ==  1}">활성</c:if>
                                            <c:if test="${userDtoList.enabled ==  0}">정지</c:if>
                                        </td>
                                        <td>
                                            <select name="enabled">
                                                <option value="1">일반회원</option>
                                                <option value="0">계정정지</option>
                                                <option value="1">계정재활성</option>
                                                <option value="-1">계정삭제</option>
                                                    <%--                                                <option value="-3">계정정지</option>--%>
                                            </select>
                                        </td>
                                        <td>
                                            <input class="userBtn" type="submit" value="저장">
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
</section>


<c:if test="${msg!=null}">
    <script type="text/javascript">
        alert('<c:out value="${msg}"/>');
    </script>
</c:if>


</body>
</html>
