<%--
  Created by IntelliJ IDEA.
  User: Laue
  Date: 07/01/2016
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

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
    if(username.equals(""))
    {
        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/error.jsp");
        rd.forward(request, response);
    }
    out.println("Welcome " + username);
%>
<p>Wait for other player and hit play.</p>
<form action="GameController" method="post">
<button name="start">Play!</button>
</form>
</body>
</html>
