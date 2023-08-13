<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path2 = request.getContextPath();
%>
<div class="hd_wrap">
    <nav class="tnb"> <!-- .hd_wrap:first-child  -->
        <ul class="menu">
            <% if(sid!=null) { %>
            <li><a href=<%=path2%>"/member/mypage.jsp">마이페이지</a></li>
            <li><a href=<%=path2%>"/member/logout.jsp">로그아웃</a></li>
            <li><a href=<%=path2%>"/member/map.jsp">오시는길</a></li>
                <% if(sid.equals("admin")) {%>
                <li><a href=<%=path2%>"/member/index.jsp">관리자페이지</a></li>
                <% } %>
            <li><%=sname%></li> <!-- 로그인 한 회원의 이름 -->
            <% } else {%>
            <li><a href=<%=path2%>"/member/login.jsp">로그인</a></li>
            <li><a href=<%=path2%>"/member/term.jsp">회원가입</a></li>
            <li><a href=<%=path2%>"/member/map.jsp">오시는길</a></li>
            <% } %>
        </ul>
    </nav>
</div>

<div class="hd_wrap"> <!-- .hd_wrap:first-child  -->
    <a href=<%=path2%>"/index.jsp" class="logo">
        <img src=<%=path2%>"/img/chunjae.png" alt="">
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href=<%=path2%>"/menu/company.jsp" class="dp1">회사소개</a>
                <ul class="sub">
                    <li><a class="move" href="/menu/company.jsp#com">회사개요</a></li>
                    <li><a class="move" href="/menu/company.jsp#greet">인사말</a></li>
                    <li><a class="move" href="/menu/company.jsp#history">연혁</a></li>
                    <li><a class="move" href="/menu/company.jsp#map1">경영이념</a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="" class="dp1">게시판</a>
                <ul class="sub">
                    <li><a class="move" href="/board/boardList.jsp">자유 게시판</a></li>
                    <li><a class="move" href="/board_stu/boardStuList.jsp">학생 게시판</a></li>
                    <li><a class="move" href="/board_tea/boardTeaList.jsp">선생님 게시판</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="" class="dp1">QnA</a>
                <ul class="sub">
                    <li><a class="move" href="/qna_problem/qnaList.jsp">문제 QnA</a></li>
                    <li><a class="move" href="/qna_career/qnaList.jsp">진로 상담</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <script src="/js/load.js"></script>
</div>