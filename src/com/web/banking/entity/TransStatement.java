package com.web.banking.entity;

import java.util.Date;

public class TransStatement {
	private int id;
	private int account_id;
	private Date date;
	private double amount;
	private String remark;
	private double balance;
	
	public TransStatement(int id, int account_id, Date date, double amount, String remark, double balance) {
		super();
		this.id = id;
		this.account_id = account_id;
		this.date = date;
		this.amount = amount;
		this.remark = remark;
		this.balance = balance;
	}

	public TransStatement(int account_id, Date date, double amount, String remark, double balance) {
		super();
		this.account_id = account_id;
		this.date = date;
		this.amount = amount;
		this.remark = remark;
		this.balance = balance;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "TransStatement [id=" + id + ", account_id=" + account_id + ", date=" + date + ", amount=" + amount
				+ ", remark=" + remark + ", balance=" + balance + "]";
	}
	
	
	
	
}