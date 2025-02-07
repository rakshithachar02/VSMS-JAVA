package com.controller;

import java.io.IOException;

import com.model.UserVehicle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userRegister")
public class userRegister extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession userSession = request.getSession();
		UserVehicle uv = new UserVehicle(userSession);
		try {
			if(request.getParameter("ulogin") != null) {
				 String email = request.getParameter("email");
	             String pass = request.getParameter("pw");
	             String status = uv.login(email, pass);
	             
	             if (status.equals("success")) {
	            	 RequestDispatcher rd1 = request.getRequestDispatcher("CustomerIndex.jsp");
	                 rd1.forward(request, response);
	             } else if (status.equals("failure")) {
	                 request.setAttribute("status", "Login failed");
	                 RequestDispatcher rd1 = request.getRequestDispatcher("CustomerLogin.jsp");
	                 rd1.forward(request, response);
	             }
			 }
			
			else if (request.getParameter("logout") != null) {
				
				userSession.removeAttribute("cname");
				userSession.removeAttribute("cemail");
				userSession.removeAttribute("cid");
				
				RequestDispatcher rd1 = request.getRequestDispatcher("CustomerIndex.jsp");
				rd1.forward(request, response);
	        } 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
