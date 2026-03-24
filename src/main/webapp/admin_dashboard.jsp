<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // This is a quick security check to make sure nobody accesses this page without logging in!
    if (session.getAttribute("username") == null || !"Admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .nav-menu { background-color: #333; padding: 15px; border-radius: 5px; }
        .nav-menu a { color: white; text-decoration: none; margin-right: 20px; font-weight: bold; }
        .nav-menu a:hover { color: #4CAF50; }
        .logout { float: right; color: #ff4c4c !important; }
    </style>
</head>
<body>

<div class="nav-menu">
    <a href="admin_dashboard.jsp">Dashboard Home</a>
    <a href="add_doctor.jsp">Add Doctor</a>
    <a href="view_doctors.jsp">View Doctors</a>
    <a href="index.jsp" class="logout">Logout</a>
</div>

<h2>Welcome to the Admin Control Panel, <%= session.getAttribute("username") %>!</h2>
<p>Use the menu above to manage hospital operations.</p>

<p style="color: green;">${message}</p>

</body>
</html>