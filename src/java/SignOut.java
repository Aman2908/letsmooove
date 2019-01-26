import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/SignOut"})
public class SignOut extends HttpServlet {

    public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        PrintWriter out=response.getWriter();
        try{
            HttpSession session=request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }catch(Exception e){
            out.println(e);
        }
    }
}
