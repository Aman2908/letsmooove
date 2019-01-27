<%-- 
    Document   : curdate
    Created on : Jan 26, 2019, 6:14:43 PM
    Author     : vinay
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
                Date date = new Date();  
                out.println(formatter.format(date));  
          %>
    </body>
</html>
