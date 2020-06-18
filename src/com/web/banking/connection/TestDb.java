package com.web.banking.connection;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TestDb {
	public static void main(String args[]) throws ParseException {
		
		Calendar calendar = Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		
		System.out.println(date);
		
		try {
			Connection con = DbConnection.getConnection();
			
			String sql = "INSERT INTO STATEMENT(account_id,date,amount,remark) VALUES(?,?,?,?)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, 1);
			stmt.setDate(2, new java.sql.Date(date.getTime()));
			stmt.setDouble(3, 1000);
			stmt.setString(4,"Credit:-Deposit 70000");
			
			stmt.execute();
			
			System.out.println("Successfull !");
			
			con.close();
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
