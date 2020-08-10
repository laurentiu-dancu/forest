package mvcIntelliJIdea.model;

import java.sql.*;

/**
 * Created by Laue on 05/01/2016.
 */
public class GameState {
    private String state;
    private int turn;

    private Statement stmt;
    private static Connection con;
    private void connectDb() {
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

    public GameState() {
    }

    public String getState() {
        load();
        return state;
    }

    public int getTurn(){
        load();
        return turn;
    }
    public void score(int column, int row, char player) {
        char[] stateChar = state.toCharArray();
        stateChar[3*column + row] = player;
        state = String.valueOf(stateChar);
        turn++;
    }

    public void load() {
        try {
            connectDb();
            Statement statement = con.createStatement();
            String query = "select * from state";
            ResultSet result = statement.executeQuery(query);
            if (result.next()) {
                state = result.getString("state");
                turn = result.getInt("turn");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void reset() {
        try {
            connectDb();
            Statement statement = con.createStatement();
            String query = "delete from state";
            statement.executeUpdate(query);
            query = "insert into state (state, turn) values ('333333333', 0)";
            statement.executeUpdate(query);
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void save() {
        try {
            connectDb();
            Statement statement = con.createStatement();
            String query = "delete from state";
            statement.executeUpdate(query);
            System.out.println("waaaaaaaa save turn: " + turn);
            String turn2 = Integer.toString(turn);
            query = String.format("INSERT INTO state(state, turn) VALUES (%s,%s)",state, turn2);
            statement.executeUpdate(query);
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
