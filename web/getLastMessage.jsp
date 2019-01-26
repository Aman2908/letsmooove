<%@page import = "java.sql.*"%>
<%
	try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mdb","root"
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
				Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mdb","root"
					,"vinay");
					Statement stmt = con.createStatement();

					String tname = session.getAttribute("table") + "" , rec = "" , user = ""+session.getAttribute("uid");
					if(tname.substring(5,user.length()).equals(user))rec = tname.substring(5+user.length());
					else rec = tname.substring(tname.length() - user.length()-5);

					stmt.execute("create table "+tname+" ( sender varchar(20) , msg varchar(200) );");
					stmt.execute("insert into m"+rec+" values ('"+user+"');");
					stmt.execute("insert into m"+user+" values ('"+rec+"');");
					con.close();
			}
			catch(Exception e){
				System.out.println("Some error Occured " + ex + e);
			}
		}
%>