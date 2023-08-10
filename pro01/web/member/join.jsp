<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- /web/member/login.jsp -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보수정</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../img/login.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px;}
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:50px auto; }
        .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
        border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>회원가입</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 가입</h2>
                <form name="frm1" action="joinpro.jsp" method="post" onsubmit="return inform(this)">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th>직업</th>
                            <td>
                                <input type="radio" name="job" value="1" id="stu" checked>
                                <label for="stu">학생</label><br>
                                <input type="radio" name="job" value="2" id="tea">
                                <label for="tea">선생님</label><br>
                            </td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="id" id="id" class="indata" required/>
                                <button type="button" id="ck_btn" onclick="idcheck()">아이디 중복 체크</button>
                                <input type="hidden" name="ck_item" id="ck_item" value="no">
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input type="password" name="pw" id="pw" class="indata" required>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td>
                                <input type="password" name="pw2" id="pw2" class="indata" required>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="name" id="name" class="indata" required></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="tel" name="tel" id="tel" class="indata" required></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="email" name="email" id="email" class="indata" required></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="colspan">
                                <input type="submit" value="회원 가입" class="inbtn">
                                <a href="/member/login.jsp" class="inbtn">로그인 페이지로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                function inform(frm){
                    var ck_item = frm.ck_item;
                    //var ck_item = document.getElementById("ck_item");
                    if(ck_item.value!="yes"){
                        alert("아이디 중복 검사를 진행하시기 바랍니다.");
                        frm.id.focus();
                        return false;
                    }
                    var pw = frm.pw.value;
                    var pw2 = frm.pw2.value;
                    if(pw!=pw2){
                        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                        pw.focus();
                        return false;
                    }
                }
                function idcheck(){
                    var child;
                    var id = document.getElementById("id");
                    if(id.value!="") {
                        child = window.open("idcheck.jsp?id="+id.value, "child", "width=600, height=400");
                        return false;
                    } else {
                        alert("아이디 입력란에 아이디를 입력하고, 진행하시기 바랍니다.");
                        id.focus();
                        return false;
                    }
                }
                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>