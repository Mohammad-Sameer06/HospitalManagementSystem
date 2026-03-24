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

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Get the data from the form
        String name = request.getParameter("doctorName");
        String specialization = request.getParameter("specialization");

        try {
            // 2. Connect to the database
            Connection conn = DBConnection.getConnection();

            // 3. Prepare the SQL query to insert the doctor
            String sql = "INSERT INTO doctors (name, specialization) VALUES (?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, specialization);

            // 4. Execute the update
            int rowsAffected = pst.executeUpdate();

            // 5. Send the Admin back to the dashboard with a success message
            if (rowsAffected > 0) {
                request.setAttribute("message", "Doctor " + name + " added successfully!");
                request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}