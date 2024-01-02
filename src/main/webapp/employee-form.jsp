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
	<div class="container">
		<h3 style="text-align: center; padding: 16px 0;">ADD EMPLOYEE</h3>
		<form action="AddEmployeeServlet" method="post">
			<table class="table">
				<tr>
					<td><b>Enter Employee Id: </b></td>
					<td class="form-align">
						<input class="form-control" type="number" name="eid" id="id" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Your First Name: </b></td>
					<td class="form-align">
						<input class="form-control" type="text" name="firstname" id="fname" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Your Last Name: </b></td>
					<td class="form-align">
						<input class="form-control" type="text" name="lastname" id="lname" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Your Email ID: </b></td>
					<td class="form-align">
						<input class="form-control" type="email" name="email" id="eml" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Designation: </b></td>
					<td class="form-align">
						<input class="form-control" type="text" name="designation" id="dsgn" required/>
					</td>
				</tr>
				<tr>
					<td><b>Enter Employee's Salary: </b></td>
					<td class="form-align">
						<input class="form-control" type="number" name="salary" id="sal" required/>
					</td>
				</tr>
				<tr>
					<td class="form-align" colspan="2">
						<input class="btn-submit" type="submit" value="REGISTER"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>