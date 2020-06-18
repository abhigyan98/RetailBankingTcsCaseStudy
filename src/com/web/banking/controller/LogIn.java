package com.web.banking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.banking.db.BankingDbUtil;

@WebServlet("/LogIn")
public class LogIn extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String roll=BankingDbUtil.verifyLogin(username, password);
		if(roll!=null)		
		{
					String contextPath = request.getContextPath();
					response.sendRedirect(response.encodeRedirectURL(contextPath + "/home.jsp")); 
					session.setAttribute("username",username);
					session.setAttribute("roll",roll);
					
					
		}
		else 
		{
			session.invalidate();
		    request.setAttribute("error", "Invalid Credentials");
		    
		    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		    rd.forward(request, response); 
		} 
	}
}