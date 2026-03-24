<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hospital.utils.DBConnection" %>

<%
    // Security check: Only the Receptionist can access this page
    if (session.getAttribute("username") == null || !"Receptionist".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
<head>
    <title>View Appointments</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { width: 90%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #17a2b8; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .status-scheduled { color: orange; font-weight: bold; }
    </style>
</head>
<body>

<h2>Hospital Appointments Schedule</h2>
<a href="receptionist_dashboard.jsp" style="text-decoration: none; color: #17a2b8; font-weight: bold;">⬅ Back to Dashboard</a>

<table>
    <tr>
        <th>Appt ID</th>
        <th>Patient Name</th>
        <th>Doctor Name</th>
        <th>Date</th>
        <th>Status</th>
    </tr>

    <%
        try {
            Connection conn = DBConnection.getConnection();

            // This SQL query links all three tables together to get the readable names!
            String sql = "SELECT a.id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date, a.status " +
                    "FROM appointments a " +
                    "JOIN patients p ON a.patient_id = p.id " +
                    "JOIN doctors d ON a.doctor_id = d.id " +
                    "ORDER BY a.appointment_date ASC";

            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("patient_name") %></td>
        <td><%= rs.getString("doctor_name") %></td>
        <td><%= rs.getString("appointment_date") %></td>
        <td class="status-scheduled"><%= rs.getString("status") %></td>
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