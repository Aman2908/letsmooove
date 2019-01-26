package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.io.PrintWriter;
import jdbc.JdbcConnection;
import java.sql.Connection;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\" />\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("    <title>Page Title</title>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"main.css\" />\n");
      out.write("    <script src=\"main.js\"></script>\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Raleway\" rel=\"stylesheet\">\n");
      out.write("    <!-- Latest compiled and minified CSS -->\n");
      out.write("    <link\n");
      out.write("      rel=\"stylesheet\"\n");
      out.write("      href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\"\n");
      out.write("    />\n");
      out.write("\n");
      out.write("    <!-- jQuery library -->\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Popper JS -->\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Latest compiled JavaScript -->\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./css/index.css\" />\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("      ");
 if(session.getAttribute("uid")==null)
            response.sendRedirect("index.jsp");
      else{
          JdbcConnection obj=new JdbcConnection();
          PrintWriter pw=response.getWriter();
          Connection con=obj.getConnection(pw);
          String mob=(String)session.getAttribute("uid");
          String pass=(String)session.getAttribute("pass");
          String name="";
          String email="";
          PreparedStatement ps1=con.prepareStatement("select * from userphoto where mob=?");
          ps1.setString(1,mob);
          ResultSet rs1=ps1.executeQuery();
          boolean photo=false;
          while(rs1.next()){
              photo=rs1.getBoolean("photo");
          }
          PreparedStatement ps=con.prepareStatement("select * from user where mob=? and pass=?");
          ps.setString(1,mob);
          ps.setString(2,pass);
          ResultSet rs=ps.executeQuery();
          while(rs.next()){
              name=rs.getString("name");
              email=rs.getString("email");
          }
      
      out.write("\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("      <div class=\"row bg-darkest text-secondary\">\n");
      out.write("        <div class=\"col-sm-8\"></div>\n");
      out.write("        <div class=\"col-sm-1\">aboutUs</div>\n");
      out.write("        <div class=\"col-sm-1\">howItWorks</div>\n");
      out.write("        <div class=\"col-sm-1\">offers</div>\n");
      out.write("        <div class=\"col-sm-1\">ContactUs</div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"row grad text-white pad8 shadow\">\n");
      out.write("            <div class=\"col-sm-4\"><a class=\"navbar-brand text-white\" href=\"dashboard.jsp\"><strong>letsMooove</strong></a>\n");
      out.write("            </li></div>\n");
      out.write("            <div class=\"col-sm-2\"><a class=\"nav-link text-white\" href=\"findride.jsp\">Find Ride</a></div>\n");
      out.write("            <div class=\"col-sm-2\"><a class=\"nav-link text-white\" href=\"offerride.jsp\">Offer Ride</a></div>\n");
      out.write("            <div class=\"col-sm-1\"><a class=\"nav-link text-white\" href=\"#\">Link</a></div>\n");
      out.write("            <div class=\"col-sm-2\"><a class=\"nav-link text-white\" href=\"#\">Hello ");
 out.print(name); 
      out.write("</a></div>\n");
      out.write("            <div class=\"dropdown col-sm-1\">\n");
      out.write("                <button class=\"btn btn1 dropdown-toggle shadow\" type=\"button\" data-toggle=\"dropdown\">\n");
      out.write("                <span class=\"caret\"></span></button>\n");
      out.write("                <ul class=\"dropdown-menu pad8 mar8\">\n");
      out.write("                  <li><a href=\"#\">account</a></li>\n");
      out.write("                  <li><a href=\"#\">history</a></li>\n");
      out.write("                  <li><a href=\"#\">setting</a></li>\n");
      out.write("                  <li><a href=\"SignOut\">signout</a></li>\n");
      out.write("                </ul>\n");
      out.write("              </div>\n");
      out.write("           \n");
      out.write("            \n");
      out.write("          </div>\n");
      out.write("      <div class=\"jumbotron\">\n");
      out.write("          <div class=\"row \">\n");
      out.write("            <div class=\"col-sm-3 shadow bg-white\">\n");
      out.write("          <img class=\"pad8 mar8 img-responsive\" src=\"./photos/");
if(photo==true) out.println(mob+".jpg"); else out.println("usericon.png"); 
      out.write("\" width=\"270px\">\n");
      out.write("          <form action=\"UploadImage\" enctype=\"multipart/form-data\" method=\"post\">\n");
      out.write("              <input type=\"file\" name=\"file\" id=\"file\" />\n");
      out.write("              <input type=\"submit\" value=\"Upload\" name=\"upload\" id=\"upload\" />\n");
      out.write("          </form>>\n");
      out.write("          <ul>\n");
      out.write("              \n");
      out.write("              <li> <div class=\"pad8 mar8\">");
 out.print(name);
      out.write("</div></li>\n");
      out.write("              <li> <div class=\"pad8 mar8\">");
 out.print(mob);
      out.write("<button class=\"btn btn1 floatRight\">verified</button> </div></li>\n");
      out.write("              <li><div class=\"pad8 mar8\">");
 out.print(email);}
      out.write("<button class=\"btn btn1 floatRight\">verified</button></div></li>\n");
      out.write("              \n");
      out.write("          </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("          </div>\n");
      out.write("            <div class=\"col-sm-8 mar8 pad8 shadow \">\n");
      out.write("               \n");
      out.write("              <div>  No upcoming rides</div>\n");
      out.write("                <a class=\"whitetext\" href=\"findride.jsp\"><button class=\"btn btn1 shadow whitetext\" >Search ride</button></a>\n");
      out.write("                <a class=\"whitetext\" href=\"offerride.jsp\"><button class=\"btn btn1 shadow whitetext\" >Offer ride</button></a>\n");
      out.write("                \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("              <div style=\"padding:5px\"></div>\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("      <div class=\"bg-darkest\">....................................................</div>\n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
