Course Management System
Overview
The Course Management System is a web application built using Python, Flask, and PostgreSQL. It provides a platform for students and teachers to manage course-related activities, including user authentication, role-based access to content, and an admin approval system for teacher registrations.
Features
User Authentication: Sign up and log in for students and teachers.
Role-Based Access: Different access levels for students and teachers.
Teacher Registration: Teachers can request registration via email, pending admin approval.
Forgot Password: Users can retrieve their password via email.
Content Access: Users are provided with specific Google Drive links based on their role.
Login Tracking: Tracks user login activity for auditing purposes.
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

Database Schema
The following tables are used in the application:
Users Table
user_id: Unique identifier for each user.
email: User's email address.
password: User's password.
user_type: Defines whether the user is a student or a teacher.
is_approved: Indicates if a teacher's account is approved by an admin.
signup_date: Date the user signed up.
last_login: Timestamp of the user's last login.
college_name: Name of the user's college/university.
country: User's country.
university_website: URL of the user's university.
additional_info: Any additional information provided during signup.
Admin Table
admin_id: Unique identifier for each admin.
email: Admin's email address.
password: Admin's password.
full_name: Admin's full name.
Teacher Approvals Table
approval_id: Unique identifier for each approval request.
user_id: References the teacher in the Users table.
approval_status: Status of the approval request ('pending', 'approved', 'rejected').
requested_date: Date the teacher requested approval.
approved_by: References the admin who processed the request.
approval_date: Date of approval/rejection.
Content Access Table
access_id: Unique identifier for each access rule.
user_type: Defines whether the rule applies to 'student' or 'teacher'.
drive_link: The Google Drive link provided to the user.
Login Logs Table
log_id: Unique identifier for each login event.
user_id: References the user in the Users table.
login_time: Timestamp of the login event.
ip_address: IP address from which the user logged in.
Setup and Installation
Clone the Repository:
bash
git clone https://github.com/your-username/course-management-system.git

Install Required Packages:
bash
pip install Flask Flask-SQLAlchemy psycopg2-binary Flask-Mail

Set Up PostgreSQL Database:
Create a PostgreSQL database named course_management.
Run the SQL scripts provided in schema.sql to create the necessary tables.
Configure the Application:
Update config.py with your database URI and email settings.
Run the Application:
bash
python app.py

Usage
Sign-Up Process:
Students can sign up directly and are automatically approved.
Teachers must email the admin for registration.
Admin Approval:
Admins can review teacher requests in the Teacher Approvals Table.
Forgot Password:
Users can retrieve their password by entering their registered email.
