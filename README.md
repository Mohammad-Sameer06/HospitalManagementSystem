# 🏥 Hospital Management System

A full-stack Java web application designed to streamline hospital operations. This system provides role-based access control, allowing Administrators to manage hospital staff and patient records, while empowering Receptionists to efficiently handle appointment scheduling.

## ✨ Key Features

### 🔒 Role-Based Authentication
* Secure login system distinguishing between 'Admin' and 'Receptionist' roles.
* Session management to prevent unauthorized access to specific dashboards.

### 🛠️ Admin Module
* **Doctor Management:** Register new doctors with their specific specializations.
* **Patient Management:** Register new patients and maintain their contact records.
* **Directory Viewing:** Dynamically generated data tables to view all registered doctors and patients.

### 📅 Receptionist Module
* **Dynamic Appointment Booking:** A smart booking form that automatically fetches registered patients and doctors from the database for error-free scheduling.
* **Integrated Scheduling View:** Uses complex SQL `JOIN` operations to display comprehensive appointment details (Patient Name, Doctor Name, Date, Status) in a single, clean interface.

## 💻 Tech Stack

* **Backend:** Java (Servlets), JDBC
* **Frontend:** JSP (JavaServer Pages), HTML, CSS
* **Database:** MySQL
* **Server:** Apache Tomcat (v9/v10)
* **Build Tool:** Maven

## 🚀 Getting Started

Follow these steps to get the project running on your local machine.

### Prerequisites
* Java Development Kit (JDK 17 or higher)
* Apache Tomcat Server
* MySQL Server & MySQL Workbench
* IntelliJ IDEA (Enterprise/Ultimate) or Eclipse IDE

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Mohammad-Sameer06/HospitalManagementSystem.git