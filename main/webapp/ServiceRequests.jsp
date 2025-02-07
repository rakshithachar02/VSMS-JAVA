<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Service Request</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .main-content {
            flex: 1;
            background-image: linear-gradient(to right, rgb(45, 71, 86, 1), rgb(46, 86, 109, 1), rgb(45, 71, 86, 1));
            box-shadow: inset 5px 0px 15px rgba(0, 0, 0, 0.5);
            color: #c2c5c5;
        }
        .container1 {
            border-top: 3px solid #0c89d4;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.6);
            margin: 20px;
            border-radius: 5px;
        }
       	.container1 .header1 {
       		padding: 10px 20px 10px 30px;
       		border-bottom: 2px solid #386173;
       	}
        .table-responsive .table td {
        	background: none;
        	text-align: center;
        	border: 2px solid #7d8e92;
        	color: whitesmoke;
        }
        .table-responsive .table th {
        	background: rgb(48, 75, 86, 1);
        	text-align: center;
        	border: 2px solid #7d8e92;
        	color: whitesmoke;
        }
        .table-responsive p span {
        	border: 1px solid #7d8e92;
        	font-size: 12px;
        	padding: 4px 20px 5px 5px;
        	margin-right: 5px;
        	border-radius: 4px;
        }
        .table-responsive div input {
        	background: none;
        	border: 1px solid #7d8e92;
        	border-radius: 4px;
        	padding: 2px 0 4px 10px;
        	color: #cbd0d1;
        	font-size: 14px;
        }
        .table-responsive .footer {
        	border: 1px solid #7d8e92;
        	padding: 8px 15px 0px 15px; 
        	border-radius: 4px;
        	color: grey;
        }
        .table-responsive .footer span {
        	padding: 9px 12px 8px 12px;
        	margin: 0 10px 0 10px;
        	color: whitesmoke;
        }
        
    </style>
</head>
<body>
    <div class="d-flex">
        <%@ include file="AdminSideNav.jsp" %>
        <div class="main-content">
            <%@ include file="AdminHeader.jsp" %>
            <div class="container1">
            	<% if (request.getAttribute("success") != null) { %>   
    			<div class="alert alert-success alert-dismissible fade show position-absolute top-0 end-0 mt-3 me-3" role="alert" style="font-size: 16px; font-weight: bold; padding: 15px;">
        			<i class="fa fa-check me-2" style="color: green; font-size: 24px;"></i>
        			<%= request.getAttribute("success") %>
        		</div>
				<% } %>
				
                <div class="d-flex justify-content-between align-items-center header1">
                    <h3>List of Service Requests</h3>
                    <a href="CreateServiceRequest.jsp" class="btn btn-primary d-flex align-items-center">
                        <i class="fas fa-plus me-2"></i> Create New
                    </a>
                </div>
                <% if (request.getAttribute("status") != null) {%>   
        			<h4 class="text-center bg-danger text-light mb-3 pt-3"><%= request.getAttribute("status")%></h4>
        		<%}%>
        		
                <div class="table-responsive mt-1 p-3">
                	<div class="d-flex justify-content-between">
                		<p>Show <span >10 </span> entries
                		<div>Search: <input type="search" id="serviceRequestSearch" placeholder="owner name"> </div>
                	</div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date Created</th>
                                <th>Client Name</th>
                                <th>Service</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="serviceRequestTable">
                        	<% Vehicle v = new Vehicle(session);
                        	   ArrayList<ServiceRequest> srList = v.getServiceRequest();
                        	   Iterator<ServiceRequest> itr = srList.iterator();
                        	   int num = 0;
							   while (itr.hasNext()) {
							   ServiceRequest sr = itr.next();
							   num++;
						    %>
                            <tr>
                                <td><%= num %></td>
                                <td><%= sr.getDate_created() %></td>
                                <td class="serviceRequest-name"><%= sr.getoName() %></td>
                                <td><%= sr.getService() %></td>
                                <td>
                                <% if(sr.getStatus() == 1) { %>
                                    <div class="btn btn-success" style="font-size: 12px; font-weight: 700; padding: 0 5px 1px 5px">Confirmed</div>
                                 <%}else if(sr.getStatus() == 0){ %>
                                 	<div class="btn btn-danger" style="font-size: 12px; font-weight: 700; padding: 0 5px 1px 5px">Cancelled</div>
                                 <%}else { %>
                                 	<div class="btn btn-warning" style="font-size: 12px; font-weight: 700; padding: 0 5px 1px 5px">Pending</div>
                                 <%}%>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton<%=sr.getId() %>" data-bs-toggle="dropdown" aria-expanded="false" style="background: #31424e; color: whitesmoke; font-size: 14px;">Action</button>
                                        <ul class="dropdown-menu m-0" aria-labelledby="dropdownMenuButton<%=sr.getId()%>" style="background: #3f455a">
                                            <li><a class="dropdown-item border-bottom border-secondary pb-2" href="ViewServiceRequest.jsp?srid=<%=sr.getId() %>"><i class="fa-solid fa-eye text-primary"></i>View</a></li>
                                            <li><a class="dropdown-item border-bottom border-secondary pb-2" href="EditServiceRequest.jsp?srid=<%=sr.getId() %>"><i class="fa-solid fa-pen-to-square text-primary"></i>Edit</a></li>
                                            <li><a class="dropdown-item pt-2" onclick="confirmDelete('<%=sr.getId()%>')" ><i class="fa-solid fa-trash text-danger"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <% 
                            }%>
                            <tr id="noResultRow" style="display: none;">
                				<td colspan="6" class="text-center text-light">No results found</td>
            				</tr>
                            
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-between ">
                    	<p>Showing 1 to <%=num %> of <%=num %> entries</p>
                    	<div class="footer">Previous <span class="bg-primary">1</span> Next</div>
                    </div>
                </div>
                <script>
					document.getElementById("serviceRequestSearch").addEventListener("keyup", function() {
    					let filter = this.value.toLowerCase();
    					let rows = document.querySelectorAll("#serviceRequestTable tr");
    					let found = false;

    					rows.forEach(row => {
        					let ownerName = row.querySelector(".serviceRequest-name");
        					if (ownerName) {
            					let text = ownerName.textContent.toLowerCase();
            					if (text.includes(filter)) {
                					row.style.display = "";
                					found = true;
            					} else {
               						row.style.display = "none";
           						}
        					}
    					});
    					
    					// Show "No results found" row if nothing matches
    					document.getElementById("noResultRow").style.display = found ? "none" : "";
					});
				</script>
            </div>
        </div>
    </div>
    
    <script>
    	// Auto-dismiss the alert after 3 seconds
    	setTimeout(function() {
        	let alert = document.querySelector('.alert');
        	if (alert) {
            	alert.classList.add('fade');
            	setTimeout(() => alert.remove(), 500); // Remove after fade out
        	}
    	}, 3000);
	</script>
	
	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    	<div class="modal-dialog modal-dialog-centered">
        	<div class="modal-content" style="background: #3d545e; color: whitesmoke;">
            	<div class="modal-header">
                	<h5 class="modal-title" id="deleteModalLabel">Confirmation</h5>
            	</div>
            	<div class="modal-body pt-3 pb-0">
                	<p>⚠️ Are you sure to delete this service request permanently?</p>
            	</div>
            	<div class="modal-footer d-flex justify-content-end">
            		<a id="confirmDelete" class="btn btn-primary">Continue</a>
                	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            	</div>
        	</div>
    	</div>
	</div>
	
	<script>
    function confirmDelete(serviceRequestId) {
        let deleteUrl = "delete?srid=" + serviceRequestId; // URL to delete the mechanic
        document.getElementById("confirmDelete").setAttribute("href", deleteUrl);
        let deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>