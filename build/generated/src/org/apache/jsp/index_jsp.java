package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("      \n");
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
 
          if(session.getAttribute("uid")!=null)
            response.sendRedirect("dashboard.jsp");
      
      out.write("\n");
      out.write("   \n");
      out.write("      \n");
      out.write("        \n");
      out.write("        <nav class=\"navbar navbar-inverse\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    \n");
      out.write("    <div class=\"collapse navbar-collapse float-right bg-darkest text-secondary\" id=\"myNavbar\">\n");
      out.write("      <ul class=\"nav navbar-nav\">\n");
      out.write("        <li><a href=\"#\">aboutUs</a></li>\n");
      out.write("        \n");
      out.write("        <li><a href=\"#\">howItWorks</a></li>\n");
      out.write("        <li><a href=\"#\">offers</a></li>\n");
      out.write("         <li><a href=\"#\">contactUs</a></li>\n");
      out.write("      </ul>\n");
      out.write("     \n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("      <div class=\"row grad text-white pad8 shadow\">\n");
      out.write("            <div class=\"col-sm-7\"><a class=\"navbar-brand text-white\" href=\"index.jsp\"><strong>letsMooove</strong></a>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"float-right col-sm-5\">\n");
      out.write("                    <form class=\"form-inline \" action=\"Login\">\n");
      out.write("                      <input\n");
      out.write("                        class=\"form-control mr-sm-2\"\n");
      out.write("                        type=\"text\"\n");
      out.write("                        name=\"mob\"\n");
      out.write("                        placeholder=\"Mobile No\"\n");
      out.write("                      />\n");
      out.write("                      <input\n");
      out.write("                        class=\"form-control mr-sm-2\"\n");
      out.write("                        type=\"text\"\n");
      out.write("                        name=\"pass\"\n");
      out.write("                        placeholder=\"password\"\n");
      out.write("                      />\n");
      out.write("                      <button class=\"btn btn1 shadow \" type=\"submit\">Sign In</button>\n");
      out.write("                    </form>\n");
      out.write("                  </div>\n");
      out.write("          </div>\n");
      out.write("      <div class=\"\"> \n");
      out.write("        <div class=\"shadow pad8 back\" >\n");
      out.write("                <form class=\"formwidth formpad \" action=\"GenerateOtp\">\n");
      out.write("                    <input\n");
      out.write("                    class=\"form-control mr-sm-2 pad8 mar8\"\n");
      out.write("                    type=\"text\"\n");
      out.write("                    name=\"name\"\n");
      out.write("                    placeholder=\"user name\" \n");
      out.write("                  />\n");
      out.write("                  <input\n");
      out.write("                    class=\"form-control mr-sm-2 pad8 mar8\"\n");
      out.write("                    type=\"text\"\n");
      out.write("                    name=\"email\"\n");
      out.write("                    placeholder=\"email\" \n");
      out.write("                  />\n");
      out.write("                  <input\n");
      out.write("                    class=\"form-control mr-sm-2 pad8 mar8\"\n");
      out.write("                    type=\"text\"\n");
      out.write("                    name=\"phone\"\n");
      out.write("                    placeholder=\"phone n.\" \n");
      out.write("                  />\n");
      out.write("                  <input\n");
      out.write("                    class=\"form-control mr-sm-2 pad8 mar8\"\n");
      out.write("                    type=\"text\"\n");
      out.write("                    name=\"pass\"\n");
      out.write("                    placeholder=\"password\" \n");
      out.write("                  />\n");
      out.write("                  <button class=\"btn btn1 shadow pad8 mar8 \" type=\"submit\">letsShare</button>\n");
      out.write("                </form>\n");
      out.write("              </div></div>\n");
      out.write("              <div style=\"padding:5px\"></div>\n");
      out.write("      \n");
      out.write("      <div class=\"\">details</div>\n");
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
