<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    	<style>
        	body {
            	display: flex;
            	justify-content: center;
            	align-items: center;
            	height: 100vh;
            	margin: 0;
            	background-image: linear-gradient(to right, rgb(63, 63, 69), rgb(61, 61, 67));
        	}
        	.login-container {
            	width: 100%;
            	max-width: 350px;
            	padding: 20px;
            	background-image: linear-gradient(to right, rgb(53, 53, 63), rgb(55, 55, 65));
            	border-radius: 2px;
            	border-top: 3px solid #0571e4;
            	box-shadow: 0 0px 10px rgba(2, 0, 9, 0.9);
            	color: whitesmoke;
        	}
        	.form-control {
          		background: linear-gradient(to right, rgb(53, 53, 63), rgb(53, 53, 63));
          		color: white !important;
        	}
        	.form-control::placeholder {
          		color: rgb(92, 92, 95);
        	}
        	.input-group-text {
            	background-color: white;
            	color: black;
            	border: none;
            	width: 40px;
            	text-align: center;
        	}
        	.input-group-text i {
            	color: black;
        	}
    	</style>
	</head>
	<body>
		<div class="login-container">
        	<h2 class="text-center mb-3">Login</h2>
        	<% if (request.getAttribute("status") != null) {%>   
        		<h4 class="text-center text-danger mb-3"><%= request.getAttribute("status")%></h4>
        	<%}%>
        	<% if (request.getAttribute("success") != null) {%>   
        		<h4 class="text-center text-success mb-3"><%= request.getAttribute("success")%></h4>
        	<%}%>
        	<form method="POST" action="register">
            	<div class="mb-3 input-group">
                	<input type="email" class="form-control" name="email" placeholder="Username" required>
                	<span class="input-group-text"><i class="fa-solid fa-user"></i></span>
            	</div>
            	<div class="mb-3 input-group">
                	<input type="password" class="form-control" name="pw" placeholder="Password" required>
                	<span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
            	</div>
            	<button type="submit" class="btn btn-primary w-100" name="login" value="login">Login</button>
        	</form>
        	<div class="text-center mt-3">
            	<small><a href="#">Forgot password?</a></small>
        	</div>
        	<div class="text-center mt-2">
            	<small>Don't have an account? <a href="Signup.jsp">Sign up</a></small>
        	</div>
    	</div>
	</body>
</html>
