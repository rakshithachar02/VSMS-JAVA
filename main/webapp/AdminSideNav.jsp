<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Side Nav</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
        }
        .sidebar {
            width: 250px;
            min-height: 100vh;
            background-image: linear-gradient(to right, rgb(45, 71, 86, 1), rgb(46, 86, 109, 1), rgb(45, 71, 86, 1));
            border-radius: 15px 0 0 15px;
            color: #c2c5c5;
            display: flex;
            flex-direction: column;
        }
        .sidebar .sidebar-header {
            background-color: #0571e4;
            text-align: center;
            padding: 15px 0;
            color: whitesmoke;
            font-weight: bold;
            border-top-left-radius: 15px;
        }
        .sidebar ul {
            list-style: none;
        }
        .sidebar ul li a {
            text-decoration: none;
            padding: 10px 30px;
            display: block;
            color: #c2c5c5;
            font-size: 15px;
            transition: background 0.3s ease;
        }
        .sidebar ul li a i {
            margin-right: 5px;
            font-size: 20px;
        }
        .sidebar ul li a:hover {
            background-color: #5c636b;
            color: white;
        }
        .sidebar ul li a.active {
        	background-color: #0571e4;
   	 		color: white;
        }
        .sidebar .section-header {
            margin: 10px 0 10px 13px;
            font-size: 16px;
            color: #c2c5c5;
            
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <div class="sidebar">
            <!-- Sidebar Header -->
            <div class="sidebar-header mb-2">
                VSMS - JAVA
            </div>

            <!-- Sidebar Links -->
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a href="Home.jsp" class="nav-link active">
                        <i class="fa-solid fa-gauge"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="MechanicList.jsp" class="nav-link">
                        <i class="fa-solid fa-users-gear"></i> Mechanic List
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ServiceRequests.jsp" class="nav-link">
                        <i class="fa-solid fa-file-lines"></i> Service Requests
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa-solid fa-file"></i> Report
                    </a>
                </li>

                <!-- Section Header -->
                <div class="section-header">Maintenance</div>

                <li class="nav-item">
                    <a href="CategoryList.jsp" class="nav-link">
                        <i class="fa-solid fa-list"></i> Category List
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ServiceList.jsp" class="nav-link">
                        <i class="fa-solid fa-list"></i> Service List
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa-solid fa-users"></i> User List
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fa-solid fa-gears"></i> Settings
                    </a>
                </li>
            </ul>
        </div>
        
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
