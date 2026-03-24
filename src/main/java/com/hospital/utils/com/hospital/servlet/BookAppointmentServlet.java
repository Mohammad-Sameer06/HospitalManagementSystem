package com.hospital.servlet;

import com.hospital.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int patientId = Integer.parseInt(request.getParameter("patientId"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String appointmentDate = request.getParameter("appointmentDate");

        try {
            Connection conn = DBConnection.getConnection();

            // The status automatically defaults to 'Scheduled' as defined in our database setup!
            String sql = "INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES (?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, patientId);
            pst.setInt(2, doctorId);
            pst.setString(3, appointmentDate);

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Appointment successfully booked for " + appointmentDate + "!");
                request.getRequestDispatcher("receptionist_dashboard.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}