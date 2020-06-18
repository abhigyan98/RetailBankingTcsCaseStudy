package com.web.banking.entity;

public class Customer {
	
	private int id;
	private int SSNId;
	private String name;
	private int age;
	private String address;
	private String state;
	private String city;
	
	public Customer(int id, int sSNId, String name, int age, String address, String state, String city) {
		super();
		this.id = id;
		SSNId = sSNId;
		this.name = name;
		this.age = age;
		this.address = address;
		this.state = state;
		this.city = city;
	}

	public Customer(int sSNId, String name, int age, String address, String state, String city) {
		super();
		SSNId = sSNId;
		this.name = name;
		this.age = age;
		this.address = address;
		this.state = state;
		this.city = city;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSSNId() {
		return SSNId;
	}

	public void setSSNId(int sSNId) {
		SSNId = sSNId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", SSNId=" + SSNId + ", name=" + name + ", age=" + age + ", address=" + address
				+ ", state=" + state + ", city=" + city + "]";
	}
	
	
	

}
