
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JdbcConnection;

@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String otp = (String) request.getParameter("otp");
            String otpSession = (String) request.getSession().getAttribute("otp");
            if (otp.equals(otpSession)) {
                JdbcConnection obj = new JdbcConnection();
                Connection con = obj.getConnection(out);
                String mob = (String) request.getSession().getAttribute("phone");
                PreparedStatement ps = con.prepareStatement("select * from user where mob=?");
                ps.setString(1, mob);
                ResultSet rs = ps.executeQuery();
                int i = 0;
                while (rs.next()) {
                    i++;
                }
                if (i >= 1) {

                    response.sendRedirect("error.html");
                } else {
                    HttpSession session = request.getSession();
                    String name = (String) session.getAttribute("name");
                    String pass = (String) session.getAttribute("pass");
                    String email = (String) session.getAttribute("email");

                    PreparedStatement ps1 = con.prepareStatement("insert into user(mob,name,email,pass) values(?,?,?,?)");
                    ps1.setString(1, mob);
                    ps1.setString(2, name);
                    ps1.setString(3, email);
                    ps1.setString(4, pass);

                    String stmt1="CREATE TABLE IF NOT EXISTS RideOffered"+mob+" (rideid varchar(16),uid varchar(12),seatbooked varchar(2))";
                    //did varchar(12),uid varchar(12) default '0',offerdate varchar(11),journeydate varchar(11),journeytime varchar(11),seatoffered varchar(2),seatbooked varchar(2),booki
                    PreparedStatement ps3 = con.prepareStatement(stmt1);
                    
                    System.out.println(mob);
                    int rs3=ps3.executeUpdate();
                    
                    String stmt2="CREATE TABLE IF NOT EXISTS RideBooked"+mob+" (rideid varchar(16),did varchar(12),seatbooked varchar(2))";
                    //id int(11) NOT NULL auto_increment,offerdate varchar(11),journeydate varchar(11),journeytime varchar(11),seatoffered varchar(2),PRIMARY KEY  (id)
                    PreparedStatement ps4 = con.prepareStatement(stmt2);
                            
                    
                    System.out.println(mob);
                    int rs4=ps4.executeUpdate();
                    
                    String stmt5="CREATE TABLE IF NOT EXISTS bookingcart"+mob+" (rideid varchar(16),did varchar(12),seatbooked varchar(2))";
                    //id int(11) NOT NULL auto_increment,offerdate varchar(11),journeydate varchar(11),journeytime varchar(11),seatoffered varchar(2),PRIMARY KEY  (id)
                    PreparedStatement ps5 = con.prepareStatement(stmt5);
                    int rs5=ps5.executeUpdate();

                    PreparedStatement ps2 = con.prepareStatement("insert into userphoto(mob,photo,img) values(?,?,?)");
                    ps2.setString(1, mob);
                    ps2.setString(2, String.valueOf(0));
                    ps2.setString(3, "");

                    int result1 = ps2.executeUpdate();
                    int result = ps1.executeUpdate();
                    if (result == 1) {
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        response.sendRedirect("error.html");
                    }
                }
            } else {
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("error.html");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
