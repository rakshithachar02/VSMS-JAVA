<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>View Service Request</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    	<style>
    		body {
    			background: black;
    		}
        	.container {
            	max-width: 750px;
            	margin-top: 40px;
            	background: #fff;
            	padding: 10px 15px 10px 15px;
            	border-radius: 10px;
            	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.6);
        	}
        	.container .row .col {
        		margin: 0;
        		padding: 0 15px 6px 15px; 
        	}
        	.container .row {
        		padding: 10px;
        	}
        	p {
        		margin: 0;
        		margin-left: 10px;
        	}
        	
        	h6 {
        		margin: 0;
        	}
        	hr {
        		margin-top: 0;
        	 	margin-botom: 20px;
        	}
        	
    	</style>
    	
	</head>
	<body>
		<% 
		int srid = Integer.parseInt(request.getParameter("srid"));
    	Vehicle v = new Vehicle(session);
        ServiceRequest sr = v.getServiceRequestInfo(srid);%>
        
		<div class="container">
    		<h5>Service Request Details</h5>
    		<hr>
    		<div class="row g-3">
            	<div class="col-md-6 col">
                	<h6>Vehicle Type</h6>
               		<p><%=sr.getCategory()%></p>
            	</div>
           		<div class="col-md-6 col">
               		<h6>Vehicle Name</h6>
               		<p><%=sr.getvName()%></p>
           		</div>
            	<div class="col-md-6 col">
               		<h6>Owner Name</h6>
                	<p><%=sr.getoName()%></p>
            	</div>
            	<div class="col-md-6 col">
                	<h6>Vehicle Registration Number</h6>
                	<p><%=sr.getRegNo()%></p>
            	</div>
            	<div class="col-md-6 col">
                	<h6>Owner Contact</h6>
                	<p><%=sr.getContact()%></p>
            	</div>
            	<div class="col-md-6 col">
                	<h6>Vehicle Model</h6>
                	<p><%=sr.getModel()%></p>
            	</div>
            	<div class="col-md-6 col">
               		<h6>Owner Email</h6>
                	<p><%=sr.getEmail()%></p>
            	</div>
            	<div class="col-md-6 col">
               		<h6>Services</h6>
                	<p><%=sr.getService()%></p>
            	</div>
            	<div class="col-md-6 col">
               		<h6>Owner Address</h6>
               		<p><%=sr.getAddress()%></p>
           		</div>
           		<div class="col-md-6 col">
               		<h6>Request Type</h6>
               		<p><%=sr.getrType() %></p>
           		</div>
            	<div class="col-md-6 col">
                	<h6>Pickup Address</h6>
                	<p><%=sr.getpAddress()%></p>
            	</div>
        	</div>
        	
        	<div class="row g-3">
            	<div class="col-md-6 col">
               		<h6>Assigned To</h6>
               		<p><%=sr.getMechanic()%></p>
            	</div>
           		<div class="col-md-6 col">
               		<h6>Status</h6>
               		<% if(sr.getStatus() == 1) { %>
                    	<p class="btn btn-success" style="font-size: 12px; font-weight: 700; padding: 0 5px 1px 5px">Confirmed</p>
                    <%}else if(sr.getStatus() == 0){ %>
                       	<p class="btn btn-danger" style="font-size: 12px; font-weight: 700; padding: 0 5px 1px 5px">Cancelled</p>
                   	<%}else { %>
                       	<p class="btn btn-warning" style="font-size: 12px; font-weight: 700; padding: 0 5px 1px 5px">Pending</p>
                   	<%}%>
                </div>
        	</div>
        	
        	<div class="d-flex justify-content-end">
            	<a href="ServiceRequests.jsp" class="btn btn-secondary" >Close</a>
        	</div>
		</div>
	</body>
</html>