<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jdbc.JdbcConnection"%>
<%@page import="java.sql.Connection"%>
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
    </head>
    <body >
        <% if (session.getAttribute("uid") == null)
                response.sendRedirect("index.jsp");
            else {

                JdbcConnection obj = new JdbcConnection();
                PrintWriter pw = response.getWriter();
                Connection con = obj.getConnection(pw);
                String mob = (String) session.getAttribute("uid");
                String pass = (String) session.getAttribute("pass");
                String name = "";
                String email = "";
                PreparedStatement ps1 = con.prepareStatement("select * from userphoto where mob=?");
                ps1.setString(1, mob);
                ResultSet rs1 = ps1.executeQuery();
                boolean photo = false;
                String img = "";
                while (rs1.next()) {
                    photo = rs1.getBoolean("photo");
                    img = rs1.getString("img");
                }
                
                
                PreparedStatement ps = con.prepareStatement("select * from user where mob=? and pass=?");
                ps.setString(1, mob);
                ps.setString(2, pass);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    name = rs.getString("name");
                    email = rs.getString("email");
                }
                
                PreparedStatement ps2 = con.prepareStatement("select * from offeredridesbasics where mob=?");
                                ps2.setString(1, mob);
                                
                                ResultSet rs2 = ps2.executeQuery();
                                int i = 0;
                                String resulting="";
                                while (rs2.next()) {
                                    String rideid=rs2.getString("rideid");
                                    //String tbnm="rideoffered"+String.valueOf(mob);
                                    PreparedStatement ps4 = con.prepareStatement("select * from rideoffered" +mob+ " where rideid=?");
                                    //ps4.setString(1,tbnm);
                                    ps4.setString(1,rideid);
                                    System.out.println(rideid);
                                    String sb="0";
                                    ResultSet rs4 = ps4.executeQuery();
                                    System.out.println("rideoffered" +mob);
                                    while(rs4.next()){
                                        sb=String.valueOf(rs4.getString("seatbooked"));
                                    }
                                    System.out.println("rideid "+rideid+"  seat ="+sb);
                                       resulting+="<tr><td>"+rs2.getString("src")+"</td><td>"+rs2.getString("dest")+"</td>  <td>"+rs2.getString("date1")+"</td>   <td>   "+rs2.getString("time1")+"</td><td>    "+rs2.getString("seatavail")+"</td><td><a href='user_details.jsp?rideid="+rideid+"'>"+sb+"</td></tr>";
                                }
                            
                                
                            
                PreparedStatement ps3 = con.prepareStatement("select * from rideBooked" +mob);
                                
                                ResultSet rs3 = ps3.executeQuery();
                                
                                int j = 0;
                                String resulting1="";
                                
                                while (rs3.next()) {
                                    System.out.println("inside rs3");
                                    String rideid=rs3.getString("rideid");
                                    String sbkd=rs3.getString("seatbooked");
                                    System.out.println("rideid =="+rideid);
                                    PreparedStatement ps4 = con.prepareStatement("select * from offeredridesbasics where rideid=?");
                                    ps4.setString(1,rideid);
                                    ResultSet rs4=ps4.executeQuery();
                                    String src="";
                                    String dest="";
                                    String date1="";
                                    String time1="";
                                    String name1="";
                                    String seatavail="0";
                                    while(rs4.next()){
                                        src=rs4.getString("src");
                                        dest=rs4.getString("dest"); 
                                        date1=rs4.getString("date1");
                                        time1=rs4.getString("time1");
                                        name1=rs4.getString("name");
                                        seatavail=rs4.getString("seatavail");
                                    }
                                    int savail=Integer.parseInt(seatavail);
                                    if(savail>0)
                                       resulting1+="<tr><td>"+src+"</td><td>"+ dest +"</td>  <td>"+ date1 +"</td>   <td>   "+ time1 +"</td><td><a href='owner_details.jsp?rideid="+rideid+"'>  "+ sbkd +"</a></td><td>"+ name1 +"</td></tr>";
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
                <div class="col-sm-1"><a class="nav-link text-white" href="map.jsp">Current Ride</a></div>
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
        <div class="d-sm-none	d-block ">
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
                    <a class="pad8 text-dark" href="map.jsp">Current Ride</a></p>

            </div>

        </div>




        <div class="container-fluid ">



            <div class="row ">
                <div class="col-sm-3 shadow bg-white">
                    
                    <img class="pad8 mar8 img-responsive rounded-circle" src="./photos/<% if (photo == true) {
                  out.print(img);
              } else {
                  out.print("usericon.png");
              } %>" width="270px">
                    <form action="UploadServlet" enctype="multipart/form-data" method="post">
                        <input type="file" name="file" id="file" />
                        <input type="submit" value="Upload" name="upload" id="upload" />
                    </form>>
                    <ul>

                        <li> <div class="pad8 mar8"><% out.print(name);%></div></li>
                        <li> <div class="pad8 mar8"><% out.print(mob);%><button class="btn btn1 floatRight">verified</button> </div></li>
                        <li><div class="pad8 mar8"><% out.print(email); %><button class="btn btn1 floatRight">verified</button></div></li>

                    </ul>



                </div>
                <div class="col-sm-8 mar8 shadow ">
                    <h2>Offered Ride</h2>
                    <%
                    
                    out.println("<table style = 'width:100%' class='table table-hover table-responsive-sm'>"
                                    +"<thead><tr><th> from </th> <th> to </th> <th> date </th> <th> time </th> <th> seat avail </th> <th> seat booked </th></tr></thead>"
                                     +"<tr>"
                                    +resulting
                                    +"</tr>"+"</table>");
                    
                    %>
                    <br>
                    <h2>Booked Ride</h2>
                     <%
                    
                    out.println("<table style = 'width:100%' class='table table-hover table-responsive-sm'>"
                                    +"<thead><tr><th> from </th> <th> to </th> <th> date </th> <th> time </th> <th> seat booked </th> <th> car owner name </th></tr></thead>"
                                     +"<tr>"
                                     + resulting1
                                    +"</tr>"+"</table>");
                    
                    %>
                    
                
            </div><% } %>




            </div></div>
        <div class="bg-darkest">....................................................</div>
    </body>
</html>
