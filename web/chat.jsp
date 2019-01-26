<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.JdbcConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<title>CHAT</title>
	<link rel = "stylesheet" href = "css/sendbox.css" type = "text/css" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script >

		function saveMessage(){
			$.get(
					"savemessage.jsp" ,
					{
						msg : document.getElementById("msg").value
					} ,
					function(res , stat){
							document.getElementById("msg").value = "";
					}
				);
		}

		var cnt = -1;

		$(document).ready(
				function(){
					$(".typebox").keypress(
							function(e){
								if(e.keyCode == 13)saveMessage();
							}
						)
				}
			);

		$(document).ready(
				setInterval(
				 function(){
					$.get(
						"getMessageCount.jsp" ,
						function(res , stat){
                                                        if(cnt == -1){
                                                            //getAllMessages();
                                                            cnt = 0;
                                                        }
                                                        else
							if(parseInt(res) != cnt){
								cnt = parseInt(res);
								$.get(
								"getLastMessage.jsp" ,
								function(res , stat){
									$(".board table").append(res);
								}
								);
							}
						}
						)
				}
				 , 500
				)
				
				
			);
	</script>


</head>
<body>
<%
	if(session.getAttribute("uid") == null){
			response.sendRedirect("index.jsp");
		}
	String uname = (String)session.getAttribute("uid") + "";
        
        ResultSet rs;
        //String uname="";
        
        System.out.println("here uid ="+String.valueOf(session.getAttribute("uid"))+" and hid ="+request.getParameter("hid"));
	String other = request.getParameter("hid");
        //String other="";
	String tname = "";
        
        System.out.println("before compare to uname="+uname+"  othername ="+other);
        
	if(uname.compareTo(other) > 0){
            System.out.println("before compare to");
		tname ="tname"+ uname + other;
                System.out.println("before compare to");
	}
	else{
            System.out.println("after compare to");
		tname ="tname"+ other + uname;
                System.out.println("tname  ="+tname);
	}
	session.setAttribute("table" , tname);
%>
	<a href = "dashboard.jsp" id = "home">HOME</a>

<div class = "board" style="height: 600px; width: 80%">
	<table>
		
	</table>
</div>

	<div>
		<input type = "text" id = "msg" class = "typebox" style="width: 85%">
		<button class = "sendbutton" onclick="saveMessage()" style="width: 10%">Send</button>
	</div>

</body>
</html>