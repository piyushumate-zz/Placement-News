package Placement;

import javax.mail.Session;
import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class MailApp1 extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	    final String DB_URL="jdbc:mysql://localhost/placementnews";
	    final String USER = "root";
	    final String PASS = "golutron";
	   // String[] to = null;
	    int i=0;
	    PrintWriter out=response.getWriter();
	    String[] to = new String[100];

	     
	    try
	    {
	         // Register JDBC driver
	   
	         Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	         Connection conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
		        
	         // Execute SQL query
	         Statement stmt = (Statement) conn.createStatement();
	         String sql;
	         sql = "SELECT first_name,email FROM userinfo where username <> 'admin'";
		        
	         ResultSet rs = stmt.executeQuery(sql);
	         // Extract data from result set
             while(rs.next())
	         {
	            //Retrieve by column nam
	           to[i]= rs.getString("email");
	//           NotifyMail.send(to,first_name,company_name);
	            i=i+1;
	         }
          
	         // Clean-up environment
	         rs.close();
	         stmt.close();
	         conn.close();
	    }
	   
	    catch(SQLException se)
	    {
	         //Handle errors for JDBC
	         se.printStackTrace();
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		HttpSession session=request.getSession();
		String company_name=(String) session.getAttribute("company_name");
		System.out.println(to[0]);
		NotifyMail.send(to,company_name);
		out.println("<script>alert('E-mails have been sent successfully!!');window.location='notify.jsp';</script>");

	}
	
}