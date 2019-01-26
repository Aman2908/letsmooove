<%@page import="jdbc.JdbcConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import = "java.sql.*"%>
<%
	try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mdb","root"
			,"vinay");
			Statement stmt = con.createStatement();
			String sender = "" + session.getAttribute("uid");
                        
                        PrintWriter pw = response.getWriter();
                        
                    Connection con1= JdbcConnection.getConnection(pw);;
                    PreparedStatement ps = con1.prepareStatement("select * from user where mob=?");
                    //ps.setString(1, "offeredRides");
                    
                    ps.setString(1,sender);
                    ResultSet rs=ps.executeQuery();
                    while (rs.next()) {
                       sender = rs.getString("name");
                    }
                        System.out.println(sender);
			String msg = request.getParameter("msg");
			stmt.executeUpdate("insert into "+session.getAttribute("table")+" values ('"+sender+"' , '"+msg+"');");
			con.close();
			out.println(sender+" : "+msg);
		}
		catch(Exception ex){
			out.println(" Some Error Occured : "+ ex);
		}
%>