package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class getLastMessage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');

	try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root"
			,"vinay");
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from "+session.getAttribute("table")+" ;");
			rs.last();
			String sender = rs.getString(1) , msg = rs.getString(2);
			con.close();
			out.println("<tr><th>"+sender+"</th><td> : "+msg + "</td></tr>");
		}
		catch(Exception ex){
			out.println("There are no messages yet<br> try sending some message... <br>");
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mdb","root"
					,"vinay");
					Statement stmt = con.createStatement();

					String tname = session.getAttribute("table") + "" , rec = "" , user = ""+session.getAttribute("uname");
					if(tname.substring(0,user.length()).equals(user))rec = tname.substring(user.length());
					else rec = tname.substring(tname.length() - user.length());

					stmt.execute("create table "+tname+" ( sender varchar(20) , msg varchar(200) );");
					stmt.execute("insert into m"+rec+" values ('"+user+"');");
					stmt.execute("insert into m"+user+" values ('"+rec+"');");
					con.close();
			}
			catch(Exception e){
				//out.println("Some error Occured " + ex + e);
			}
		}

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
