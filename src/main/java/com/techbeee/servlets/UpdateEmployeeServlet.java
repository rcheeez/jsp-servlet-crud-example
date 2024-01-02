package com.techbeee.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbeee.dao.EmployeeDao;
import com.techbeee.model.Employee;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateEmployeeServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("eid"));
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String designation = request.getParameter("designation");
		double salary = Double.parseDouble(request.getParameter("salary"));
		
		Employee employee = new Employee(firstname, lastname, email, designation, salary);
		
		try {
			int updatedEmp = EmployeeDao.updateEmployee(employee, id);
			
			if (updatedEmp > 0) {
				out.println("<script> alert('Employee Updated Successfully!'); </script>");
				RequestDispatcher rd = request.getRequestDispatcher("employees.jsp");
				rd.include(request, response);
			} else {
				out.println("<h1 align='center' style= 'color:'red''>Something went wrong!</h1>");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
	}

}
