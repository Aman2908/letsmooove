<%@page import="jdbc.JdbcConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <!-- Latest compiled and minified CSS -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            />

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./css/index.css" />
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFcZ9M-6LkLvY1I3H_DjvJ0SGSz0clbL0&libraries=places"></script>

    </head>

    <body>

        <% if (session.getAttribute("uid") == null) {
                response.sendRedirect("index.jsp");
            } else {
                String fromLat = request.getParameter("fromLat");
                String fromLong = request.getParameter("fromLong");
                String toLat = request.getParameter("toLat");
                String toLong = request.getParameter("toLong");
                String date = request.getParameter("date");

                String res = "";
                System.out.println(fromLat + "  " + fromLong + "  " + toLat + "   " + toLong);
                try {
                    PrintWriter pw = response.getWriter();
                    Connection con = JdbcConnection.getConnection(pw);
                    PreparedStatement ps = con.prepareStatement("select * from offeredrides where fromLat >= ? and fromLat <= ? and fromLong >= ? and fromLong <= ? and toLat >= ? and toLat <= ?  and toLong >= ? and toLong <= ? and date1=?");
                    ps.setString(1, String.valueOf(Float.valueOf(fromLat) - .1));
                    ps.setString(2, String.valueOf(Float.valueOf(fromLat) + .1));
                    ps.setString(3, String.valueOf(Float.valueOf(fromLong) - .1));
                    ps.setString(4, String.valueOf(Float.valueOf(fromLong) + .1));

                    ps.setString(5, String.valueOf(Float.valueOf(toLat) - .1));
                    ps.setString(6, String.valueOf(Float.valueOf(toLat) + .1));
                    ps.setString(7, String.valueOf(Float.valueOf(toLong) - .1));
                    ps.setString(8, String.valueOf(Float.valueOf(toLong) + .1));

                    ps.setString(9, date);
                    System.out.println(date);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        String mob = rs.getString("mob");
                        String date1 = rs.getString("date1");
                        String sourcelat = rs.getString("fromLat");
                        String destlat = rs.getString("toLat");
                        String price = rs.getString("price");
                        String time1 = rs.getString("time1");
                        String seatavail = rs.getString("seatavail");
                        String source = "";
                        String destination = "";
                        PreparedStatement ps2 = con.prepareStatement("select * from offeredRidesBasics where mob=? and date1=?");
                        ps2.setString(1, mob);
                        ps2.setString(2, date1);
                        ResultSet rs1 = ps2.executeQuery();
                        String name = "";
                        while (rs1.next()) {
                            name = rs1.getString("name");
                            source = rs1.getString("src");
                            destination = rs1.getString("dest");
                        }

                        System.out.println("mob = " + name);
                        if(Integer.parseInt(seatavail)>0){
                        res += "<div class=\"col-sm-8\"><b>" + name + "</b><br>\n"
                                + "                                source: " + source + "<br>\n"
                                + "                                destination: " + destination + "<br>\n"
                                + "                                seat available: " + seatavail + "<br>\n"
                                + "                                date of departure: " + date1 + "<br>\n"
                                + "                                time: " + time1 + "\n"
                                + "                            </div>\n"
                                + "                            <div class=\"col-sm-4 \"><br>"
                                + "                              <button class=\"btn bg-darkest whitetext pad8 mar8 shadow\">Price : Rs. " + price + "</button>"
                                
                                +"<form method='post' action='bookcart.jsp' name='f1'>"
                                + "<input type=\"hidden\" name=\"did\" value="+mob+">"
                                + "<input type=\"hidden\" name=\"name\" value="+name+">"
                                + "<input type='hidden' name='source' value="+source+">"
                                + "<input type='hidden' name='destination' value="+destination+">"
                                + "<input type='hidden' name='seatavail' value="+seatavail+">"
                                
                               // + "<input type='hidden' name='EMAIL' value='username@emailprovider.com'>"
                                + "<input type='hidden' name='price' value="+price+">"
                                + "<input type='hidden' name='date' value="+date1+">"
                                + "<input type='hidden' name='time' value="+time1+">"
                                //+ "<input type='hidden' name='CALLBACK_URL' value='https://Merchant_Response_URL>'>"
                                +"<a href='bookride.jsp'><button class=\"btn bg-darkest whitetext pad8 mar8 shadow\" >Book now</button></a></div>\n"
                                + "</form>"
                                
                                + "                            </div>" + "<br>";
                        }
                        
                    }

                } catch (Exception e) {
                    System.out.println(e);
                }

        %>

       <nav class="navbar navbar-expand-lg navbar-light bg-light my-0 py-0" >

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse " id="navbarNavAltMarkup">
                <div class="navbar-nav mr-auto mt-2 mt-lg-0">

                </div>
                <div class="navbar-nav">
                    <a class="nav-item nav-link " href="#">aboutUs<span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="#">howItWorks</a>
                    <a class="nav-item nav-link" href="#">offers</a>
                    <a class="nav-item nav-link " href="#">contactUs</a>
                </div>
            </div>
        </nav>
       
       
       <div class="d-sm-block	d-none">
               <div class="row grad text-white pad8 shadow">
            <div class="col-sm-4"><a class="navbar-brand text-white" href="dashboard.jsp"><strong>letsMooove</strong></a>
            </li></div>
            <div class="col-sm-2"><a class="nav-link text-white" href="findride.jsp">Find Ride</a></div>
            <div class="col-sm-2"><a class="nav-link text-white" href="offerride.jsp">Offer Ride</a></div>
            <div class="col-sm-1"><a class="nav-link text-white" href="#">Link</a></div>
            <div class="col-sm-2"><a class="nav-link text-white" href="#">Hello <% //out.print(name); %></a></div>
            <div class="dropdown col-sm-1">
                <button class="btn btn1 dropdown-toggle shadow" type="button" data-toggle="dropdown">
                <span class="caret"></span></button>
                <ul class="dropdown-menu pad8 mar8">
                  <li><a href="#">account</a></li>
                  <li><a href="#">history</a></li>
                  <li><a href="#">setting</a></li>
                  <li><a href="SignOut">signout</a></li>
                </ul>
              </div>
           
            
          </div>
           
           
           
           
       </div>
       <div class="d-sm-none	d-block">
              <nav class="navbar navbar-expand-lg navbar-light sticky-top grad text-white">
                  <div>  <a class="navbar-brand text-white" href="index.jsp"><strong>
                    letsMooove                         
                          </strong></a></div>

                <div class=" floatRight text-white"><% //out.print(name); %></div>
            
             <div class="dropdown">
                <button class="btn btn1 dropdown-toggle " type="button" data-toggle="dropdown">
                <span class="caret"></span></button>
                <ul class="dropdown-menu pad8 mar8">
                  <li><a href="#">account</a></li>
                  <li><a href="#">history</a></li>
                  <li><a href="#">setting</a></li>
                  <li><a href="SignOut">signout</a></li>
                </ul>
              </div>
             
 </nav>
            <div class="shadow  bg-white ">

                <p class="d-flex justify-content-center font1"><a class="pad8 text-dark" href="findride.jsp">Find Ride</a> 
                    <a class="pad8 text-dark" href="offerride.jsp">Offer Ride</a>
                    <a class="pad8 text-dark" href="#">Link</a></p>
           
            </div>
        
       </div>
        
        <div class="container-fluid">
           
          
            <div class="jumbotron">
                <div class="row ">
                    <div class="col-sm-8 mar8 pad8 ">
                        <div  id="rides">
                            <%                   
                                out.println(res);

                            %>
                        </div>
                    </div>

                    <div style="padding:5px"></div>


                </div>
                <%  }%>
                <div class="bg-darkest">....................................................</div>
            </div>
    </body>
</html>
