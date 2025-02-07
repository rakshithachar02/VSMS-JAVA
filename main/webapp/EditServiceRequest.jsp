<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Service Request</title>
		<!-- Bootstrap CSS -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
    	<style>
    		body {
    			background: black;
    		}
        	.container {
            	max-width: 1000px;
            	margin-top: 40px;
            	background: #fff;
            	padding: 20px;
            	border-radius: 10px;
            	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.6);
        	}
        	.form-label {
            	font-weight: 500;
        	}
        	
        	/* Initially hide the pickup address field */
        	#pickupAddressContainer {
            	display: none;
        	}
    	</style>
	</head>
	<body>
	<%try {
    	Connection con=null;
    	Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsms", "root", "tiger");
        ResultSet rs;
    %>
    <% 
		int srid = Integer.parseInt(request.getParameter("srid"));
    	Vehicle v = new Vehicle(session);
        ServiceRequest sr = v.getServiceRequestInfo(srid);%>
        
	<div class="container">
    	<h3 class="mb-2">Update Service Request</h3>
    	<hr>
    
    	<form action="register?srid=<%=sr.getId()%>" method="POST">
        	<div class="row g-2">
            	<div class="col-md-6">
                	<label for="category" class="form-label">Vehicle Type</label>
                	<select id="category" name="category" class="form-select">
                    <% 
                        rs = con.createStatement().executeQuery("select id, category from category_list where status=1;");
                    	while (rs.next()) {%>
                        	<option value="<%=rs.getString("category")%>"><%=rs.getString("category") %></option>	
                    <% }%>
                	</select>
            	</div>
            	<div class="col-md-6">
                	<label for="vehicleName" class="form-label">Vehicle Name</label>
                	<input type="text" id="vehicleName" name="vehicleName" class="form-control" value="<%=sr.getvName()%>"required>
            	</div>
            	<div class="col-md-6">
                	<label for="fullName" class="form-label">Owner Fullname</label>
                	<input type="text" id="fullName" name="fullName" class="form-control" value="<%=sr.getoName()%>" required>
            	</div>
            	<div class="col-md-6">
                	<label for="regNo" class="form-label">Vehicle Reg No</label>
                	<input type="text" id="regNo" name="regNo" class="form-control" value="<%=sr.getRegNo()%>" pattern="[A-Z]{2}-[0-9]{2}-[A-Z]{2}-[0-9]{4}" title="Ex: KA-09-HK-5432" required>
            	</div>
            	<div class="col-md-6">
                	<label for="contact" class="form-label">Owner Contact #</label>
                	<input type="text" id="contact" name="contact" class="form-control" value="<%=sr.getContact()%>" pattern="[6-9]{1}[0-9]{9}" title="Exact 10-digit starts with (6-9)" required>
            	</div>
            	<div class="col-md-6">
                	<label for="model" class="form-label">Vehicle Model</label>
                	<input type="text" id="model" name="model" class="form-control" value="<%=sr.getModel()%>" required>
            	</div>
            	<div class="col-md-6">
                	<label for="email" class="form-label">Owner Email</label>
                	<input type="email" id="email" name="email" class="form-control" value="<%=sr.getEmail()%>" pattern="[a-z0-9._%+\-]+@gmail.com$" title="ends with @gmail.com" required>
            	</div>
            	<div class="col-md-6">
                	<label for="service" class="form-label">Services</label>
                 	<select id="service" name="service[]" class="form-select" multiple>
                    <% 
                        rs = con.createStatement().executeQuery("select id, service from service_list where status=1;");
                        while (rs.next()) {%>
                        	<option value="<%=rs.getString("service") %>"><%=rs.getString("service") %></option>	
                    <% }%>
                    </select>
            	</div>
            	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    			<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    			<script>
        			$(document).ready(function() {
            			// Enable Select2 multi-select with tagging
            			$('#service').select2({
                			placeholder: "Select services",
                			allowClear: true
            			});
        			});
    			</script>
            	<div class="col-md-6">
                	<label for="address" class="form-label">Address</label>
                	<textarea id="address" name="address" class="form-control" required><%=sr.getAddress()%></textarea>
            	</div>
            	<div class="col-md-6">
                	<label for="requestType" class="form-label">Request Type</label>
                	<select id="requestType" name="requestType" class="form-select" onchange="togglePickupAddress()">
                    	<option value="Drop Off">Drop Off</option>
                    	<option value="Pickup">Pickup</option>
                	</select>
            	</div>
            	<div class="col-md-6">
                                
                </div>
            	<div class="col-md-6" id="pickupAddressContainer">
                	<label for="pickAddress" class="form-label">Pick up Address</label>
                	<textarea id="pickAddress" name="pickAddress" class="form-control" ><%=sr.getpAddress()%></textarea>
            	</div>
        	</div>
        	<hr>
        	<div class="row g-2">
            	<div class="col-md-6">
                	<label for="mechanic" class="form-label">Assigned To</label>
                	<select id="mechanic" name="mechanic" class="form-select">
                    <% 
                        rs = con.createStatement().executeQuery("select id, name from mechanic_list where status=1;");
                        while (rs.next()) {%>
                        	<option value="<%=rs.getString("name") %>"><%=rs.getString("name") %></option>	
                    <% }%>
                	</select>
            	</div>
            	<div class="col-md-6">
                	<label for="status" class="form-label">Status</label>
                	<select id="status" name="status" class="form-select">
                   		<option value="1">Confirmed</option>
                    	<option value="2">Pending</option>
                    	<option value="0">Cancelled</option>
                	</select>
            	</div>
        	</div>
        	
        	<div class="d-flex justify-content-end mt-3">
            	<button type="submit" class="btn btn-success" name="editServiceRequest" value="editServiceRequest">Save Request</button>
            	<a href="ServiceRequests.jsp" class="btn btn-secondary  ms-2" >Cancel</a>
        	</div>
    	</form>
	</div>

	<!-- JavaScript to Show/Hide Pickup Address Field -->
	<script>
    	function togglePickupAddress() {
        	var requestType = document.getElementById("requestType").value;
        	var pickupAddressContainer = document.getElementById("pickupAddressContainer");

        	if (requestType === "Pickup") {
            	pickupAddressContainer.style.display = "block";  // Show field
        	} else {
            	pickupAddressContainer.style.display = "none";   // Hide field
        	}
    	}

    	// Ensure correct visibility on page load
    	window.onload = togglePickupAddress;
	</script>
    <%}
     catch (Exception e) {
        e.printStackTrace();
    } %>
    
    <!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>