<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Raleway"
      rel="stylesheet"
    />
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
           
           
            
          </div>
           
           
           
           
       </div>
       <div class="d-sm-none	d-block">
              <nav class="navbar navbar-expand-lg navbar-light sticky-top grad text-white">
                  <div>  <a class="navbar-brand text-white" href="index.jsp"><strong>
                    letsMooove                         
                          </strong></a></div>

                <div class=" floatRight text-white"></div>
            
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
     
      <div class="shadow pad8">
        <form
          class=" formwidth "
          style="padding-left:200px"
          action="Register"
        >
          <input
            class="form-control mr-sm-2 pad8 mar8"
            type="text"
            name="otp"
            placeholder="otp"
          />
          <button class="btn btn1 shadow pad8 mar8" type="submit">
            verify
          </button>
          <button class="btn btn1 shadow pad8 mar8" formaction="index.jsp" type="submit">
            resend
          </button>
        </form>
      </div>
    </div>
  </body>
</html>
