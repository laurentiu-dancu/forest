package mvcIntelliJIdea.model;

import java.sql.*;

/**
 * Created by forest on 16.12.2014.
 */
public class Authenticator {
    private Statement stmt;

    public Authenticator() {
        connect();
    }

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

    public String authenticate(String username, String password) {
        System.out.println(username+" "+password);
        try {
            Statement statement = con.createStatement();
            String query = String.format(
                    "SELECT * FROM user WHERE username='%s' AND password='%s'",
                    username,
                    password
            );
            ResultSet result = statement.executeQuery(query);
            if (result.next()) {
                String query2 = "SELECT * FROM player";
                ResultSet result2 = statement.executeQuery(query2);
                int c = 0;
                while (result2.next()) {
                    String state = result2.getString("name");
                    if(state.equals(username))
                        return "success" + c;
                    c++;
                }
                if(c < 2)
                    return "success" + c;
                else
                    return "full";
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "fail";
    }
}