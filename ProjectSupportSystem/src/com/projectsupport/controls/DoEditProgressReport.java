package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectsupport.models.ProgressReport;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;

/**
 * Servlet implementation class DoEditProgressReport
 */
@WebServlet("/DoEditProgressReport")
public class DoEditProgressReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoEditProgressReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		if(currentUser == null){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		int studentId = Integer.parseInt(currentUser.getUserName());
		String workCarried = request.getParameter("workCarried");
		String problems = request.getParameter("problems");
		String workPlannedButNotDone = request.getParameter("workPlannedButNotDone");
		String workPlanned = request.getParameter("workPlanned");
		
		ProgressReport newReport = new ProgressReport();
		newReport.setStudentId(studentId);
		newReport.setWorkCarried(workCarried);
		newReport.setProblems(problems);
		newReport.setWorkPlannedButNotDone(workPlannedButNotDone);
		newReport.setWorkPlanned(workPlanned);
		
		String errorString = null;
		if(errorString == null){
			try {
				ProgressReportServices.editProgressReport(conn, newReport);
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
		request.setAttribute("errorString", errorString);
	    request.setAttribute("newReport", newReport);
	    if (errorString != null) {
	    	RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/EditProgressReport?success=0");
	        dispatcher.forward(request, response);
	       }
	    else {
	    		//out.println("<script>  alert('Student inserted Sucessfully');  </script>");
	           response.sendRedirect(request.getContextPath() + "/EditProgressReport?success=1");
	           
	    	}
	}

}