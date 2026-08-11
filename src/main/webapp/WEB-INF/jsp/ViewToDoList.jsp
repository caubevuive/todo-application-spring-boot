<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View ToDo Item List</title>
    
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Toastr JS/CSS (Tạo popup thông báo xanh lá) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        a { color: white; }
        a:hover { color: white; text-decoration: none; }
    </style>
</head>
<body>

<div class="container mt-4">

    <h1 class="p-3 text-center">ToDo Item List</h1>

    <form:form>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Mark Completed</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="todo" items="${list}">
                    <tr>
                        <td>${todo.id}</td>
                        <td>${todo.title}</td>
                        <td>${todo.date}</td>
                        <td>${todo.status}</td>
                        <td>
                            <button type="button" class="btn btn-success">
                                <a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary">
                                <a href="/editToDoItem/${todo.id}">Edit</a>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger">
                                <a href="/deleteToDoItem/${todo.id}">Delete</a>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form:form>

    <!-- Nút Add New ToDo Item tràn viền -->
    <a href="/addToDoItem" class="btn btn-primary btn-block text-white font-weight-bold">
        Add New ToDo Item
    </a>

</div>

<!-- Đoạn Script hiển thị popup Toastr khi lưu/sửa thành công -->
<script type="text/javascript">
    window.onload = function() {
        var msg = "${message}";
        
        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "3000"
        };

        if (msg === "Save Success") {
            Command: toastr["success"]("Item added successfully!!");
        } else if (msg === "Update Success") {
            Command: toastr["success"]("Item updated successfully!!");
        } else if (msg === "Delete Success") {
            Command: toastr["success"]("Item deleted successfully!!");
        }
    }
</script>

</body>
</html>