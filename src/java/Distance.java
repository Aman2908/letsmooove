
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class Distance {

    public static String fun(String fromLat,String fromLong,String toLat,String toLong) throws MalformedURLException, IOException {
        URL url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?origins="+fromLat+","+fromLong+"&destinations="+toLat+","+toLong+"&key=AIzaSyBFcZ9M-6LkLvY1I3H_DjvJ0SGSz0clbL0");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        String line, outputString = "";
        BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream()));
        while ((line = reader.readLine()) != null) {
            outputString += line;
        }
        String str="";
        int st=outputString.indexOf("km\",")-10;
        int b=outputString.indexOf(":", st);
        int c=outputString.indexOf("\"", b);
        return outputString.substring(c+1,outputString.indexOf("km"));
        
    }
}
