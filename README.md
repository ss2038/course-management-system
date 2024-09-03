Course Management System
Overview
This project is a web-based course management system built using Python, Flask, PostgreSQL, HTML, and CSS. It provides separate interfaces for students and teachers, manages user authentication, and offers role-based access to course content.
Features
User authentication (login/signup) for students and teachers
Role-based access control
Teacher registration approval system
Forgot password functionality
Dedicated Google Drive links for students and teachers
Login activity tracking
Tech Stack
Backend: Python, Flask
Database: PostgreSQL
Frontend: HTML, CSS
Version Control: Git
Project Structure
text
course_management/
│
├── app.py
├── config.py
├── models.py
├── templates/
│   ├── index.html
│   ├── login.html
│   ├── signup.html
│   ├── teacher_info.html
│   ├── forgot_password.html
│   └── dashboard.html
└── static/
    └── styles.css

Setup and Installation
Clone the repository:
text
git clone https://github.com/your-username/course-management-system.git

Install required packages:
text
pip install Flask Flask-SQLAlchemy psycopg2-binary Flask-Mail

Set up PostgreSQL database:
Create a database named course_management
Run the SQL scripts provided in database_setup.sql to create the necessary tables
Configure the application:
Update config.py with your database URI and email settings
Run the application:
text
python app.py

Usage
Students can sign up directly and access course content after login
Teachers must email the admin for registration
Admins can approve teacher registrations
Users can reset their password using the forgot password feature
Database Schema
The system uses the following main tables:
Users
Admin
TeacherApprovals
ContentAccess
LoginLogs
