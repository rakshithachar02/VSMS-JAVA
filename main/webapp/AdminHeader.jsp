<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header {
            border-bottom: 1px solid #e9ecef;
        }
        .header p {
            font-size: 14px;
            color: #c2c5c5;
        }
        .user-profile {
        	border: none;
            font-size: 14px;
            font-weight: bold;
            padding: 5px 15px;
            border-radius: 30px;
            background-color: #f8f9fa;
            color: #212529;
        }
        .dropdown a i{
			margin-right: 8px
        }
        .dropdown a {
        	color: whitesmoke;
       
        }
        .dropdown a:hover {
            background-color: #9397b1;
            color: #0773e4;
        }
    </style>
</head>
<body>
    <header class="header d-flex justify-content-between align-items-center p-3">
        <!-- Left Section -->
        <p class="mb-0">
            Vehicle Service Management System - Admin: 
            <%= session.getAttribute("uname") %>
        </p>
		
		
        <!-- Right Section -->
        <div class="dropdown ">
        	<button class="dropdown-toggle user-profile"  data-bs-toggle="dropdown" aria-expanded="false" >Administrator Admin</button>
            <ul class="dropdown-menu m-0"  style="background: #3f455a">
            	<li><a class="dropdown-item border-bottom border-secondary pb-2" href="#"><i class="fa-solid fa-user"></i>My Account</a></li>
            	<li><a class="dropdown-item pt-2" href="register?logout=yes"><i class="fa-solid fa-right-from-bracket"></i>Logout</a></li>
            </ul>
            
        </div>
    </header>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
