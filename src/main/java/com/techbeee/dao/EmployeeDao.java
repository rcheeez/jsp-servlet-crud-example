package com.techbeee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.techbeee.model.Employee;
import com.techbeee.utilites.DBConnect;

public class EmployeeDao {

	public static List<Employee> getAllEmployees() throws SQLException, ClassNotFoundException {
		List<Employee> employees = new ArrayList<Employee>();
		
		Connection conn = DBConnect.getConnection();
		
		Statement stmt = conn.createStatement();
		
		String query = "select * from employee";
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			int id = rs.getInt(1);
			String firstname = rs.getString(2);
			String lastname = rs.getString(3);
			String email = rs.getString(4);
			String designation = rs.getString(5);
			double salary = rs.getDouble(6);
			employees.add(new Employee(id, firstname, lastname, email, designation, salary));
		}
		return employees;
	}
	
	
	public static Employee getEmployeeById(int id) throws ClassNotFoundException, SQLException {
		Employee employee = null;
		Connection conn = DBConnect.getConnection();
		
		String query = "select * from employee where employee_id = ?";
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setInt(1, id);
		
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			int eid = rs.getInt(1);
			String firstname = rs.getString(2);
			String lastname = rs.getString(3);
			String email = rs.getString(4);
			String designation = rs.getString(5);
			double salary = rs.getDouble(6);
			employee = new Employee(eid, firstname, lastname, email, designation, salary);
		}
		return employee;
	}
	
	public static int createEmployee(Employee employee) throws ClassNotFoundException, SQLException {
		Connection conn = DBConnect.getConnection();
		
		String query = "insert into employee (employee_id, first_name, last_name, email, designation, salary) values(?,?,?,?,?,?)";
		
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setInt(1, employee.getEmployeeId());
		pst.setString(2, employee.getFirstName());
		pst.setString(3, employee.getLastName());
		pst.setString(4, employee.getEmail());
		pst.setString(5, employee.getDesignation());
		pst.setDouble(6, employee.getSalary());
		
		int saveEmp = pst.executeUpdate();
		return saveEmp;
	}
	
	public static int updateEmployee(Employee employee, int id) throws ClassNotFoundException, SQLException {
		Connection conn = DBConnect.getConnection();
		
		String query = "update employee set first_name = ?, last_name = ?, email = ?, designation = ?, salary = ? where employee_id = ?";
		
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setString(1, employee.getFirstName());
		pst.setString(2, employee.getLastName());
		pst.setString(3, employee.getEmail());
		pst.setString(4, employee.getDesignation());
		pst.setDouble(5, employee.getSalary());
		pst.setInt(6, id);
		
		int updateEmp = pst.executeUpdate();
		return updateEmp;
	}
	
	public static int deleteEmployee(int id) throws ClassNotFoundException, SQLException {
		Connection conn = DBConnect.getConnection();
		
		String query = "delete from employee where employee_id = ?";
		
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setInt(1, id);
		
		int deleteEmp = pst.executeUpdate();
		return deleteEmp;
	}
}
