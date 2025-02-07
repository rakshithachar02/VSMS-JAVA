package com.controller;

import java.io.IOException;

import com.model.Vehicle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")

public class delete extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Vehicle v = new Vehicle(session);
		
		try {
			if(request.getParameter("mid") != null) {
				int mid = Integer.parseInt(request.getParameter("mid"));
				String status = v.deleteMechanic(mid);
				if (status.equals("success")) {
					request.setAttribute("success","Mechanic successfully deleted.");
					request.getRequestDispatcher("MechanicList.jsp").forward(request, response);
		        }else if (status.equals("failure")) {
		        	request.setAttribute("status","Deletion failure.");
		        	//request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
		        	response.sendRedirect("MechanicList.jsp");
		        }
			}
			
			else if(request.getParameter("cid") != null) {
				int cid = Integer.parseInt(request.getParameter("cid"));
				String status = v.deleteCategory(cid);
				if (status.equals("success")) {
					request.setAttribute("success","Category successfully deleted.");
					request.getRequestDispatcher("CategoryList.jsp").forward(request, response);
		        }else if (status.equals("failure")) {
		        	request.setAttribute("status","Deletion failure.");
		        	//request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
		        	response.sendRedirect("CategoryList.jsp");
		        }
			}
			
			else if(request.getParameter("sid") != null) {
				int sid = Integer.parseInt(request.getParameter("sid"));
				String status = v.deleteService(sid);
				if (status.equals("success")) {
					request.setAttribute("success","Service successfully deleted.");
					request.getRequestDispatcher("ServiceList.jsp").forward(request, response);
		        }else if (status.equals("failure")) {
		        	request.setAttribute("status","Deletion failure.");
		        	//request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
		        	response.sendRedirect("ServiceList.jsp");
		        }
			}
			
			else if(request.getParameter("srid") != null) {
				int srid = Integer.parseInt(request.getParameter("srid"));
				String status = v.deleteServiceRequest(srid);
				if (status.equals("success")) {
					request.setAttribute("success","Service request successfully deleted.");
					request.getRequestDispatcher("ServiceRequests.jsp").forward(request, response);
		        }else if (status.equals("failure")) {
		        	request.setAttribute("status","Deletion failure.");
		        	//request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
		        	response.sendRedirect("ServiceRequests.jsp");
		        }
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
