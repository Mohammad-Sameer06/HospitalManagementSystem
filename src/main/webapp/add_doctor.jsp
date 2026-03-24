<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Doctor</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .form-box { border: 1px solid #ccc; padding: 20px; width: 400px; border-radius: 10px; margin-top: 20px; }
        input { width: 95%; padding: 10px; margin: 10px 0; }
        button { padding: 10px 20px; background-color: #28a745; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<h2>Register a New Doctor</h2>
<a href="admin_dashboard.jsp">⬅ Back to Dashboard</a>

<div class="form-box">
    <form action="addDoctor" method="post">
        <label>Doctor's Name:</label>
        <input type="text" name="doctorName" placeholder="e.g., Dr. John Smith" required>

        <label>Specialization:</label>
        <input type="text" name="specialization" placeholder="e.g., Cardiologist, Pediatrician" required>

        <button type="submit">Save Doctor</button>
    </form>
</div>

</body>
</html>