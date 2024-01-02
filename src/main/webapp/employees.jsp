<%@page import="com.techbeee.dao.EmployeeDao"%>
<%@page import="com.techbeee.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management System - All Employees</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<div class="header">
		<h1>Employee Management System</h1>
	</div>
	<div class="container w-75">
		<div class="header-container">
		<h3>ALL EMPLOYEES</h3>
		<a class="btn-add" href="employee-form.jsp">Add Employee</a>
		</div>
		<table class="table">
			<tr>
				<th>Employee Id</th>
				<th>Employee Name</th>
				<th>Employee's Email</th>
				<th>Designation</th>
				<th>Salary</th>
				<th>Actions</th>
			</tr>
			<%
				List<Employee> emps = EmployeeDao.getAllEmployees();
			
				for(Employee emp: emps) {		
				int eid = emp.getEmployeeId();
				String name = emp.getFirstName() + " "+ emp.getLastName();
				String email = emp.getEmail();
				String designation = emp.getDesignation();
				double salary = emp.getSalary();
			%>
			<tr>
				<td><%= eid %></td>
				<td><%= name %></td>
				<td><%= email %></td>
				<td><%= designation %></td>
				<td><%= salary %></td>
				<td>
					<a class="btn-update" href="update-employee.jsp?eid=<%= eid%>">Update</a> &nbsp; &nbsp;
					<a class="btn-delete" href="delete.jsp?eid=<%= eid%>">Delete</a>
				</td>
			</tr>
			<%
				}
			%>
			
		</table>
	</div>
</body>
</html>