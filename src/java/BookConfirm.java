
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
import jdbc.JdbcConnection;

@WebServlet(urlPatterns = {"/BookConfirm"})
public class BookConfirm extends HttpServlet {

    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
        PrintWriter pw=response.getWriter();
        try{
        Connection con=JdbcConnection.getConnection(pw);
        String mob=(String)request.getSession().getAttribute("uid");
        String rideid=(String)request.getSession().getAttribute("rideid");
        String did="";
        String seatbooked="";
        
        PreparedStatement ps = con.prepareStatement("select * from bookingcart" + mob + " where rideid=?");
            ps.setString(1, rideid);
            
            ResultSet rs= ps.executeQuery();
        
            while(rs.next()){
                did=rs.getString("did");
                seatbooked=rs.getString("seatbooked");
            }
            
        System.out.println("before insert in ridebooked");
        PreparedStatement ps1 = con.prepareStatement("insert into ridebooked" + mob + "(rideid,did,seatbooked) values(?,?,?)");
            ps1.setString(1, rideid);
            ps1.setString(2, did);
            ps1.setString(3, seatbooked);
            //ps.setString(4,jdate);
            //ps.setString(5,jtime);
            System.out.println("before insert in  did = "+did);
            int res = ps1.executeUpdate();
            
            PreparedStatement ps2 = con.prepareStatement("insert into rideoffered" + did + " (rideid,uid,seatbooked) values(?,?,?)");
            ps2.setString(1, rideid);
            ps2.setString(2, mob);
            ps2.setString(3, seatbooked);
            //ps.setString(4,jdate);
            //ps.setString(5,jtime);
            System.out.println("before insert in delete bookingcart");
            int res1 = ps2.executeUpdate();
            
            
            String seat="";
            PreparedStatement ps5 = con.prepareStatement("select * from offeredRides where rideid=?");
                        ps5.setString(1, rideid);
                        ResultSet rs1 = ps5.executeQuery();
                        String name = "";
                        while (rs1.next()) {
                            seat = rs1.getString("seatavail");
                        }
            
            
            int seatavail=Integer.parseInt(seat)-Integer.parseInt(seatbooked);
            System.out.println("  1");
            PreparedStatement ps6 = con.prepareStatement("update OfferedRidesbasics set seatavail=? where rideid=?");
            ps6.setString(1, String.valueOf(seatavail));
            ps6.setString(2, rideid);
            
            int res6=ps6.executeUpdate();
            System.out.println("  2");
            
            PreparedStatement ps4 = con.prepareStatement("update OfferedRides set seatavail=? where rideid=?");
            ps4.setString(1, String.valueOf(seatavail));
            ps4.setString(2, rideid);
            
            int res4=ps4.executeUpdate();
            System.out.println("  3");
            response.sendRedirect("dashboard.jsp");
            
        }catch(Exception e){
            
            pw.println(e);
            
        }
    }
}
