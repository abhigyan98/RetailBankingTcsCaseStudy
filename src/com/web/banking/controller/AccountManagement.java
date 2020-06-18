package com.web.banking.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.banking.db.BankingDbUtil;
import com.web.banking.entity.Account;
import com.web.banking.entity.Customer;
import com.web.banking.entity.TransStatement;

@WebServlet("/AccountManagement")
public class AccountManagement extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/login.jsp")); 
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		
		switch(command){
			case "CREATE":
				createAccount(request,response);
				break;
			case "DELETE":
				deleteAccount(request,response);
				break;
			case "VIEW":
				viewAccount(request,response);
				break;
			case "DEPOSIT":
				deposit(request,response);
				break;
			case "WITHDRAW":
				withdraw(request,response);
				break;
				
			case "TRANSFER":
				transfer(request,response);
				break;
			
			case "PRINTSTATEMENT":
			try {
				printStatement(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				break;
				
		}
	}



	private void createAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		String accountType = request.getParameter("accountType");
		double balance = Double.parseDouble(request.getParameter("depositAmount"));
		
		HttpSession session = request.getSession();
		
		Customer customer = BankingDbUtil.getCustomer(customerId);
		
		if(customer!=null) {
			Account account = new Account(customerId,accountType,balance);
			
			int id = BankingDbUtil.createAccount(account);
			
			session.setAttribute("msg","Success : Account is created !!");
			session.setAttribute("accountId", id);
		}
		else
			session.setAttribute("msg","Failure : Invalid Customer ID !!");
		
		
		String contextPath = request.getContextPath();
 		response.sendRedirect(response.encodeRedirectURL(contextPath + "/create-account-form.jsp")); 
		
	}
	
	private void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		
		HttpSession session =request.getSession();
		
		Account account = BankingDbUtil.getAccount(accountId);
		
		
		if(account!=null) {
			BankingDbUtil.deleteAccount(accountId);
			session.setAttribute("msg","Success : Account is deleted !!");
		}
		else
			session.setAttribute("msg","Failure : Invalid Account ID !!");
		
		String contextPath = request.getContextPath();
		response.sendRedirect(response.encodeRedirectURL(contextPath+"/delete-account-form.jsp"));
		
	}
	
	private void viewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		
		HttpSession session =request.getSession();
		
		Account account = BankingDbUtil.getAccount(accountId);
		
		if(account!=null) {
			Customer customer = BankingDbUtil.getCustomer(account.getCustomerId());
			request.setAttribute("The_Account",account);
			request.setAttribute("The_Customer",customer);
			RequestDispatcher rd = request.getRequestDispatcher("/view-account.jsp");
			rd.forward(request,response);
		}
		else {
		    session.setAttribute("msg", "Invalid Account ID");
		    
		    String contextPath = request.getContextPath();
		    response.sendRedirect(response.encodeRedirectUrl(contextPath+"/view-account-form.jsp"));
		} 
		
		
	}
	
	private void deposit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		double dAmount = Double.parseDouble(request.getParameter("depositAmount"));
		
		
		String msg = BankingDbUtil.deposit(accountId,dAmount);
		
		HttpSession session =request.getSession();
		session.setAttribute("msg",msg);
		
		String contextPath = request.getContextPath();
	    response.sendRedirect(response.encodeRedirectUrl(contextPath+"/deposit-form.jsp"));
	}
	
	private void withdraw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		double wAmount = Double.parseDouble(request.getParameter("withdrawAmount"));
		
		
		String msg = BankingDbUtil.withdraw(accountId,wAmount);
		
		HttpSession session =request.getSession();
		
		session.setAttribute("msg",msg);
		
		String contextPath = request.getContextPath();
	    response.sendRedirect(response.encodeRedirectUrl(contextPath+"/deposit-form.jsp"));
		
		
	}
	
	private void transfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sourceAcId = Integer.parseInt(request.getParameter("sourceAcId"));
		int targetAcId = Integer.parseInt(request.getParameter("targetAcId"));
		
		HttpSession session =request.getSession();
		
		String contextPath = request.getContextPath();
		
		if(sourceAcId==targetAcId) {
			
			session.setAttribute("msg","Failure: Source account Id can't be equal to target Account Id !");
			RequestDispatcher rd = request.getRequestDispatcher("/transfer-form.jsp");
			rd.forward(request,response);
			
		}
		double tAmount = Double.parseDouble(request.getParameter("transferAmount"));
		
		String msg = BankingDbUtil.transfer(sourceAcId,targetAcId,tAmount);
		
		
		session.setAttribute("msg",msg);
		
	    response.sendRedirect(response.encodeRedirectUrl(contextPath+"/transfer-form.jsp"));
		
	}
	
	private void printStatement(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException, ServletException {
		
		HttpSession session = request.getSession();
		
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		
		Date startDate = new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("startDate"));
		
		Date endDate = new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("endDate"));
		
		Account account = BankingDbUtil.getAccount(accountId);
		
		Date curDate = new Date();
		
		if(startDate.equals(endDate)||curDate.before(startDate)||curDate.before(endDate)||endDate.before(startDate)) {
			session.setAttribute("msg", "Failure : Invalid Date !!");
			String contextPath = request.getContextPath();
		    response.sendRedirect(response.encodeRedirectUrl(contextPath+"/print-statements-form.jsp"));
		}
		else if(account==null) {
			session.setAttribute("msg", "Failure : Invalid Account Id !!");
			String contextPath = request.getContextPath();
		    response.sendRedirect(response.encodeRedirectUrl(contextPath+"/print-statements-form.jsp"));
		}
		else {
			List<TransStatement> statements = BankingDbUtil.getStatements(accountId, startDate, endDate);
			
			request.setAttribute("accountId",accountId);
			request.setAttribute("curBal",account.getBalance());
			Customer customer = BankingDbUtil.getCustomer(account.getCustomerId());
			String name = customer.getName();
			request.setAttribute("name",name);
			request.setAttribute("Statement_List", statements);
			
			RequestDispatcher rd = request.getRequestDispatcher("/print-statements.jsp");
			rd.forward(request,response);
		}
		
	}

}
