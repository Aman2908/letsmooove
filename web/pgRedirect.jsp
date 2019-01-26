<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>    
<%
    
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
    String paramName = (String)paramNames.nextElement();
    String paramValue=mapData.get(paramName)[0];
    System.out.println(paramName+"  "+paramValue);
        //String paramName = (String)paramNames.nextElement();
    parameters.put(paramName,paramValue);	
}
     
    parameters.put("MID","LViKgO17661897844665");
parameters.put("CHANNEL_ID","WEB");
parameters.put("INDUSTRY_TYPE_ID","Retail");
parameters.put("WEBSITE","WEBSTAGING");
parameters.put("MOBILE_NO","7599682958");
parameters.put("EMAIL","vinayrajput735@gmail.com");
parameters.put("CALLBACK_URL", "http://localhost:9292/letsmooove/pgResponse.jsp");


    //parameters.put("ORDER_ID", request.getParameter("rid"));
   //parameters.put("CUST_ID", (String) session.getAttribute("uid"));
    //parameters.put("TXN_AMOUNT", request.getParameter("amnt"));
    
    //parameters.put("CHANNEL_ID", "WEB");
    //parameters.put("INDUSTRY_TYPE_ID", "Retail");
    
    
    
    parameters.put("CALLBACK_URL", "http://localhost:9292/letsmooove/pgResponse.jsp");
    String checkSum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum("ROLVv2vElb#3sTvG", parameters);
    StringBuilder outputHtml = new StringBuilder();
    outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
    outputHtml.append("<html>");
    outputHtml.append("<head>");
    outputHtml.append("<title>Merchant Check Out Page</title>");
    outputHtml.append("</head>");
    outputHtml.append("<body>");
    outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
    outputHtml.append("<form method='post' action='https://securegw-stage.paytm.in/theia/processTransaction' name='f1'>");
    outputHtml.append("<table border='1'>");
    outputHtml.append("<tbody>");
    for (Map.Entry<String, String> entry : parameters.entrySet()) {
        String key = entry.getKey();
        String value = entry.getValue();
        outputHtml.append("<input type='hidden' name='" + key + "' value='" + value + "'>");
    }

    outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='" + checkSum + "'>");
    outputHtml.append("</tbody>");
    outputHtml.append("</table>");
    outputHtml.append("<script type='text/javascript'>");
    outputHtml.append("document.f1.submit();");
    outputHtml.append("</script>");
    outputHtml.append("</form>");
    outputHtml.append("</body>");
    outputHtml.append("</html>");
    
    out.println(outputHtml);
%>