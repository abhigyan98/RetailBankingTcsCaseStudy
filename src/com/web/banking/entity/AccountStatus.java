package com.web.banking.entity;

import java.util.Date;

public class AccountStatus {
	
	private int id;
	private Date date;
	private int accountId;
	private String operation;
	
	public AccountStatus(int id, Date date, int accountId, String operation) {
		super();
		this.id = id;
		this.date = date;
		this.accountId = accountId;
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

	public int getaccountId() {
		return accountId;
	}

	public void setaccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	@Override
	public String toString() {
		return "accountStatus [id=" + id + ", date=" + date + ", accountId=" + accountId + ", operation=" + operation
				+ "]";
	}
	
	

}
