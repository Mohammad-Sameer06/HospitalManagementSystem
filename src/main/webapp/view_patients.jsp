<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hospital.utils.DBConnection" %>

<%
    // Security check
    if (session.getAttribute("username") == null || !"Admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
<head>
    <title>View Patients</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { width: 80%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #333; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>

<h2>Hospital Patients Directory</h2>
<a href="admin_dashboard.jsp" style="text-decoration: none; color: #007BFF; font-weight: bold;">⬅ Back to Dashboard</a>

<table>
    <tr>
        <th>Patient ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Contact</th>
    </tr>

    <%
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM patients";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getString("contact") %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error loading data: " + e.getMessage() + "</p>");
        }
    %>
</table>

</body>
</html>