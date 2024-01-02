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

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteEmployeeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		int id = Integer.parseInt(request.getParameter("eid"));
		
		try {
			int deleteEmp = EmployeeDao.deleteEmployee(id);
			
			if (deleteEmp > 0) {
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