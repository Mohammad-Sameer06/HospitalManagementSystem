<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Patient</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .form-box { border: 1px solid #ccc; padding: 20px; width: 400px; border-radius: 10px; margin-top: 20px; }
        input { width: 95%; padding: 10px; margin: 10px 0; }
        button { padding: 10px 20px; background-color: #28a745; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<h2>Register a New Patient</h2>
<a href="admin_dashboard.jsp" style="text-decoration: none; color: #007BFF; font-weight: bold;">⬅ Back to Dashboard</a>

<div class="form-box">
    <form action="addPatient" method="post">
        <label>Patient's Name:</label>
        <input type="text" name="patientName" placeholder="e.g., Jane Doe" required>

        <label>Age:</label>
        <input type="number" name="age" placeholder="e.g., 34" required>

        <label>Contact Number:</label>
        <input type="text" name="contact" placeholder="e.g., 9876543210" required>

        <button type="submit">Save Patient</button>
    </form>
</div>

</body>
</html>