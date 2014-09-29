package Placement;

import javax.mail.Session;
import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MailApp extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String to=(String) session.getAttribute("email");
		String first_name=(String) session.getAttribute("first_name");
		String company_name=(String) session.getAttribute("company_name");
		
		PrintWriter out=response.getWriter();
		SendMail.send(to,first_name,company_name);
		out.println("<script>alert('Thank You for registering!.A confirmation email has been sent ');window.location='companies.jsp';</script>");
		
	}
	
}