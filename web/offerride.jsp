<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jdbc.JdbcConnection"%>
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

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZiYsGqEFDuGmVSd04aCtTdB94tPtjfPI&libraries=places"></script>
        <script>
            var placename;
            var placelatitude;
            var placelongitude;

            var place1name;
            var place1latitude;
            var place1longitude;

            function initialize() {
                var input = document.getElementById('searchTextField');
                var input1 = document.getElementById('searchTextField1');
                var autocomplete = new google.maps.places.Autocomplete(input);
                var autocomplete1 = new google.maps.places.Autocomplete(input1);
                google.maps.event.addListener(autocomplete, 'place_changed', function () {
                    place = autocomplete.getPlace();
                    place1 = autocomplete1.getPlace();
                    placename = place.name;
                    placelatitude = place.geometry.location.lat();
                    placelongitude = place.geometry.location.lng();

                    place1name = place1.name;
                    place1latitude = place1.geometry.location.lat();
                    place1longitude = place1.geometry.location.lng();


                });
            }

            function callajax() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        alert("inside");
                        alert(this.responsetext);
                    }
                }

                xhttp.open("POST", "OfferRide?fromLat=" + placelatitude + "&fromLong=" + placelongitude + "&toLat=" + place1latitude + "&toLong=" + place1longitude + "", true);
                xhttp.send();
            }
            google.maps.event.addDomListener(window, 'load', initialize);

        </script>

    </head>
    <body>
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
            <div class="col-sm-1"><a class="nav-link text-white" href="#">Current Ride</a></div>
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
                    <a class="pad8 text-dark" href="#">Current Ride</a></p>
           
            </div>
        
       </div>
        <div class="container-fluid">
           
         
            <div class="">
                <div class="row ">
                    <div class="col-sm-3 shadow bg-white">
                        <img class="pad8 mar8 img-responsive rounded-circle" src="./photos/<% if (photo == true) {
                  out.print(img);
              } else {
                  out.print("usericon.png");
              } %>" width="270px">
                        <ul>

                            <li> <div class="pad8 mar8"><% out.println(name); %></div></li>
                            <li> <div class="pad8 mar8"><% out.println(mob); %><button class="btn btn1 floatRight">verified</button> </div></li>
                            <li><div class="pad8 mar8"><% out.println(email);
                  }%><button class="btn btn1 floatRight">verified</button></div></li>
                            <li><div class="pad8 mar8">government id <button class="btn btn-danger floatRight">verify</button></div> </li>
                        </ul>



                    </div>
                    <div class="col-sm-8 mar8 pad8 ">

                        <div class=" shadow">
                            <div class="mar8 pad8">
                                <form class=" " action="OfferRide">
                                    <input
                                        id="searchTextField"
                                        class="form-control mr-sm-2 mar8 pad8"
                                        type="text"
                                        autocomplete="on"
                                        name="from"
                                        placeholder="source"
                                        />
                                    <input
                                        id="searchTextField1"
                                        class="form-control mr-sm-2 mar8 pad8"
                                        type="text"
                                        autocomplete="on"
                                        name="to"
                                        placeholder="destination"
                                        />
                                    <input
                                        class="form-control mr-sm-2 mar8 pad8"
                                        type="text"
                                        name="carno"
                                        placeholder="car no."
                                        />
                                    <input
                                        class="form-control mr-sm-2 mar8 pad8"
                                        type="text"
                                        name="seatavail"
                                        placeholder="seat available"
                                        />
                                    <input
                                        class="form-control mr-sm-2 mar8 pad8"
                                        type="date"
                                        name="date"
                                        placeholder="date"
                                        />
                                    <input
                                        class="form-control mr-sm-2 mar8 pad8"
                                        type="time"
                                        name="time"
                                        placeholder="time"
                                        />
                                    <button class="btn btn1 shadow mar8 pad8" type="submit">offer ride</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                

            </div>
            
        </div><div class="bg-darkest">....................................................</div>
    </body>
</html>
