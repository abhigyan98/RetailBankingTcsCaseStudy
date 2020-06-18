package com.web.banking.entity;

import java.util.Date;

public class CustomerStatus {
	
	private int id;
	private Date date;
	private int customerId;
	private String operation;
	
	public CustomerStatus(int id, Date date, int customerId, String operation) {
		super();
		this.id = id;
		this.date = date;
		this.customerId = customerId;
		this.operation = operation;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	@Override
	public String toString() {
		return "CustomerStatus [id=" + id + ", date=" + date + ", customerId=" + customerId + ", operation=" + operation
				+ "]";
	}
	
	

}
