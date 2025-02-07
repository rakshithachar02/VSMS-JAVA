<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>

<!DOCTYPE html>
<html lang="en">
	<head>
  		<meta charset="UTF-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<title>VSMS - PHP</title>
  		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  		<style>
    		body {
      			font-family: cursive;
      			scroll-behavior: smooth;
      
    		}

    		.navbar {
      			position: fixed;
      			top: 0;
      			width: 100%;
      			z-index: 1000;
      			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    		}

    		header {
      			background: linear-gradient(to right, rgb(255, 255, 255, 1), rgb(234, 239, 239, 1), rgb(182, 187, 189, 1), rgb(164, 170, 173, 1), rgb(182, 187, 189, 1), rgb(234, 239, 239, 1), rgb(255, 255, 255, 1));
      			background-position: center;
      			color: #fff;
      			padding: 200px 0 50px 0;
    		}

    		header h1 {
      			font-size: 55px;
      			text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
    		}
			.input-group-text {
				border: none;
        		width: 40px;
    			text-align: center;
    		}
    		.form-control::placeholder {
        		color: #98a0a4;
    		}
    
    		.container .col h3 {
    			border-bottom: 1px solid #daddde;
    			padding: 10px;
    			margin-bottom: 15px;
    		}
    		.card {
      			transition: transform 0.3s, box-shadow 0.3s;
      			border: none;
      			border-left: 4px solid #0c89d4;
    		}
			.card:hover {
      			transform: scale(1.02);
      			box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    		}
    		.card .card-text {
    			font-size: 14px;
    			color: #98a0a4;
    			font-weight: 500;
    		}

    		#about, #contact {
      			padding: 50px 0;
    		}

    		#about {
      			background-color: #ffffff;
      			border-top: 5px solid #0d6efd;
    		}

    		#about h2 {
      			color: #0d6efd;
    		}

    		#contact {
      			background-color: #f1f1f1;
    		}

    		footer {
      			background-color: #0d6efd;
      			color: #fff;
      			padding: 20px 0;
    		}

    		footer a {
      			color: #ffdd57;
      			text-decoration: none;
    		}

    		footer a:hover {
      			text-decoration: underline;
    		}

	    	.btn-lg {
      			padding: 10px 30px;
      			font-size: 1.2rem;
    		}

    		.section-title {
      			font-size: 2rem;
      			font-weight: bold;
      			margin-bottom: 30px;
    		}
  		</style>
	</head>
	<body>
  	<!-- Navbar -->
  	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    	<div class="container">
      		<a class="navbar-brand" href="#">VSMS - JAVA</a>
      		<div class="collapse navbar-collapse" id="navbarNav">
        		<ul class="navbar-nav ms-auto">
          			<li class="nav-item"><a class="nav-link text-white" href="#">Home</a></li>
          			<li class="nav-item"><a class="nav-link text-white" href="#about">About Us</a></li>
          			<li class="nav-item"><a class="nav-link text-white" href="#contact">Contact</a></li>
          			<li class="nav-item"><a class="nav-link text-white" href="UserRegister.jsp">Login</a></li>
          			<li class="nav-item"><a class="nav-link text-white" href="RegisterServlet?logout=yes">Logout</a></li>
        	
        		</ul>
      		</div>
    	</div>
  	</nav>

  	<!-- Header -->
  	<header class="text-center m-0">
    	<div class="container">
      		<h1 class="fw-bold">Vehicle Service Management System</h1>
      		<p class="lead mt-3">We will take care of your vehicle</p>
<%
    String userId = (String) session.getAttribute("id"); // Check if user is logged in
%>

<a href="#" id="serviceRequestBtn" class="btn btn-primary btn-lg">
   Send Service Request
</a>

<style>
    /* CSS for the zoom-in effect */
    .zoom-effect {
        transition: transform 0.3s ease-in-out;
        transform: scale(1.2); /* Zoom in effect */
    }
</style>

<script>
    document.getElementById("serviceRequestBtn").addEventListener("click", function(event) {
        var userId = '<%= userId %>'; // Get user session value from JSP
        if (!userId || userId === "null") { 
            event.preventDefault(); // Prevent navigation

            var loginLink = document.querySelector(".nav-link[href='UserRegister.jsp']");
            if (loginLink) {
                loginLink.classList.add("zoom-effect"); // Add zoom effect
                
                setTimeout(function() {
                    loginLink.classList.remove("zoom-effect"); // Remove effect after 0.3s
                }, 600);
            }
        } else {
            window.location.href = "CustomerCreateServiceRequest.jsp"; // Proceed if logged in
        }
    });
</script>


    	</div>
  	</header>

  	<!-- Main Content -->
  	<%try {
    	Connection con=null;
    	Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsms", "root", "7753");
        ResultSet rs;
        %>
	<div class="container mt-5">
  		<div class="row">
      		<!-- Service Types -->
      		<div class="col-md-4 col">
        		<h3 class="text-center ">We Do Service For</h3>
        		<ul class="list-group">
        		
        		<% 
        			rs = con.createStatement().executeQuery("select id, category from category_list where status=1;");
            		while (rs.next()) {%>
            			<li class="list-group-item"><b><%=rs.getString("category")%></b></li>	
        		<% }%>
          		</ul>
      		</div>

      		<!-- Services Section -->
      		<div class="col-md-8 col">
        		<h3 class="text-center ">Our Services</h3>
        		<div class="input-group mb-3">
          			<input type="text" class="form-control" placeholder="Search Service Here">
          			<span class="input-group-text bg-primary"><i class="fa-solid fa-magnifying-glass text-white"></i></span>
        		</div>
        		<div class="row">
        		<% 
                    rs = con.createStatement().executeQuery("select id, service, description from service_list where status=1;");
                    while (rs.next()) {%>
                    <div class="col-md-6">
            			<div class="card mb-4">
              				<div class="card-body">
                				<p class="card-text"><b class="text-dark"><%=rs.getString("service") %></b><br>
                				<%=rs.getString("description") %></p>
              				</div>
            			</div>
          			</div>
                <% }%>
        		</div>
      		</div>
    	</div>
  	</div>
	<%}
     catch (Exception e) {
        e.printStackTrace();
    } %>
  	<!-- About Section -->
  	<section id="about" class="text-center">
    	<div class="container">
      		<h2 class="section-title">About Us</h2>
      		<p class="lead">We are a dedicated team providing top-notch vehicle services for all types of vehicles. Our mission is to ensure your vehicle is in the best condition, offering reliable and efficient service at all times.</p>
      		<p>Founded in 2010, Vehicle Service Management System has been a trusted partner for vehicle owners across the region. Our state-of-the-art service centers are equipped with advanced tools and technology, and our team of experts ensures the highest standards of care for your vehicle.</p>
      		<p>We offer services for a wide range of vehicles, including two-wheelers, four-wheelers, and commercial vehicles. Our commitment to quality, affordability, and customer satisfaction sets us apart in the industry.</p>
    	</div>
  	</section>

  	<!-- Contact Section -->
  	<section id="contact" class="text-center py-5">
    	<div class="container">
      		<h2 class="section-title">Contact Us</h2>
      		<p class="lead">Have any questions or need help? Reach out to us!</p>
      		<p>Email: support@vsms.com | Phone: +1 234 567 890</p>
      		<div class="row mt-4">
        		<div class="col-md-6">
          			<h5>Our Head Office</h5>
          			<p>123 Main Street, Downtown, CityName, Country</p>
        		</div>
        		<div class="col-md-6">
          			<h5>Working Hours</h5>
          			<p>Monday to Friday: 9:00 AM - 6:00 PM</p>
          			<p>Saturday: 9:00 AM - 2:00 PM</p>
          			<p>Sunday: Closed</p>
        		</div>
      		</div>
    	</div>
  	</section>

  	<!-- Footer -->
  	<footer class="text-center">
    	<div class="container">
      		<p>&copy; 2025 Vehicle Service Management System. All Rights Reserved.</p>
      		<p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    	</div>
  	</footer>
  	
    <!-- Bootstrap JS -->
    
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>