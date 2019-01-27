import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JdbcConnection;

@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        PrintWriter out=response.getWriter();
        try{
            String mob=(String)request.getParameter("mob");
            String pass=(String)request.getParameter("pass");
            JdbcConnection obj=new JdbcConnection();
            Connection con=obj.getConnection(out);
            
            PreparedStatement ps=con.prepareStatement("select * from user where mob=? and pass=?");
            ps.setString(1, mob);
            ps.setString(2, pass);
            
            ResultSet rs=ps.executeQuery(); 
            
            int i=0;
            while(rs.next()){
                i++;
            }
            System.out.println(i);
            if(i>=1){
                HttpSession session=request.getSession();
                session.setAttribute("uid",mob);
                session.setAttribute("pass",pass);
                session.setAttribute("loaded",0);
                response.sendRedirect("dashboard.jsp");
            }
            else{
                response.sendRedirect("error.html");
            }
        }catch(Exception e){
            out.println(e);
        }
    }
}
