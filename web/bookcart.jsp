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
                //String mob = request.getParameter("mob");
                String name = request.getParameter("name");
                String mob = request.getParameter("did");
                String source = request.getParameter("source");
                String destination = request.getParameter("destination");
                String uid = (String) request.getSession().getAttribute("uid");
                String seatavail = request.getParameter("seatavail");
                String jdate = request.getParameter("date");
                String jtime = request.getParameter("time");
                String price = request.getParameter("price");
                System.out.println("mob =" + mob + "  uid=" + uid + "  price=" + price + " seatavail=" + seatavail + "  jdate=" + jdate);

                String rideid = mob + jdate.substring(5, 7) + jdate.substring(8, 10) + jtime.substring(0, 2);

                //getting image of owner of car
                JdbcConnection obj = new JdbcConnection();
                PrintWriter pw = response.getWriter();
                Connection con = obj.getConnection(pw);

                PreparedStatement ps = con.prepareStatement("select * from ridebooked" + mob + " where rideid=?");
                ps.setString(1, rideid);
                ResultSet rs = ps.executeQuery();
                int i = 0;
                String seatbooked = "0";
                while (rs.next()) {
                    i++;
                    seatbooked = rs.getString("seatbooked");
                }

                System.out.println("i="+i);
                PreparedStatement ps1 = con.prepareStatement("select * from userphoto where mob=?");
                ps1.setString(1, mob);
                ResultSet rs1 = ps1.executeQuery();
                boolean photo = false;
                String img = "";
                while (rs1.next()) {
                    photo = rs1.getBoolean("photo");
                    img = rs1.getString("img");
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
                <div class="col-sm-2"><a class="nav-link text-white" href="#">Hello <% out.print(name); %></a></div>
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

                <div class=" floatRight text-white"><% out.print(name); %></div>

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


            <div class="">
                <div class="row ">
                    <div class="col-sm-8 mar8 pad8 ">
                        <div  id="rides">
                            <div class="col-sm-8"><b><% out.print(name); %></b><br>
                                source: <% out.print(source); %> <br>
                                destination: <% out.print(destination); %><br>
                                seat available: <% out.print(seatavail); %><br>
                                date of departure: <% out.print(jdate); %><br>
                                time: <% out.print(jtime); %>
                            </div>
                            <div class="col-sm-4 "><br>


                                <%              out.print("<form method='post' name='form1' action='BookingCart' name='f1'>"
                                            + "<input type=\"hidden\" name=\"did\" value=" + mob + ">"
                                            + "<input type=\"hidden\" name=\"name\" value=" + name + ">"
                                            + "<input type='hidden' name='source' value=" + source + ">"
                                            + "<input type='hidden' name='destination' value=" + destination + ">"
                                            + "<input type='hidden' name='seatavail' value=" + seatavail + ">"
                                            // + "<input type='hidden' name='EMAIL' value='username@emailprovider.com'>"
                                            + "<input type='hidden' name='price' value=" + price + ">"
                                            + "<input type='hidden' name='date' value=" + jdate + ">"
                                            + "<input type='hidden' name='time' value=" + jtime + ">"
                                            + "<input type='range' id='drop' oninput='fun(" + price + ")' onchange='fun(" + price + ")' name='bookedseat' min='1' max='" + seatavail + "' value='1'>");
                                if(i==0){
                                            out.print("<button id='bt'  class=\"btn bg-darkest whitetext pad8 mar8 shadow\" disabled>Price : Rs. " + price + "</button>");
                                                    }
                                           if(i==0){out.print( "<a href='bookride.jsp '><button class=\"btn bg-darkest whitetext pad8 mar8 shadow \" type='submit' >Pay now</button></a></div>"); }
                                             if(i!=0)out.print("<button class=\"btn bg-darkest whitetext pad8 mar8 shadow \" onclick='#' style='width:500px;font-size:13pt;padding:2px; border:3px solid green' disabled >Payment Successfull</button>");
                                            out.print("</form>"); %>
                            </div>
                        </div>
                        <div class="bg-darkest">
                            <img class="pad8 mar8 img-responsive" src="./photos/<% if (photo == true) {
                                        out.print(img);
                                    } else {
                                        out.print("usericon.png");
                                    } %>" width="270px">
                        </div>
                    </div>


                </div>


                <% }%>
            </div>
            <script>
                function fun(x) {
                    //alert('hello');
                    var price = document.getElementById("drop").value;
                    var y = parseInt(x) * parseInt(price);
                    //alert("this is for "+y);
                    document.getElementById("bt").innerHTML = "Price : Rs. " + y.toString();
                }
            </script>
    </body>
</html>
