<%@page import="java.io.File"%>
<%@page import = "java.io.*"%>
<%
	File file = new File("C:\\Users\\vinay\\Documents\\NetBeansProjects\\letsmooove\\web\\dat.txt");
	FileWriter fr = new FileWriter(file);
	try{
		fr.write("<div id = \"lt\" >");
		fr.write(request.getParameter("lat")+"</div> <div id = \"ln\" >"+request.getParameter("lon") + " </div>");
		fr.close();
	}
	catch(Exception e){
		out.println(e);
	}
%>