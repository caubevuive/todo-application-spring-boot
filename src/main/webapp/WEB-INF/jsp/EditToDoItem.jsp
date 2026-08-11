<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit ToDo Item</title>
    
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Toastr JS/CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>

<div class="container mt-4" style="max-width: 600px;">

    <h1 class="p-3 text-center">Edit ToDo Item</h1>

    <form:form action="/editSaveToDoItem" method="post" modelAttribute="todo">

        <!-- Hidden ID (Bắt buộc phải có để Hibernate biết là Update chứ không phải Insert) -->
        <form:hidden path="id" />

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

        <!-- Status Field -->
        <div class="form-group">
            <label for="status">Status</label>
            <form:select path="status" id="status" class="form-control">
                <form:option value="Incomplete">Incomplete</form:option>
                <form:option value="Completed">Completed</form:option>
            </form:select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary btn-block mt-4">Save Changes</button>

    </form:form>

</div>

<script type="text/javascript">
    window.onload = function() {
        var msg = "${message}";
        if (msg === "Edit Failure") {
            toastr.error("Failed to update item!");
        }
    }
</script>

</body>
</html>