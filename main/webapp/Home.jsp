<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="com.model.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vehicle Service Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .main-content {
            flex: 1;
            background-image: linear-gradient(to right, rgb(45, 71, 86, 1), rgb(46, 86, 109, 1), rgb(45, 71, 86, 1));
            box-shadow: inset 5px 0px 15px rgba(0, 0, 0, 0.5);
            color: white;
        }

        .dashboard-cards .card {
        	border: none;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.6);
            border-radius: 10px;
            
        }

        .dashboard-cards .card .icon-container {
            border-radius: 5px;
            align-items: center;
            background-color: #8591a2;
            
            
            
        }

        .dashboard-cards .card .icon-container i {
            font-size: 40px;
            color: whitesmoke;
        }

        .dashboard-cards .card p {
            margin: 0;
            color: #2b3e50;
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
    <div class="d-flex vh-100">
        <%@include file="AdminSideNav.jsp"%>
        <div class="main-content flex-grow-1">
            <%@include file="AdminHeader.jsp"%>
            <div class="container1 p-4">
                <h1 class="mb-3">Welcome to Vehicle Service Management System</h1>
                <hr>
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 p-3 g-4 dashboard-cards">
                    <div class="col">
    					<div class="card text-center p-3">
        					<div class="d-flex align-items-center gap-3">
            					<div class="icon-container p-3">
                					<i class="fa-solid fa-list fs-1"></i>
            					</div>
            					<div>
                					<p class="fs-5 fw-bold mb-0">Total Category</p>
                				<% 
                        			rs = con.createStatement().executeQuery("select count(*) as count from category_list where status=1;");
                        			if (rs.next()) {%>
                            		<p class="fs-4"><%= rs.getInt("count")%></p>
                            	<% }%>
            					</div>
        					</div>
    					</div>
					</div>
                    <div class="col">
                        <div class="card text-center p-3">
                        	<div class="d-flex align-items-center gap-3">
                            	<div class="icon-container p-3" style="background-color: #14ccf1;">
                                	<i class="fa-solid fa-users-gear"></i>
                            	</div>
                            	<div>
                            		<p class="fs-5 fw-bold">Mechanics</p>
                            	<% 
                        			rs = con.createStatement().executeQuery("select count(*) as count from mechanic_list where status=1;");
                        			if (rs.next()) {%>
                            		<p class="fs-4"><%= rs.getInt("count")%></p>
                            	<% }%>
                        		</div>
                        	</div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-center p-3">
                        	<div class="d-flex align-items-center gap-3">
                            	<div class="icon-container p-3" style="background-color: #2bd417;">
                                	<i class="fa-solid fa-list"></i>
                            	</div>
                            	<div>
                            		<p class="fs-5 fw-bold">Services</p>
                            	<% 
                        			rs = con.createStatement().executeQuery("select count(*) as count from service_list where status=1;");
                        			if (rs.next()) {%>
                            		<p class="fs-4"><%= rs.getInt("count")%></p>
                            	<% }%>
                            	</div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-center p-3">
                        	<div class="d-flex align-items-center gap-3">
                            	<div class="icon-container p-3" style="background-color: #e2d010;">
                                	<i class="fa-solid fa-file-lines"></i>
                            	</div>
                            	<div>
                            		<p class="fs-5 fw-bold">Finished Requests</p>
                            	<% 
                        			rs = con.createStatement().executeQuery("select count(*) as count from service_request where status=1;");
                        			if (rs.next()) {%>
                            		<p class="fs-4"><%= rs.getInt("count")%></p>
                            	<% }%>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<%} catch (Exception e) {
        e.printStackTrace();
    } %>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
