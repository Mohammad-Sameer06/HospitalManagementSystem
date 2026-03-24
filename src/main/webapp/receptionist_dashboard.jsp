<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Security check: Only the Receptionist can access this page
    if (session.getAttribute("username") == null || !"Receptionist".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Receptionist Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .nav-menu { background-color: #17a2b8; padding: 15px; border-radius: 5px; }
        .nav-menu a { color: white; text-decoration: none; margin-right: 20px; font-weight: bold; }
        .nav-menu a:hover { color: #f8f9fa; }
        .logout { float: right; color: #ffeeba !important; }
    </style>
</head>
<body>

<div class="nav-menu">
    <a href="receptionist_dashboard.jsp">Dashboard Home</a>
    <a href="book_appointment.jsp">Book Appointment</a>
    <a href="view_appointments.jsp">View Appointments</a>
    <a href="index.jsp" class="logout">Logout</a>
</div>

<h2>Reception Desk Control Panel</h2>
<p>Welcome, <%= session.getAttribute("username") %>! Use the menu above to manage patient appointments.</p>

<p style="color: green;">${message}</p>

</body>
</html>