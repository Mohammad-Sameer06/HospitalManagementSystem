package com.hospital.servlet;

import com.hospital.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// This annotation links the HTML form action="login" to this Java file!
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Get what the user typed in the form
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            // 2. Connect to the database
            Connection conn = DBConnection.getConnection();

            // 3. Look for the user in the database
            String sql = "SELECT role FROM users WHERE username=? AND password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);

            ResultSet rs = pst.executeQuery();

            // 4. Check if we found a match
            if (rs.next()) {
                String role = rs.getString("role");

                // Save the user's session so the server remembers they are logged in
                HttpSession session = request.getSession();
                session.setAttribute("username", user);
                session.setAttribute("role", role);

                // Send them to the right dashboard based on their role
                if ("Admin".equals(role)) {
                    response.sendRedirect("admin_dashboard.jsp");
                } else {
                    response.sendRedirect("receptionist_dashboard.jsp");
                }
            } else {
                // If wrong username/password, send them back to index.jsp with an error
                request.setAttribute("errorMessage", "Invalid Username or Password!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}