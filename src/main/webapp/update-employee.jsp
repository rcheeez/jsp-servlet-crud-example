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
		int eid = Integer.parseInt(request.getParameter("eid"));
	
		Employee employee = EmployeeDao.getEmployeeById(eid);
	%>
	
	<div class="container">
		<h3 style="text-align: center; padding: 16px 0;">UPDATE EMPLOYEE</h3>
		<form action="UpdateEmployeeServlet" method="post">
			<table class="table">
				<tr>
					<td><b>Enter Employee Id: </b></td>
					<td class="form-align">
						<input class="form-control" type="number" value="<%= employee.getEmployeeId() %>" name="eid" readonly/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Your First Name: </b></td>
					<td class="form-align">
						<input class="form-control" type="text" name="firstname" value="<%= employee.getFirstName() %>" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Your Last Name: </b></td>
					<td class="form-align">
						<input class="form-control" type="text" name="lastname" value="<%= employee.getLastName()%>" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Your Email ID: </b></td>
					<td class="form-align">
						<input class="form-control" type="email" name="email" value="<%= employee.getEmail() %>" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Designation: </b></td>
					<td class="form-align">
						<input class="form-control" type="text" name="designation" value="<%= employee.getDesignation() %>" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Employee's Salary: </b></td>
					<td class="form-align">
						<input class="form-control" type="number" name="salary" value="<%= employee.getSalary() %>" required/>
					</td>
				</tr>
				<tr>
					<td class="form-align" colspan="2">
						<input class="btn-submit" type="submit" value="UPDATE"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>