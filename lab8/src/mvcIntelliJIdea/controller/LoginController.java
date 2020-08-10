package mvcIntelliJIdea.controller;

/**
 * Created by forest on 16.12.2014.
 */


import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvcIntelliJIdea.model.Authenticator;
import mvcIntelliJIdea.model.User;



public class LoginController extends HttpServlet {

    public LoginController() {
        super();
    }

    private Statement stmt;
    private static Connection con;
    public void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_forest", "root", "");
            stmt = con.createStatement();
        } catch(Exception ex) {
            System.out.println("Connection Error: "+ex.getMessage());
            ex.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RequestDispatcher rd = null;

        Authenticator authenticator = new Authenticator();
        String result = authenticator.authenticate(username, password);
        if (result.equals("success0")) {
            rd = request.getRequestDispatcher("/lobby.jsp");
            Cookie user = new Cookie("Username",username);
            user.setMaxAge(60*50);
            response.addCookie(user);

            Cookie user2 = new Cookie("Role","X");
            user2.setMaxAge(60*50);
            response.addCookie(user2);

            boolean marker = true;
            try {
                connect();
                Statement statement = con.createStatement();
                String query = "select * from player";
                ResultSet results = statement.executeQuery(query);
                while (results.next()) {
                    String state = results.getString("name");
                    if(state.equals(username))
                    {
                        marker = false;
                    }
                }
                if(marker)
                {
                    query = String.format("insert into player (name) values ('%s')",username);
                    statement.executeUpdate(query);
                }
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (result.equals("success1")) {
            rd = request.getRequestDispatcher("/lobby.jsp");
            Cookie user = new Cookie("Username",username);
            user.setMaxAge(60*50);
            response.addCookie(user);

            Cookie user2 = new Cookie("Role","0");
            user2.setMaxAge(60*50);
            response.addCookie(user2);

            boolean marker = true;
            try {
                connect();
                Statement statement = con.createStatement();
                String query = "select * from player";
                ResultSet results = statement.executeQuery(query);
                while (results.next()) {
                    String state = results.getString("name");
                    if(state.equals(username))
                    {
                        marker = false;
                    }
                }
                if(marker)
                {
                    query = String.format("insert into player (name) values ('%s')",username);
                    statement.executeUpdate(query);
                }
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (result.equals("full")) {
            rd = request.getRequestDispatcher("/full.jsp");
        }
        else {
            rd = request.getRequestDispatcher("/error.jsp");
        }
        rd.forward(request, response);
    }

}