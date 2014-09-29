package Placement;

import javax.servlet.http.HttpServlet;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class SendMail 
{

	public static void send(String to,String first_name,String company_name)
	{
		String subject="Placement News:-"+company_name+" Registration Successful";
		String content="Hi "+first_name+ ",\nYou have successfully registered for "+company_name;
		final String from="placements.pict@gmail.com";
		final String password="pict12345";
		Properties prop=new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "465");
		System.out.println("a");
		Authenticator auth = new Authenticator() 
		{
            public PasswordAuthentication getPasswordAuthentication() 
            {
                return new PasswordAuthentication(from,password);
            }
        };
        Session session=Session.getInstance(prop, auth);
        System.out.println("aa");
        try
        {
        	System.out.println("aaa");
        	Message msg=new MimeMessage(session);
        	msg.setFrom(new InternetAddress(from));
        	msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        	msg.setSubject(subject);
        	msg.setText(content);
        	System.out.println("qq");
        	Transport.send(msg);
        	System.out.println("done");
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        
	}
}