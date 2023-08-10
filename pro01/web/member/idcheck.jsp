<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 검사</title>
</head>
<body>
<%
    String id = request.getParameter("id");
%>
<div class="container">
    <form name="child" action="idload.jsp" method="post" onsubmit="return invalidCheck(this)">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="12글자 이내">
        <input type="submit" value="아이디 중복 검사">
    </form>
    <script>
    function invalidCheck(f){
        var id = f.id.value;
        if(id.length>12){
            alert("아이디의 글자수는 12글자 이내입니다.");
            f.id.focus();
            return;
        }

        // 특수문자 제한
        var regex = /^[a-zA-Z0-9]*$/; // 영문 대소문자와 숫자만 허용하는 정규표현식
        if (!regex.test(id)) {
            alert("아이디는 영문 대소문자와 숫자만 사용할 수 있습니다.");
            f.id.focus();
            return false;
        }
    }
    </script>
</div>
</body>
</html>