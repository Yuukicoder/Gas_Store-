
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBContext {
    public Connection connection;
    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=  Gas_Group6";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("connected");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
      public ResultSet getData(String sql){
        ResultSet rs=null;
         Statement state;
        try {
            state = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
             rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rs;
    }
     public static void main(String[] args) {
        new DBContext();
    }
}
