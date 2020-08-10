<%--
  Created by IntelliJ IDEA.
  User: forest
  Date: 16.12.2014
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    String username="";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("Username")) {
                username=cookie.getValue();
                break;
            }
        }
    }
    out.println("Welcome " + username);
%>
</body>
</html>