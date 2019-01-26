
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import jdbc.JdbcConnection;
import org.w3c.dom.Document;

@WebServlet(urlPatterns = {"/LoadRide"})
public class LoadRide extends HttpServlet {

    public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        PrintWriter pw=response.getWriter();
        String from=(String)request.getParameter("from");
        String to=(String)request.getParameter("to");
        String date=(String)request.getParameter("date");
        String time=(String)request.getParameter("time");
        
        try {
         String latlngfrom[]= getLatLongPositions(from);
        String fromLat=latlngfrom[0];
        if(fromLat.length()>10){
            fromLat=fromLat.substring(0,10);  
        }
        String fromLong=latlngfrom[1];
        if(fromLong.length()>10){
            fromLong=fromLong.substring(0,10);
        }
        
        String latlngto[]=getLatLongPositions(to);
        String toLat=latlngto[0];
        String toLong=latlngto[1];
        
        if(toLat.length()>10){
            toLat=toLat.substring(0,10);
        }
        
        if(toLong.length()>10){
            toLong=toLong.substring(0,10);
        }
        
        
        response.sendRedirect("loadRide.jsp?fromLat="+fromLat+"&fromLong="+fromLong+"&toLat="+toLat+"&toLong="+toLong+"&date="+date+"");
        }catch(Exception e){
            pw.println(e);
        }
        
    }
   
    public static String[] getLatLongPositions(String address) throws Exception
  {
    int responseCode = 0;
    String api = "https://maps.googleapis.com/maps/api/geocode/xml?address="+URLEncoder.encode(address, "UTF-8") + "&key=AIzaSyAZiYsGqEFDuGmVSd04aCtTdB94tPtjfPI";
    URL url = new URL(api);
    HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
    httpConnection.connect();
    responseCode = httpConnection.getResponseCode();
    if(responseCode == 200)
    {
      DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
      Document document = builder.parse(httpConnection.getInputStream());
      XPathFactory xPathfactory = XPathFactory.newInstance();
      XPath xpath = xPathfactory.newXPath();
      XPathExpression expr = xpath.compile("/GeocodeResponse/status");
      String status = (String)expr.evaluate(document, XPathConstants.STRING);
      if(status.equals("OK"))
      {
         expr = xpath.compile("//geometry/location/lat");
         String latitude = (String)expr.evaluate(document, XPathConstants.STRING);
         expr = xpath.compile("//geometry/location/lng");
         String longitude = (String)expr.evaluate(document, XPathConstants.STRING);
         return new String[] {latitude, longitude};
      }
      else
      {
         throw new Exception("Error from the API - response status: "+status);
      }
    }
    return null;
  }

}
