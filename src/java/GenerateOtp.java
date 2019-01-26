
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/GenerateOtp"})
public class GenerateOtp extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
        PrintWriter out=response.getWriter();
        try{
        Random rnd=new Random();
        int otp=rnd.nextInt(9999);
        HttpSession session=request.getSession();
        session.setAttribute("name", (String)(request.getParameter("name")));
        session.setAttribute("phone", (String)(request.getParameter("phone")));
        session.setAttribute("email", (String)(request.getParameter("email")));
        session.setAttribute("pass",(String)(request.getParameter("pass")));
        session.setAttribute("otp",String.valueOf(otp));
        String mob=request.getParameter("phone");
        session.setMaxInactiveInterval(3*60);
        Mailer.send(request.getParameter("email"),"otp",String.valueOf(otp),mob);
        response.sendRedirect("otp.jsp");
        }catch(Exception e){
            out.println(e);
        }
    }
}
