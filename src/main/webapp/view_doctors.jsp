<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hospital.utils.DBConnection" %>

<%
    // Security check to ensure only the Admin can view this page
    if (session.getAttribute("username") == null || !"Admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
<head>
    <title>View Doctors</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { width: 80%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #333; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>

<h2>Hospital Doctors Directory</h2>
<a href="admin_dashboard.jsp" style="text-decoration: none; color: #007BFF; font-weight: bold;">⬅ Back to Dashboard</a>

<table>
    <tr>
        <th>Doctor ID</th>
        <th>Name</th>
        <th>Specialization</th>
    </tr>

    <%
        try {
            // Connect to the database and fetch all doctors
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM doctors";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            // Loop through the results and print a table row for each doctor
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("specialization") %></td>
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