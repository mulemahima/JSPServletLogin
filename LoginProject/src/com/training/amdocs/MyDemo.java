package com.training.amdocs;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mahima.loginbean.Login;
import com.mahima.logindao.LoginDao;



/**
 * Servlet implementation class MyDemoServlet
 */
@WebServlet("/login")
public class MyDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private LoginDao loginDao;
    public MyDemo() {
        super();
        
        // TODO Auto-generated constructor stub
    }

    public void init() {
        loginDao = new LoginDao();
    }
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 String username = request.getParameter("Uname1");
	        String password = request.getParameter("Pass");
	        Login loginBean = new Login();
	        loginBean.setUserName(username);
	        loginBean.setPassword(password);

	        try {
	            if (loginDao.validate(loginBean)) {
	            	HttpSession session = request.getSession(true);	    
	                session.setAttribute("currentSessionUser",username); 
	                response.sendRedirect("User.jsp");
	                
	            }  
	            else if(loginDao.validateAdmin(loginBean)) {
	            	HttpSession session = request.getSession(true);	    
	                session.setAttribute("currentSessionUser",username); 
	                
	                response.sendRedirect("Admin.jsp");
	                
	            }
	            else {
	                response.sendRedirect("Login.jsp");
	                System.out.println("Invalid Credentials");
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }

		
}
