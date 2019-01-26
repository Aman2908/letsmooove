/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import javax.xml.xpath.XPathConstants;
import jdbc.JdbcConnection;
import org.w3c.dom.Document;
@WebServlet(urlPatterns = {"/OfferRide"})
public class OfferRide extends HttpServlet  {

    public void service(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        //String fromLat=request.getParameter("fromLat");
        //String fromLong=request.getParameter("fromLong");
        
        PrintWriter pw=response.getWriter();
        String from=request.getParameter("from");
        String to=request.getParameter("to");
        String carno=request.getParameter("carno");
        String seatavail=request.getParameter("seatavail");
        String date=request.getParameter("date");
        String time=request.getParameter("time");
        String mob=(String)request.getSession().getAttribute("uid");
        
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
        
        Connection con=JdbcConnection.getConnection(pw);
        
        PreparedStatement ps2=con.prepareStatement("select * from user where mob=?");
          ps2.setString(1,(String)request.getSession().getAttribute("uid"));
          ResultSet rs=ps2.executeQuery();
          String name="";
          while(rs.next()){
              name=rs.getString("name");
          }
          
          String rideid=""+mob+date.substring(5,7)+date.substring(8,10)+time.substring(0,2);
        //PreparedStatement ps3=con.prepareStatement("insert into RideOffered"+mob+"(rideid,uid,seatbooked) values(?,?,?)");
        //ps3.setString(1,rideid);
        //ps3.setString(2,mob);
        
        //int result3=ps3.executeUpdate();
        //if(result3!=1)
        //    response.sendRedirect("error.html");
        //String rideid=mob+date.substring(5,7)+date.substring(8,10)+timesubstring(0,2);
        PreparedStatement ps1=con.prepareStatement("insert into offeredRidesBasics(rideid,mob,carno,seatavail,date1,time1,src,dest,name) values(?,?,?,?,?,?,?,?,?)");
        ps1.setString(1,rideid);
        ps1.setString(2,mob);
        ps1.setString(3,carno);
        ps1.setString(4,seatavail);
        ps1.setString(5,date);
        ps1.setString(6,time);
        ps1.setString(7,from);
        ps1.setString(8,to);
        ps1.setString(9,name);
        
        int result1=ps1.executeUpdate();
        if(result1!=1)
            response.sendRedirect("error.html");
        
        
        //code to calculate distance start here
        URL url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?origins="+fromLat+","+fromLong+"&destinations="+toLat+","+toLong+"&key=AIzaSyAZiYsGqEFDuGmVSd04aCtTdB94tPtjfPI");
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
        String dist=outputString.substring(c+1,outputString.indexOf("km"));
        //here dist give the distance calculated using this code
        System.out.println(dist);
        float price=Float.parseFloat(dist);
        price=(float)Math.ceil(2.5*price);
        System.out.println(price);
        
        PreparedStatement ps=con.prepareStatement("insert into offeredRides(rideid,mob,carno,seatavail,date1,time1,fromLat,fromLong,toLat,toLong,price) values(?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,rideid);
        ps.setString(2,mob);
        ps.setString(3,carno);
        ps.setString(4,seatavail);
        ps.setString(5,date);
        ps.setString(6,time);
        ps.setString(7,fromLat);
        ps.setString(8,fromLong);
        ps.setString(9,toLat);
        ps.setString(10,toLong);
        
        ps.setString(11,String.valueOf(price));
        
        System.out.println(""+price);
        
        int result=ps.executeUpdate();
        if(result==1){
            response.sendRedirect("dashboard.jsp");
        }
        else{
            response.sendRedirect("error.html");
        }
        
        System.out.println("from Latitude ="+fromLat+"  from Longitude="+fromLong);
        System.out.println("to Latitude ="+toLat+"  to Longitude="+toLong);
        System.out.println("car number="+carno);
        System.out.println("seat available="+seatavail);
        System.out.println("date="+date);
        System.out.println("time="+time);
        System.out.println("mob="+mob);
        } catch (Exception ex) {
            Logger.getLogger(OfferRide.class.getName()).log(Level.SEVERE, null, ex);
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
