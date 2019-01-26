<%@ page import = "java.sql.*" %>
	<%
	String table = "" + session.getAttribute("table");
	

	Connection con;
	Statement stmt;
	ResultSet rs;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/mdb","root"
		,"vinay");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select count(*) from "+table);
		rs.next();
		out.println(rs.getString(1));
		con.close();
	}
	
	catch(Exception ex){
		out.println("Some Error Occured : "+ ex);
	}
	
	%>