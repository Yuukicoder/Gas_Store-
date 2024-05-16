package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcontext {

    public Connection connection;

    public DBcontext() {
        try {
            String username = "sa";
            String password = "12345";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Gas_Group6";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Database connection successful!");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Database connection failed: " + ex);
        }
    }

    public static void main(String[] args) {
        new DBcontext(); // Create an instance of DBcontext to test the database connection.
    }
}
