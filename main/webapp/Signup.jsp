<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Signup</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    	<style>
        	body {
            	display: flex;
       	     	justify-content: center;
        	    align-items: center;
            	height: 100vh;
            	margin: 0;
            	background-image: linear-gradient(to right, rgb(63, 63, 69), rgb(61, 61, 67));
        	}
        	.signup-container {
            	width: 100%;
            	max-width: 380px;
            	padding: 20px;
            	background-image: linear-gradient(to right, rgb(53, 53, 63), rgb(55, 55, 65));
            	border-radius: 5px;
            	border-top: 3px solid #0571e4;
            	box-shadow: 0 0px 10px rgba(2, 0, 9, 0.9);
            	color: whitesmoke;
        	}
        	.form-control {
           	 	background-image: linear-gradient(to right, rgb(53, 53, 63), rgb(53, 53, 63));
            	color: white !important;
        	}
        	.form-control::placeholder {
            	color: rgb(92, 92, 95) !important;
        	}
        	
    	</style>
	</head>
	<body>
		<div class="signup-container">
        	<h2 class="text-center mb-3">Sign Up</h2>
		    <% if (request.getAttribute("status") != null) {%>   
        		<h4 class="text-center text-danger mb-3"><%= request.getAttribute("status")%></h4>
        	<%}%>
        
        	<form action="register" method="POST">
            	<div class="mb-3">
                	<label for="username" class="form-label">Username</label>
                	<input type="text" class="form-control" name="name" placeholder="Enter your username" required>
            	</div>
            	<div class="mb-3">
                	<label for="email" class="form-label">Email</label>
                	<input type="email" class="form-control" name="email" placeholder="Enter your email" required>
            	</div>
            	<div class="mb-3">
                	<label for="phone" class="form-label">phone</label>
                	<input type="number" class="form-control" name="phone" placeholder="Enter your phone number" required>
            	</div>
            	<div class="mb-3">
                	<label for="password" class="form-label">Password</label>
                	<input type="password" class="form-control" name="pw" placeholder="Create a password" required>
            	</div>
            	<div class="mb-3">
                	<label for="confirmPassword" class="form-label">Confirm Password</label>
                	<input type="password" class="form-control" name="cp" placeholder="Confirm your password" required>
            	</div>
            	<button type="submit" class="btn btn-primary w-100" name="signup" value="signup">Sign Up</button>
        	</form>
        	<div class="text-center mt-3">
            	<small>Already have an account? <a href="Login.jsp">Login</a></small>
        	</div>
    	</div>
	</body>
</html>