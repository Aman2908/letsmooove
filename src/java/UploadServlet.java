import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import jdbc.JdbcConnection;
@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadServlet extends HttpServlet {
    /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "/photos";
     
    /**
     * handles file upload
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String fileName ="";
        // gets absolute path of the web application
        try{
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;
         //String savePath="C:\\Users\\vinay\\Documents\\NetBeansProjects\\letsmooove\\web\\photos";
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
         
        //for (Part part : request.getParts()) {
            Part part = request.getPart("file");
            fileName= extractFileName(part);
            // refines the fileName in case it is an absolute path
            File file = new File(fileName);
            
            part.write(savePath + File.separator + fileName);
            try {
            JdbcConnection obj=new JdbcConnection();
            Connection con=obj.getConnection(out);
         
            PreparedStatement ps1 = con.prepareStatement("select * from userphoto where mob=?");
            ps1.setString(1, (String)request.getSession().getAttribute("uid"));
            ResultSet rs=ps1.executeQuery();
            String currentfile="";
            while(rs.next()){
            currentfile=rs.getString("img");
            }
            File file1=new File(savePath+File.separator+currentfile);
            file1.delete();
            
            Thread.sleep(2000);
            
            PreparedStatement ps = con.prepareStatement("update userphoto set photo=true,img=? where mob=?");
            ps.setString(1,fileName);
            ps.setString(2,(String)request.getSession().getAttribute("uid"));
            int i=ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            
        }
        response.sendRedirect("dashboard.jsp");
        //}
        
        
        }catch(Exception e){
            out.println(fileName);
            System.out.println("inside catch out"+fileName);
        }
        //request.setAttribute("message", "Upload has been done successfully!");
        //getServletContext().getRequestDispatcher("/message.jsp").forward(
        //        request, response);
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}