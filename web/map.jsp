<!DOCTYPE html>
<html>
  <head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
    //var mkr = new google.maps.Marker({position: uluru, map: map});

    $(document).ready(
      setInterval(
          function(){
              $("#loc").load("dat.txt");
              var lt = parseFloat(document.getElementById("lt").innerHTML);
              var ln = parseFloat(document.getElementById("ln").innerHTML);
             // alert(lt+" "+ln);
              updateMap(lt,ln);
          }
        ,500)
    );
  </script>

    <style>
      #map {
        height: 500px;  
        width: 40%;  
       }
    </style>
  </head>
  <body>
    <h3><a href = "dashboard.jsp" id = "home">HOME</a></h3>
    <h3>
        My Current Running Ride Location
    </h3>
    <div id="map"></div>
    <script>
    var uluru , map , marker;
function initMap() {
  // The location of Uluru
  uluru = {lat: 26.49668494, lng: 80.30926277};
  // The map, centered at Uluru
  map = new google.maps.Map(
      document.getElementById('map'), {zoom: 16, center: uluru});
  // The marker, positioned at Uluru
  marker = new google.maps.Marker({position: uluru, map: map});
}

function updateMap(lt , ln){
  marker.setPosition({lat:lt , lng:ln , alt:0});
  map.setCenter({lat:lt , lng:ln , alt:0});
}

    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZiYsGqEFDuGmVSd04aCtTdB94tPtjfPI&callback=initMap">
    </script>
    <p id = "loc">Curr Location</p>
  </body>
</html>