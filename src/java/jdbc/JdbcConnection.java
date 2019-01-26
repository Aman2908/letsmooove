
package jdbc;
import java.io.PrintWriter;
import java.sql.*;

public class JdbcConnection {

    static final String db_driver = "com.mysql.jdbc.Driver";
    static final String db_url = "jdbc:mysql://localhost/letsmooove";
    
    static final String username = "root";
    static final String password = "vinay";
    
    public static Connection getConnection(PrintWriter pw){
    Connection conn = null;
    
    try{
    
   
    Class.forName("com.mysql.jdbc.Driver");
    
    
    conn= DriverManager.getConnection(db_url,username,password);
    
   
    }catch(Exception e){
    pw.println(e);
    }
    return conn;
    }
}
