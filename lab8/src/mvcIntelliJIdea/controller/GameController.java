package mvcIntelliJIdea.controller;

import mvcIntelliJIdea.model.Authenticator;
import mvcIntelliJIdea.model.GameState;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by Laue on 05/01/2016.
 */
public class GameController extends HttpServlet {
    GameState state;
    private Statement stmt;
    private static Connection con;

    public void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_forest", "root", "");
            stmt = con.createStatement();
        } catch (Exception ex) {
            System.out.println("Connection Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public GameController() {
        super();
        state = new GameState();
        state.reset();
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("start") != null) {
            try {
                connect();
                Statement statement = con.createStatement();
                String query2 = "SELECT * FROM player";
                ResultSet result2 = statement.executeQuery(query2);
                int c = 0;
                while (result2.next()) {
                    c++;
                }
                if (c == 2) {
                    RequestDispatcher rd = null;
                    rd = request.getRequestDispatcher("/game.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = null;
                    rd = request.getRequestDispatcher("/lobby.jsp");
                    rd.forward(request, response);
                }
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (request.getParameter("00x") != null) {
            state.load();
            state.score(0, 0, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("01x") != null) {
            state.load();
            state.score(0, 1, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("02x") != null) {
            state.load();
            state.score(0, 2, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("10x") != null) {
            state.load();
            state.score(1, 0, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("11x") != null) {
            state.load();
            state.score(1, 1, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("12x") != null) {
            state.load();
            state.score(1, 2, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("20x") != null) {
            state.load();
            state.score(2, 0, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("21x") != null) {
            state.load();
            state.score(2, 1, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("22x") != null) {
            state.load();
            state.score(2, 2, '1');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("000") != null) {
            state.load();
            state.score(0, 1, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("010") != null) {
            state.load();
            state.score(0, 1, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("020") != null) {
            state.load();
            state.score(0, 2, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("100") != null) {
            state.load();
            state.score(1, 0, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("110") != null) {
            state.load();
            state.score(1, 1, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("120") != null) {
            state.load();
            state.score(1, 2, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("200") != null) {
            state.load();
            state.score(2, 0, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("210") != null) {
            state.load();
            state.score(2, 1, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("220") != null) {
            state.load();
            state.score(2, 2, '2');
            state.save();
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else if (request.getParameter("reload") != null) {
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/game.jsp");
            rd.forward(request, response);

        }
        else {
            RequestDispatcher rd = null;
            rd = request.getRequestDispatcher("/lobby.jsp");
            rd.forward(request, response);
        }

    }
}
