import java.util.Properties;  
  
import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  

import java.io.IOException;  
import java.io.PrintWriter;  
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Random;
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
public class Mailer {  
public static void send(String to,String subject,String msg,String mob) throws MalformedURLException, IOException{  
  
final String user="email.2908test@gmail.com";//change accordingly  
final String pass="qwerty@1998";  
  
final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

//1st step) Get the session object    
Properties props = new Properties();  
props.setProperty("mail.smtp.host", "smtp.gmail.com");
     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
     props.setProperty("mail.smtp.socketFactory.fallback", "false");
     props.setProperty("mail.smtp.port", "465");
     props.setProperty("mail.smtp.socketFactory.port", "465");
     props.put("mail.smtp.auth", "true");
     props.put("mail.debug", "true");
     props.put("mail.store.protocol", "pop3");
     props.put("mail.transport.protocol", "smtp");  
  
Session session = Session.getDefaultInstance(props,  
 new javax.mail.Authenticator() {  
  protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(user,pass);  
   }  
});  
//2nd step)compose message  
try {  
 MimeMessage message = new MimeMessage(session);  
 message.setFrom(new InternetAddress(user));  
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
 message.setSubject(subject);  
 message.setText(msg);  
   
 //3rd step)send message
 try{
 URL url=new URL("http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=email.2908test@gmail.com:qwerty123&senderID=TEST%20SMS&receipientno="+mob+"&msgtxt=your%20OTP%20is%20"+msg+"&state=4");
 url.openStream();
 }catch(Exception e){
 System.out.println(e);
 }
 Transport.send(message);  
  
 System.out.println("Done");  
  
 } catch (MessagingException e) {  
    throw new RuntimeException(e);  
 }  
      
}  
}  


