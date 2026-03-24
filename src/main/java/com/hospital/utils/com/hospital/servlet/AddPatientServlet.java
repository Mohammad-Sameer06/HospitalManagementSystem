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

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Get the data from the form
        String name = request.getParameter("patientName");
        // Age comes in as text, so we convert it to an integer for the database
        int age = Integer.parseInt(request.getParameter("age"));
        String contact = request.getParameter("contact");

        try {
            // 2. Connect to the database
            Connection conn = DBConnection.getConnection();

            // 3. Prepare the SQL query
            String sql = "INSERT INTO patients (name, age, contact) VALUES (?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setInt(2, age);
            pst.setString(3, contact);

            // 4. Execute the update
            int rowsAffected = pst.executeUpdate();

            // 5. Send the Admin back with a success message
            if (rowsAffected > 0) {
                request.setAttribute("message", "Patient " + name + " added successfully!");
                request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}