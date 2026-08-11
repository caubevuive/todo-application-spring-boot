<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add ToDo Item</title>
    
    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Toastr JS/CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>

<div class="container mt-4" style="max-width: 600px;">

    <h1 class="p-3">Add a ToDo Item</h1>

    <form:form action="/saveToDoItem" method="post" modelAttribute="todo">

        <!-- Title Field -->
        <div class="form-group">
            <label for="title">Title</label>
            <form:input type="text" path="title" id="title" class="form-control" required="required" />
        </div>

        <!-- Date Field -->
        <div class="form-group">
            <label for="date">Date</label>
            <form:input type="date" path="date" id="date" class="form-control" required="required" />
        </div>

        <!-- Status Field (Hiển thị mờ nhưng truyền đúng giá trị lên Server) -->
        <div class="form-group">
            <label for="status">Status</label>
            <input type="text" class="form-control" value="Incomplete" disabled="disabled" />
            <form:hidden path="status" value="Incomplete" />
        </div>

        <!-- Save Button -->
        <button type="submit" class="btn btn-success mt-2">Save</button>

    </form:form>

</div>

<!-- Script Toastr Notification -->
<script type="text/javascript">
    window.onload = function() {
        var msg = "${message}";
        
        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "5000"
        };

        if (msg === "Save Failure") {
            Command: toastr["error"]("Something went wrong with the save.");
        }
    }
</script>

</body>
</html>