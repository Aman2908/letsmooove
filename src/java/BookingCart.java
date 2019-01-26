
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.JdbcConnection;

@WebServlet(urlPatterns = {"/BookingCart"})
public class BookingCart extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter pw = response.getWriter();
        try {
            String mob = (String) request.getSession().getAttribute("uid");
            String did = request.getParameter("did");
            //String uid=(String)request.getSession().getAttribute("uid");
            String seatavail = request.getParameter("seatavail");
            String jdate = request.getParameter("date");
            String jtime = request.getParameter("time");
            String price = request.getParameter("price");
            String seatbooked = request.getParameter("bookedseat");
            float priceint = Float.parseFloat(price);
            System.out.println(priceint);
            float seatbookedfloat = Float.parseFloat(seatbooked);
            System.out.println(seatbookedfloat);
            String totalprice = String.valueOf((int) priceint * seatbookedfloat);
            
            String rideid = did + jdate.substring(5,7)+jdate.substring(8,10)+jtime.substring(0,2);
            request.getSession().setAttribute("rideid",rideid);
            //System.out.println("seatbooked ="+seatbooked+"  total price="+totalprice);
            //System.out.println("did="+did+"  uid="+mob+"  price="+price+" seatavail="+seatavail+"  jdate="+jdate);
            Connection con = JdbcConnection.getConnection(pw);
            PreparedStatement ps = con.prepareStatement("insert into bookingcart" + mob + "(rideid,did,seatbooked) values(?,?,?)");
            ps.setString(1, rideid);
            ps.setString(2, did);
            ps.setString(3, seatbooked);
            //ps.setString(4,jdate);
            //ps.setString(5,jtime);
            int res = ps.executeUpdate();
            
            System.out.println(rideid);
            
            
            String uid=(String)request.getSession().getAttribute("uid");
            StringBuilder outputHtml = new StringBuilder();
            outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
            outputHtml.append("<html>");
            outputHtml.append("<head>");
            outputHtml.append("<title>Merchant Check Out Page</title>");
            outputHtml.append("</head>");
            outputHtml.append("<body>");
//outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
            outputHtml.append("<form method='post' action='pgRedirect.jsp' name='f1'>");
            outputHtml.append("<table border='1'>");
            outputHtml.append("<tbody>");
            outputHtml.append("<input type='hidden' name='ORDER_ID' value='" + rideid + "'>");
            outputHtml.append("<input type='hidden' name='CUST_ID' value='" + uid + "'>");
            outputHtml.append("<input type='hidden' name='INDUSTRY_TYPE_ID' value='Retail'>");
            outputHtml.append("<input type='hidden' name='CHANNEL_ID' value='WEB'>");
            outputHtml.append("<input type='hidden' name='TXN_AMOUNT' value='" + totalprice + "'>");
            
            outputHtml.append("</tbody>");
            outputHtml.append("</table>");
            outputHtml.append("<script type='text/javascript'>");
            outputHtml.append("document.f1.submit();");
            outputHtml.append("</script>");
            outputHtml.append("</form>");
            outputHtml.append("</body>");
            outputHtml.append("</html>");

            pw.println(outputHtml);
            //RequestDispatcher rd = request.getRequestDispatcher("pgRedirect.jsp");
            //rd.include(request, response);

        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
