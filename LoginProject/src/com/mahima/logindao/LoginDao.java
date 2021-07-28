package com.mahima.logindao;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.mahima.loginbean.Login;


public class LoginDao {
	 public boolean validate(Login loginBean) throws ClassNotFoundException
	 {
	        boolean status = false;

	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
		PreparedStatement preparedStatement = con.prepareStatement("select * from user1 where name = ? and password = ? ");
		

	
        preparedStatement.setString(1, loginBean.getUserName());
        preparedStatement.setString(2, loginBean.getPassword());

        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            System.out.println("SqlException");
        }
        return status;
    
	}

	 public boolean validateAdmin(Login loginBean) throws ClassNotFoundException
	 {
	        boolean status = false;

	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
		PreparedStatement preparedStatement =con.prepareStatement("select * from admin where name = ? and password = ? ");
		

	
        preparedStatement.setString(1, loginBean.getUserName());
        preparedStatement.setString(2, loginBean.getPassword());

        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            System.out.println("SqlException");
        }
        return status;
    
	}
	

	
        

}
