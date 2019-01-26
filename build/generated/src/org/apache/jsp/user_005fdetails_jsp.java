package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class user_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("\t<title>User Details</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"includes/udtl.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<img src = \"mypic.jpg\" alt = \"NO PROFILE PICTURE\" id = \"dp\" />\n");
      out.write("\t<div class=\"centre\">\n");
      out.write("\t\t\n");
      out.write("\t\t");
 session.setAttribute("uname" , "ambesh");
			Connection con;
			Statement stmt;
			ResultSet rs;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/letsmooove","root"
				,"vinay");
				stmt = con.createStatement();
				String table = "user";
				rs = stmt.executeQuery("select * from "+table);
				while(rs.next()){
				out.println("<div class = \"full\"><table>");
				out.println("<tr><th>Name : </th><td>"+rs.getString(3)+"</td></tr>");

				out.println("<tr><th>Mobile : </th><td>"+rs.getString(2)+"</td></tr>");

				out.println("<tr><th>Email : </th><td>"+rs.getString(4)+"</td></tr>");

				out.println("</table></div>");

				out.println("<div class=\"full\"><a href=\"");
					//Add link to chat
					out.println("chat.jsp?hid="+rs.getString(1));
				out.println(" \" id = \"sndmsg\" class=\"centre\">SEND A MESSAGE</a><div>");
				}
				con.close();
			}
			
			catch(Exception ex){
				out.println("Some Error Occured : "+ ex);
			}
		
      out.write("\n");
      out.write("  \n");
      out.write("\t\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("</body>\n");
      out.write("</html>");
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
