<%@ page import="mvcIntelliJIdea.model.GameState" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form action="LoginController" method="post">
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
        if(!username.equals(""))
        {
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/lobby.jsp");
            rd.forward(request, response);
        }
    %>
    Enter username : <input type="text" name="username"> <BR>
    Enter password : <input type="password" name="password"> <BR>
    <input type="submit" value="Login"/>
</form>
</body></html>