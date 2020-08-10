<%@ page import="mvcIntelliJIdea.model.GameState" %><%--
  Created by IntelliJ IDEA.
  User: Laue
  Date: 05/01/2016
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="style.css" type="text/css" media="all"/>
    <title>X-0</title>
</head>
<body>
<%
    String username="";
    String role="";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("Username")) {
                username=cookie.getValue();
            }
            if (cookie.getName().equals("Role")) {
                role=cookie.getValue();
            }
        }
    }
    if(username.equals(""))
    {
        RequestDispatcher rd = null;
        rd = request.getRequestDispatcher("/error.jsp");
        rd.forward(request, response);
    }
    GameState s = new GameState();
    String state = s.getState();
    int turn = s.getTurn();

    System.out.println(turn);

    out.println("<form action='GameController' method='post'>\n");
    out.println("<button name='reload'>Reload</button>");
    out.println("</form>\n");
    if(role.equals("X")) {
        out.println("Welcome " + username);
        out.println("<form action='GameController' method='post'>\n");

        out.println("<table>\n");
        out.println("    <tr class='row'>\n");
        if(state.charAt(0) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='00x'>X</button></td>\n");
        else if(state.charAt(0) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(0) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(0) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(1) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='01x'>X</button></td>\n");
        else if(state.charAt(1) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(1) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(1) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(2) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='02x'>X</button></td>\n");
        else if(state.charAt(2) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(2) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(2) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");
        out.println("    </tr>\n");
        out.println("    <tr class='row'>\n");

        if(state.charAt(3) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='10x'>X</button></td>\n");
        else if(state.charAt(3) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(3) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(3) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(4) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='11x'>X</button></td>\n");
        else if(state.charAt(4) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(4) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(4) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(5) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='12x'>X</button></td>\n");
        else if(state.charAt(5) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(5) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(5) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        out.println("    </tr>\n");
        out.println("    <tr class='row'>\n");
        if(state.charAt(6) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='20x'>X</button></td>\n");
        else if(state.charAt(6) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(6) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(6) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(7) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='21x'>X</button></td>\n");
        else if(state.charAt(7) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(7) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(7) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(8) == '3' && turn % 2 == 0)
            out.println("        <td class='line'><button name='22x'>X</button></td>\n");
        else if(state.charAt(8) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(8) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(8) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");
        out.println("    </tr>\n");
        out.println("</table>\n");
        out.println("    </form>");
    }
    if(role.equals("0")) {
        out.println("Welcome " + username);
        out.println("<form action='GameController' method='post'>\n");
        out.println("<table>\n");
        out.println("    <tr class='row'>\n");
        if(state.charAt(0) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='000'>0</button></td>\n");
        else if(state.charAt(0) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(0) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(0) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(1) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='010'>0</button></td>\n");
        else if(state.charAt(1) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(1) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(1) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(2) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='020'>0</button></td>\n");
        else if(state.charAt(2) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(2) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(2) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");
        out.println("    </tr>\n");
        out.println("    <tr class='row'>\n");

        if(state.charAt(3) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='100'>0</button></td>\n");
        else if(state.charAt(3) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(3) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(3) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(4) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='110'>0</button></td>\n");
        else if(state.charAt(4) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(4) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(4) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(5) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='120'>0</button></td>\n");
        else if(state.charAt(5) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(5) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(5) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        out.println("    </tr>\n");
        out.println("    <tr class='row'>\n");
        if(state.charAt(6) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='200'>0</button></td>\n");
        else if(state.charAt(6) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(6) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(6) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(7) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='210'>0</button></td>\n");
        else if(state.charAt(7) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(7) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(7) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");

        if(state.charAt(8) == '3' && turn % 2 == 1)
            out.println("        <td class='line'><button name='220'>0</button></td>\n");
        else if(state.charAt(8) == '3')
            out.println("        <td class='line'>?</td>\n");
        else if(state.charAt(8) == '1')
            out.println("        <td bgcolor='#FF0000' class='line'>X</td>\n");
        else if(state.charAt(8) == '2')
            out.println("        <td bgcolor='#00FF00' class='line'>0</td>\n");
        out.println("    </tr>\n");
        out.println("</table>\n");
        out.println("    </form>");
    }
%>
</body>
</html>
