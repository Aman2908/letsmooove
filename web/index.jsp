<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
    <body>
        <%
            if (session.getAttribute("uid") != null) {
                response.sendRedirect("dashboard.jsp");
            }
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light my-0 py-0 " >

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


        <nav class="navbar navbar-expand-lg navbar-light sticky-top grad text-white shadow">
            <a class="navbar-brand text-white" href="index.jsp"><strong>
                    letsMooove                         
                </strong></a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=" text-white">Sign In</span>
            </button>

            <div class="collapse navbar-collapse  " id="navbarSupportedContent">

                <div class="navbar-nav mr-auto mt-2 mt-lg-0">

                </div>
                <form class="form-inline my-2 my-lg-0 " action="Login">
                    <input
                        class="form-control mr-sm-2"
                        type="text"
                        name="mob"
                        placeholder="Mobile No"
                        />
                    <input
                        class="form-control mr-sm-2"
                        type="password"
                        name="pass"
                        placeholder="password"
                        />
                    <button class="btn btn-outline-success my-2 my-sm-0 " type="submit">Sign In</button>
                </form>
            </div>

        </nav>

        <div class="container-fluid img-fluid back d-sm-block	d-none"> 
            <h1 class="text-white" style="margin-top: 250px "> Share More. Save More.</h1>
            <p class="text-white" style="margin-bottom:100px; font-weight: bold">Lets mooove & share travel costs with our community. </p>
            
            <form class="formwidth" action="GenerateOtp">
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="name"
                    placeholder="user name" 
                    />
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="email"
                    placeholder="email" 
                    />
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="phone"
                    placeholder="phone n." 
                    />
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="password"
                    name="pass"
                    placeholder="password" 
                    />
                <button class="btn btn1 shadow pad8 mar8 " type="submit">letsShare</button>
            </form>
            </div>
        
        
        
        
        <div class=" d-sm-none	d-block back"> <h1 class="text-white" style="padding-top:180px; padding-left:5px "> Share More.<br> Save More.</h1>
            <p class="text-white" style=" font-weight: bold;padding-left:5px">Lets mooove & share travel costs with our community. </p>
        </div>
        
                
        
        <div class="container-fluid bg-light d-sm-none	d-block "> 
       
            <form class="formwidth2  " action="GenerateOtp">
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="name"
                    placeholder="user name" 
                    />
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="email"
                    placeholder="email" 
                    />
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="phone"
                    placeholder="phone n." 
                    />
                <input
                    class="form-control mr-sm-2 pad8 mar8"
                    type="text"
                    name="pass"
                    placeholder="password" 
                    />
                <button class="btn btn1 shadow pad8 mar8 " type="submit">letsShare</button>
            </form>
            </div>
        
            
        <div class="bg-secondary text-white" style=" padding:5px"><h2>Driving in your car soon?</h2>
Let's make this your least expensive journey ever.</div>
        
        <div style=" padding:5px">  <h2> Go anywhere. From anywhere.</h2>
        <br>
        <b>Smart</b>
With access to millions of journeys, you can quickly find people nearby travelling your way.
<br><br>
<b>Simple</b>
Enter your exact address to find the perfect ride. Choose who you?d like to travel with. And book!
<br><br>
<b>Carpool with confidence.</b>

Government ID verification adds another level of security to member profiles.</div>
            <div class="bg-darkest ">....................................................</div>
            <script>
                
            </script>
    </body>
</html>
