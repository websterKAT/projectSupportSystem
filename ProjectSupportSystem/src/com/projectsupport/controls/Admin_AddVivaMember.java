package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class Admin_AddVivaMember
 */
@WebServlet("/AddVivaMember")
public class Admin_AddVivaMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_AddVivaMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		if(currentUser == null){
		    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
		       dispatcher.forward(request, response);
		       return;
		  }
		RequestDispatcher dispather = this.getServletContext().getRequestDispatcher("/admin/viva_member.jsp");
		dispather.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
