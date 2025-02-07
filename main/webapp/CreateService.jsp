<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Service</title>
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
            border-top: 3px solid #0571e4;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.6);
            border-radius: 5px;
            margin: 20px;
        }

        .container1 .header {
        	padding: 10px 20px 10px 30px;
       		border-bottom: 2px solid #386173;
            
        }

        .form-label {
            color: #c2c5c5;
            font-weight: bold;
        }

        .form-control {
            background-image: linear-gradient(to right, rgb(45, 71, 86, 1), rgb(46, 86, 109, 1), rgb(45, 71, 86, 1)) !important;
            color: #c2c5c5 !important;
            border: 1px solid #999a9c;
        }

        .form-control:focus {
            border-color: #0c89d4;
            box-shadow: none;
        }
		
    </style>
</head>
<body>
    <div class="d-flex">
        <%@ include file="AdminSideNav.jsp" %>
        <div class="main-content">
            <%@ include file="AdminHeader.jsp" %>
            <div class="container1">
            	<div class="header"><h3>Create New Service</h3></div>
            	
                <div class="form-container p-4">
                    <form method="post" action="register">
                        <div class="mb-3">
                            <label for="sname" class="form-label">Service Name</label>
                            <textarea class="form-control" id="sname" name="sname" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" required></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary" name="addService" value="addService">Save</button>
                        <a href="ServiceList.jsp" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>