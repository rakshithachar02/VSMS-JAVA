package com.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.model.Vehicle;

@WebServlet("/register")
public class register extends HttpServlet{
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Vehicle v = new Vehicle(session);

		 try {
			 if(request.getParameter("signup") != null) { 

	                String name = request.getParameter("name");
	                String email = request.getParameter("email");
	                String phone = request.getParameter("phone");
	                String pw = request.getParameter("pw");
	                String cp = request.getParameter("cp");
	                if(pw.equals(cp)) {
	                    String status = v.Registration(name, email, phone, pw);
	                    
	                    if(status.equals("existed")) {
	                        request.setAttribute("status", "Already existed record");
	                        RequestDispatcher rd1 = request.getRequestDispatcher("Signup.jsp"); 
	                        rd1.forward(request, response);

	                    } else if(status.equals("success")) {
	                        request.setAttribute("success", "Successfully registered");
	                        RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
	                        rd1.forward(request, response);

	                    } else if(status.equals("failure")) {
	                        request.setAttribute("status", "Registration failed");
	                        RequestDispatcher rd1 = request.getRequestDispatcher("Signup.jsp");
	                        rd1.forward(request, response);

	                    }  	                    	                
	                }
	         }
			 
			 else if(request.getParameter("login") != null) {
				 String email = request.getParameter("email");
	             String pass = request.getParameter("pw");
	             String status = v.login(email, pass);
	             
	             if (status.equals("success")) {
	            	 RequestDispatcher rd1 = request.getRequestDispatcher("Home.jsp");
	                 rd1.forward(request, response);
	             } else if (status.equals("success1")) {
	            	 RequestDispatcher rd1 = request.getRequestDispatcher("CustomerIndex.jsp");
	                 rd1.forward(request, response);
	             } else if (status.equals("failure")) {
	                 request.setAttribute("status", "Login failed");
	                 RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
	                 rd1.forward(request, response);
	             }
			 }
			 
			else if (request.getParameter("logout") != null) {
				
				session.removeAttribute("uname");
				session.removeAttribute("email");
				session.removeAttribute("id");
				
				RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
				rd1.forward(request, response);
	        } 
			 
			else if(request.getParameter("addMechanic") != null) {
				 String name = request.getParameter("name");
	             String contact = request.getParameter("contact");
	             String email = request.getParameter("email");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.addMechanic(name, contact, email, status1);
	             
	             if(status.equals("existed")) {
                     request.setAttribute("status", "Mechanic already exist!");
                     RequestDispatcher rd1 = request.getRequestDispatcher("MechanicList.jsp"); 
                     rd1.forward(request, response);
                 } else if(status.equals("success")) {
                     request.setAttribute("success", "New Mechanic successfully added.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("MechanicList.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to add new mechanic.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("MechanicList.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("editMechanic") != null) {
				 int mid = Integer.parseInt(request.getParameter("mid"));
				 String name = request.getParameter("name");
	             String contact = request.getParameter("contact");
	             String email = request.getParameter("email");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.updateMechanic(mid, name, contact, email, status1);
	             
	             if(status.equals("success")) {
                     request.setAttribute("success", "Mechanic successfully updated.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("MechanicList.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to update mechanic.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("MechanicList.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("addCategory") != null) {
				 String category = request.getParameter("cname");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.addCategory(category, status1);
	             
	             if(status.equals("existed")) {
                     request.setAttribute("status", "Category already exist!");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CategoryList.jsp"); 
                     rd1.forward(request, response);
                 } else if(status.equals("success")) {
                     request.setAttribute("success", "New Category successfully added.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CategoryList.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to add new category.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CategoryList.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("editCategory") != null) {
				 int cid = Integer.parseInt(request.getParameter("cid"));
				 String category = request.getParameter("cname");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.updateCategory(cid, category, status1);
	             
	             if(status.equals("success")) {
                     request.setAttribute("success", "Category successfully updated.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CategoryList.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to update Category.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CategoryList.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("addService") != null) {
				 String service = request.getParameter("sname");
				 String description = request.getParameter("description");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.addService(service, description, status1);
	             
	             if(status.equals("existed")) {
                     request.setAttribute("status", "Service already exist!");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceList.jsp"); 
                     rd1.forward(request, response);
                 } else if(status.equals("success")) {
                     request.setAttribute("success", "New Service successfully added.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceList.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to add new service.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceList.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("editService") != null) {
				 int sid = Integer.parseInt(request.getParameter("sid"));
				 String service = request.getParameter("sname");
				 String description = request.getParameter("description");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.updateService(sid, service, description, status1);
	             
	             if(status.equals("success")) {
                     request.setAttribute("success", "Service successfully updated.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceList.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to update Service.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceList.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("addServiceRequest") != null) {
				 String category = request.getParameter("category");
				 String vName = request.getParameter("vehicleName");
				 String oName = request.getParameter("fullName");
				 String regNo = request.getParameter("regNo");
				 String contact = request.getParameter("contact");
				 String model = request.getParameter("model");
				 String email = request.getParameter("email");
				 String[] service = request.getParameterValues("service[]");
				 String serviceString = (service != null) ? String.join(", ", service) : "";
				 String address = request.getParameter("address");
				 String rType = request.getParameter("requestType");
				 String pAddress = request.getParameter("pickAddress");
				 String mechanic = request.getParameter("mechanic");
	             String sta = request.getParameter("status");
	             
	             int status1 = Integer.parseInt(sta);
	             String status = v.addServiceRequest(category, vName, oName, regNo, contact, model, email, serviceString, address, rType, pAddress, mechanic, status1);
	             
	             if(status.equals("success")) {
                     request.setAttribute("success", "New Service request successful added.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceRequests.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to add new service request.");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceRequests.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
			 else if(request.getParameter("editServiceRequest") != null) {
				 int srid = Integer.parseInt(request.getParameter("srid"));
				 String category = request.getParameter("category");
				 String vName = request.getParameter("vehicleName");
				 String oName = request.getParameter("fullName");
				 String regNo = request.getParameter("regNo");
				 String contact = request.getParameter("contact");
				 String model = request.getParameter("model");
				 String email = request.getParameter("email");
				 String service[] = request.getParameterValues("service[]");
				 String serviceString = (service != null) ? String.join(", ", service) : "";
				 String address = request.getParameter("address");
				 String rType = request.getParameter("requestType");
				 String pAddress = request.getParameter("pickAddress");
				 String mechanic = request.getParameter("mechanic");
	             String sta = request.getParameter("status");
	             int status1 = Integer.parseInt(sta);
	             String status = v.updateServiceRequest(srid, category, vName, oName, regNo, contact, model, email, serviceString, address, rType, pAddress, mechanic, status1);
	             
	             if(status.equals("success")) {
                     request.setAttribute("success", "Service request successfully updated");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceRequests.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to update service request");
                     RequestDispatcher rd1 = request.getRequestDispatcher("ServiceRequests.jsp");
                     rd1.forward(request, response);
                 }  		
	             
			 }
			 
			 else if(request.getParameter("addCustomerServiceRequest") != null) {
				 String category = request.getParameter("category");
				 String vName = request.getParameter("vehicleName");
				 String oName = request.getParameter("fullName");
				 String regNo = request.getParameter("regNo");
				 String contact = request.getParameter("contact");
				 String model = request.getParameter("model");
				 String email = request.getParameter("email");
				 String[] service = request.getParameterValues("service[]");
				 String serviceString = (service != null) ? String.join(", ", service) : "";
				 String address = request.getParameter("address");
				 String rType = request.getParameter("requestType");
				 String pAddress = request.getParameter("pickAddress");
				 String mechanic = request.getParameter("mechanic");
	             String sta = request.getParameter("status");
	             if(sta == null)
	            	 sta="2";
	             int status1 = Integer.parseInt(sta);
	             String status = v.addServiceRequest(category, vName, oName, regNo, contact, model, email, serviceString, address, rType, pAddress, mechanic, status1);
	             
	             if(status.equals("success")) {
                     request.setAttribute("success", "Service request successfully added");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CustomerIndex.jsp");
                     rd1.forward(request, response);
                 } else if(status.equals("failure")) {
                     request.setAttribute("status", "Failed to add service request");
                     RequestDispatcher rd1 = request.getRequestDispatcher("CustomerIndex.jsp");
                     rd1.forward(request, response);
                 }  	
	             
			 }
			 
		 }catch (Exception e) {
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
