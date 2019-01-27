<%-- 
    Document   : crdecider
    Created on : Jan 26, 2019, 3:10:59 PM
    Author     : vinay
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.JdbcConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <% 
                boolean valid = false;
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
                Date date = new Date();  
                String curdate = formatter.format(date);
                String uid=(String)session.getAttribute("uid");
                PrintWriter pw=response.getWriter();
                Connection con = JdbcConnection.getConnection(pw);
                    System.out.println(uid);
                    PreparedStatement ps = con.prepareStatement("select * from ridebooked"+uid+"");
                    //ps.setString(1, "offeredRides");
                    //ps.setString(1,rideid);
                    ResultSet rs=ps.executeQuery();
                    ResultSet rs1;
                    Statement stmt = con.createStatement();
                    String rideid="";
                    while (rs.next()) {
                        rideid = rs.getString("rideid");
                        rs1 = stmt.executeQuery("select * from offeredrides where rideid = '"+rideid+"' and date1 = '"+curdate+"'");
                        if(rs1.next())valid = true;
                    }
                    
                    rs = stmt.executeQuery("select * from rideoffered"+uid);
                    Statement stmt2 = con.createStatement();
                    while(rs.next()){
                        rideid = rs.getString("rideid");
                        rs1 = stmt2.executeQuery("select * from offeredrides where rideid = '"+rideid+"' and date1 = '"+curdate+"'");
                        if(rs1.next())valid = true;
                    }
                    
                    if(valid){response.sendRedirect("map.jsp");
                    }
                    
                    else{
                        out.println("No rides at the moment!!");
                    }
                    
                    
            %>
        </h1>
    </body>
</html>
