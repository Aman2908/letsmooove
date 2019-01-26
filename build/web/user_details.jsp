<%@page import="jdbc.JdbcConnection"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Details</title>
        <link rel="stylesheet" type="text/css" href="css/udtl.css">
    </head>
    <body>

        <div class="centre">
            <%@ page import = "java.sql.*" %>
                    <% 
                        
                        out.println("<a href='dashboard.jsp' id='home'>HOME </a>");
                        Statement stmt;
                ResultSet rs;
                ResultSet rs1;
                String rideid = request.getParameter("rideid");
                String uid=(String)request.getSession().getAttribute("uid");
                try {
                    PrintWriter pw = response.getWriter();
                    Connection con = JdbcConnection.getConnection(pw);
                    System.out.println(uid);
                    PreparedStatement ps = con.prepareStatement("select * from rideoffered"+uid+" where rideid=?");
                    //ps.setString(1, "offeredRides");
                    ps.setString(1,rideid);
                    rs=ps.executeQuery();
                    
                    while (rs.next()) {
                        String mob = rs.getString("uid");
                        
                        PreparedStatement ps2 = con.prepareStatement("select * from userphoto where mob=?");
                ps2.setString(1, mob);
                ResultSet rs2 = ps2.executeQuery();
                boolean photo = false;
                String img = "";
                while (rs2.next()) {
                    photo = rs2.getBoolean("photo");
                    img = rs2.getString("img");
                }
                        
                        
                        PreparedStatement ps1 = con.prepareStatement("select * from user where mob=?");
                    //ps1.setString(1, "user");
                    ps1.setString(1,mob);
                    rs1=ps1.executeQuery();
                        
                    while(rs1.next()){
                        
                       %>
            
                      <img id = "dp" src="./photos/<% if (photo == true) {
                  out.print(img);
              } else {
                  out.print("usericon.png");
                       } %>" width="270px">
            
            <%
                        out.println("<table>");
                    out.println("<tr><th>Name : </th><td>"+rs1.getString("name")+"</td></tr>");

                    out.println("<tr><th>Email : </th><td>"+rs1.getString("email")+"</td></tr>");

                    //out.println("<tr><th>Email : </th><td>"+rs.getString("mob")+"</td></tr>");


                    out.println("</table></div>");

            out.println("<div class=\"full\"><a href=\"");
                                                //Add link to chat

                                                out.println("chat.jsp?hid="+mob);
                                                out.println(" \" id = \"sndmsg\" class=\"centre\">SEND A MESSAGE</a><div>");
                    }
                    }
                    con.close();
                    }

                    catch(Exception ex){
                    out.println("Some Error Occured : "+ ex);
                    }
                    %>


                </div>

                </body>
                </html>