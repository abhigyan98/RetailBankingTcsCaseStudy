package com.web.banking.controller;

import java.io.IOException;
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

@WebServlet("/CustomerManagement")
public class CustomerManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String theCommand = request.getParameter("command");
		
		// if the command is missing, then default to listing Customers
		if (theCommand == null) {
			theCommand = "LIST";
		}
		
		// route to the appropriate method
		switch (theCommand) {
		
		case "LIST":
			listCustomers(request, response);
			break;
		
		case "DETAILS":
			customerDetails(request,response);
			break;
			
		case "LOAD":
			loadCustomer(request, response);
			break;
			
		
		case "DELETE":
			deleteCustomer(request, response);
			break;
			
		default:
			listCustomers(request, response);
		}
	}
   
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String theCommand = request.getParameter("command");
		
		switch (theCommand) {
		
		case "SEARCH":
			searchCustomers(request, response);
			break;
		case "CREATE":
			createCustomer(request, response);
			break;
			
		case "UPDATE":
			updateCustomer(request, response);
			break;
			
		default:
			listCustomers(request, response);
		}
	}

	private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int SSNId = Integer.parseInt(request.getParameter("SSNId"));
		
		String contextPath = request.getContextPath();
		
		HttpSession session = request.getSession();
		
		Customer customer = BankingDbUtil.getCustomerBySSNId(SSNId);
		
		if(customer!=null) {
			request.setAttribute("msg","This SSN ID is already associated with a Customer");
			
			RequestDispatcher rd = request.getRequestDispatcher("/create-customer-form.jsp");
			rd.forward(request, response);
		}
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		
		
		customer = new Customer(SSNId,name,age,address,state,city);
		
		int id = BankingDbUtil.createCustomer(customer);
		
		
		
		session.setAttribute("customerId",id);
		
		response.sendRedirect(response.encodeRedirectUrl(contextPath+"/create-customer-form.jsp"));
		
	}
	
	private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Customer> customers = BankingDbUtil.getCustomers();
		
		request.setAttribute("Customer_List",customers);
		
		RequestDispatcher rd = request.getRequestDispatcher("/list-customer.jsp");
		rd.forward(request, response);
		
	}
	
	private void customerDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		Customer customer = BankingDbUtil.getCustomer(customerId);
		
		request.setAttribute("The_Customer",customer);
		
		RequestDispatcher rd = request.getRequestDispatcher("/customer-details.jsp");
		rd.forward(request, response);
		
	}
	
	private void searchCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		String searchkwd = request.getParameter("searchkwd");
		
		
		List<Customer> customers = BankingDbUtil.searchCustomers(searchkwd);
		
		request.setAttribute("Customer_List",customers);
		
		RequestDispatcher rd = request.getRequestDispatcher("/list-customer.jsp");
		rd.forward(request, response);
	}
	
	private void loadCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		
		Customer customer = BankingDbUtil.getCustomer(customerId);
		
		
		request.setAttribute("The_Customer", customer);
		
		RequestDispatcher rd = request.getRequestDispatcher("/update-customer-form.jsp");
		rd.forward(request, response);
		
	}
	
	private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("customerId"));
		int SSNId = Integer.parseInt(request.getParameter("customerSSNId"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		
		Customer customer = new Customer(id,SSNId,name,age,address,state,city);
		
		BankingDbUtil.updateCustomer(customer);
		
		listCustomers(request,response);
	}

	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		HttpSession session = request.getSession();
		
		List<Account> accounts = BankingDbUtil.getAccounts(customerId);
		
		
		if(accounts.size()==0)
			BankingDbUtil.deleteCustomer(customerId);
		else
			session.setAttribute("msg","Failed");
		
		listCustomers(request,response);
		
	}
}
