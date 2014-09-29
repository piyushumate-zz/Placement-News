package Placement;

import javax.servlet.http.HttpServlet;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class NotifyMail 
{

	public static void send(String[] to,String company_name)
	{
		String subject="Placement News:-"+company_name+" Registration Open";
		String content="Hi everyone,"+ "\n You are shortlisted for "+company_name;
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
        	System.out.println("kkk");
        	Message msg=new MimeMessage(session);
        	msg.setFrom(new InternetAddress(from));
        	msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to[0]));
        	System.out.println("rrr"+to.length);
        	for(int i=1;to[i]!=null;i++)
        	{
        		msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(to[i]));
        	    
        	}
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