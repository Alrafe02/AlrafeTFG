package utils;

import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.Message.RecipientType;

public class ConexionEmail {
	
	
	String destinatario;
	String asunto;
	String cuerpo; 
	 public static void enviarConGMailPDF(String email, String codPDF) throws MessagingException, IOException {
		 String remitente = "alrafepruebas@gmail.com";  //Para la dirección nomcuenta@gmail.com
		    String passwd = "mwwpspnbzvzvzqan";
		    
	      Properties props = new Properties();
	      props.put("mail.smtp.host", "smtp.gmail.com");
	      props.setProperty("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	      props.setProperty("mail.smtp.port", "587");
	      props.setProperty("mail.smtp.user", remitente);
	      props.setProperty("mail.smtp.auth", "true");
	      Session session = Session.getDefaultInstance(props);
	      MimeMultipart m = new MimeMultipart();
	      MimeBodyPart attachCod = new MimeBodyPart();
	      
			attachCod.attachFile(codPDF);

	      m.addBodyPart(attachCod);
	      MimeMessage message = new MimeMessage(session);
	      message.setFrom(new InternetAddress(remitente));
	      message.addRecipient(RecipientType.TO, new InternetAddress(email));
	      message.setSubject("Pedido realizado en TFG_Alrafe");
	      message.setText("Pedido realizado, adjunto su factura");
	      message.setContent(m);
	      Transport transport = session.getTransport("smtp");
	      transport.connect(remitente, passwd);
	      transport.sendMessage(message, message.getAllRecipients());
	      transport.close();
	   }

	public static void enviarConGMail(String destinatario, String asunto, String cuerpo) throws MessagingException {
	    // Esto es lo que va delante de @gmail.com en tu cuenta de correo. Es el remitente también.
	    String remitente = "alrafepruebas@gmail.com";  //Para la dirección nomcuenta@gmail.com
	    String passwd = "mwwpspnbzvzvzqan";

	    Properties props = new Properties();
	    
	    props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
	    props.setProperty("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 
	    props.setProperty("mail.smtp.port", "587"); //El puerto SMTP seguro de Google
	    props.setProperty("mail.smtp.user", remitente);
	    props.setProperty("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
	    
	   
	    
	    
	    
	    

	    
	    Session session = Session.getDefaultInstance(props);
	   
	    BodyPart texto = new MimeBodyPart();
	    texto.setText("Prueba");
	    
	    BodyPart adjunto = new MimeBodyPart();
	    adjunto.setDataHandler(new DataHandler(new FileDataSource("")));
	    adjunto.setFileName("");
	    
	    MimeMultipart m = new MimeMultipart();
	    m.addBodyPart(texto);
	    m.addBodyPart(adjunto);
	    
	  
	    
	    
	    MimeMessage message = new MimeMessage(session);


	        message.setFrom(new InternetAddress(remitente));
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));   //Se podrían añadir varios de la misma manera
	       
	        message.setSubject(asunto);
	        message.setText(cuerpo);
	        
	        Transport transport = session.getTransport("smtp");
	        transport.connect(remitente, passwd);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();

	}
}
