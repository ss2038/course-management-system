# Course Management System

![image](https://github.com/user-attachments/assets/daf01062-f0a6-4e09-95a2-c4d970c2668d)

![image](https://github.com/user-attachments/assets/721e901f-141d-4e5b-863c-eb03831f5ee9)

![image](https://github.com/user-attachments/assets/2f429864-53f7-4390-8acb-373e1cdada63)

![image](https://github.com/user-attachments/assets/914625e5-95ef-43e2-a581-876eb746d084)

![image](https://github.com/user-attachments/assets/34bd9148-cb99-48d1-ae8e-925189cd1bd8)

![image](https://github.com/user-attachments/assets/ea731926-80f4-48c5-824b-e7fee231c348)

![image](https://github.com/user-attachments/assets/becd9498-caac-448f-b29d-cd781f840ba5)

![image](https://github.com/user-attachments/assets/bb2dbe3a-97a1-4a2f-b9bb-8c14e2b52482)




## Overview

The Course Management System is a web application built using Python, Flask, and PostgreSQL. It provides a platform for students and teachers to manage course-related activities, including user authentication, role-based access to content, and an admin approval system for teacher registrations.

## Features

- **User Authentication**: Sign up and log in for students and teachers.
- **Role-Based Access**: Different access levels for students and teachers.
- **Teacher Registration**: Teachers can request registration via email, pending admin approval.
- **Forgot Password**: Users can retrieve their password via email.
- **Content Access**: Users are provided with specific Google Drive links based on their role.
- **Login Tracking**: Tracks user login activity for auditing purposes.

## Tech Stack

- **Backend**: Python, Flask
- **Database**: PostgreSQL
- **Frontend**: HTML, CSS
- **Version Control**: Git

## Project Structure
course_management/
│
├── app.py
├── config.py
├── models.py
├── templates/
│ ├── base.html
│ ├── login.html
│ ├── signup.html
│ ├── teacher_info.html
│ ├── forgot_password.html
│ └── dashboard.html
└── static/
└── styles.css


## Database Schema

to create the database from the file that i had uploaded on github, you can follow these steps:
 
Steps to create the database:
 
To create a new database in cmd, run:
 
createdb course_management
 
This creates a new database named "course_management".

Connect to the new database:
 
psql -d course_management
 
Execute the SQL file:
Once connected to the database, run:
 
\i C:\Users\Admin\test Course management system\course-management-system\course_management_schema.sql
 
Replace the path with the actual path to your schema file.
 
Now,
Verify the database structure:
After executing the file, you can check if the tables were created correctly:
 
\dt
 
This will list all tables in the database.
Check table structures:
To see the structure of a specific table, use:
 
\d table_name
 
Replace "table_name" with each table name (e.g., users, admin, content_access, etc.) to verify their structures.
Exit psql:
When you're done, type:
 
\q

### 1. Users Table
**Purpose**: This is the core table for storing user information, whether they are students or teachers.

**Key Columns**:
- **user_id**: A unique identifier for each user.
- **email**: Credentials for logging in.
- **password**: User's password.
- **user_type**: Defines whether the user is a student or a teacher.
- **is_approved**: For teachers, this field determines if their account has been approved by an admin. For students, this will be automatically set to true.
- **signup_date**: Track when the user signed up.
- **last_login**: Track the user's most recent login time.
- **college_name**: Stores the name of the college or university.
- **country**: Stores the country of the user.
- **university_website**: Stores the website URL of the user's university.
- **additional_info**: A general field to capture any other relevant information during sign-up.

### 2. Admin Table
**Purpose**: Stores information about the admin(s) who have the authority to approve or reject teacher sign-ups.

**Key Columns**:
- **admin_id**: A unique identifier for each admin.
- **email**: Admin's email address.
- **password**: Admin's password.
- **full_name**: The admin's name for identification.

### 3. Teacher Approvals Table
**Purpose**: Manages the approval workflow for teacher sign-ups.

**Key Columns**:
- **approval_id**: Unique identifier for each approval request.
- **user_id**: References the teacher in the Users table (foreign key).
- **approval_status**: Tracks whether the request is 'pending', 'approved', or 'rejected'.
- **requested_date**: The date the teacher requested approval.
- **approved_by**: References the admin who processed the request (foreign key to Admin Table).
- **approval_date**: The date the approval/rejection was completed.

### 4. Content Access Table
**Purpose**: Defines role-based access to Google Drive links.

**Key Columns**:
- **access_id**: Unique identifier for each access rule.
- **user_type**: Defines whether the rule applies to 'student' or 'teacher'.
- **drive_link**: The Google Drive link that will be shown to the user.

### 5. Login Logs Table
**Purpose**: Tracks login activity for all users.

**Key Columns**:
- **log_id**: Unique identifier for each login event.
- **user_id**: References the user in the Users table (foreign key).
- **login_time**: The exact time the user logged in.
- **ip_address**: The IP address from which the user logged in.

## Relationships
- **Teacher Approvals Table**: Connects to both the Users Table and the Admin Table.
- **Content Access Table**: Connects indirectly with the Users Table by defining role-based access.
- **Login Logs Table**: Logs all user logins and references the user_id from the Users Table.

## Flow Summary

### Sign-Up Process
- Students sign up and are automatically approved.
- Teachers sign up and their request is logged in the Teacher Approvals Table as "pending" until an admin reviews it.

### Admin Approval
- Admins review teacher requests in the Teacher Approvals Table. Once approved, the is_approved field in the Users Table is updated, allowing teachers to access the content.

### Content Access
- After logging in, based on their role (student or teacher), users are shown different Google Drive links fetched from the Content Access Table.

### Login Tracking
- Every login is recorded in the Login Logs Table for monitoring user activity.
