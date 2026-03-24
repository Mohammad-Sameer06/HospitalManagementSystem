<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hospital.utils.DBConnection" %>
<html>
<head>
    <title>Book Appointment</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .form-box { border: 1px solid #ccc; padding: 20px; width: 400px; border-radius: 10px; margin-top: 20px; }
        select, input { width: 95%; padding: 10px; margin: 10px 0; }
        button { padding: 10px 20px; background-color: #17a2b8; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<h2>Book a New Appointment</h2>
<a href="receptionist_dashboard.jsp" style="text-decoration: none; color: #17a2b8; font-weight: bold;">⬅ Back to Dashboard</a>

<div class="form-box">
    <form action="bookAppointment" method="post">

        <label>Select Patient:</label>
        <select name="patientId" required>
            <option value="">-- Choose a Patient --</option>
            <%
                Connection conn = DBConnection.getConnection();
                try {
                    ResultSet rsPatients = conn.prepareStatement("SELECT id, name FROM patients").executeQuery();
                    while(rsPatients.next()) {
            %>
            <option value="<%= rsPatients.getInt("id") %>"><%= rsPatients.getString("name") %></option>
            <%      }
            } catch(Exception e) { e.printStackTrace(); }
            %>
        </select>

        <label>Select Doctor:</label>
        <select name="doctorId" required>
            <option value="">-- Choose a Doctor --</option>
            <%
                try {
                    ResultSet rsDoctors = conn.prepareStatement("SELECT id, name, specialization FROM doctors").executeQuery();
                    while(rsDoctors.next()) {
            %>
            <option value="<%= rsDoctors.getInt("id") %>"><%= rsDoctors.getString("name") %> (<%= rsDoctors.getString("specialization") %>)</option>
            <%      }
            } catch(Exception e) { e.printStackTrace(); }
            %>
        </select>

        <label>Appointment Date:</label>
        <input type="date" name="appointmentDate" required>

        <button type="submit">Book Appointment</button>
    </form>
</div>

</body>
</html>