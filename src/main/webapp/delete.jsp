<%@page import="com.techbeee.dao.EmployeeDao"%>
<%@page import="com.techbeee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management System</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<div class="header">
		<h1>Employee Management System</h1>
	</div>
	
	<%
		int id = Integer.parseInt(request.getParameter("eid"));
		Employee employee = EmployeeDao.getEmployeeById(id);
	%>
	
	<div class="container w-90">
		<h3 style="text-align: center; padding: 16px 0;">ARE YOU SURE YOU WANT TO DELETE EMPLOYEE PERMANENTLY?</h3>
		<form action="DeleteEmployeeServlet" method="get">
			<table class="table">
			<tr>
				<td>Employee Id</td>
				<td>
				<%= employee.getEmployeeId() %>
				<input type="hidden" name="eid" value="<%= employee.getEmployeeId() %>"/>
				</td>
			</tr>
			<tr>
				<td>Employee Name</td>
				<td><%= employee.getFirstName() + " "+ employee.getLastName()%></td>
			</tr>
			<tr>
				<td>Employee's Email</td>
				<td><%= employee.getEmail() %></td>
			</tr>
			<tr>
				<td>Designation</td>
				<td><%= employee.getDesignation()%></td>
			</tr>
			<tr>
				<td>Salary</td>
				<td><%= employee.getSalary()%></td>
			</tr>
			<tr>
				<td>
					<input class="btn-submit" type="submit" value="DELETE PERMANENTLY"/>
				</td>
				<td>
					<a class="btn-delete" href="employees.jsp">CANCEL</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>