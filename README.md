# Course Management System

![image](https://github.com/user-attachments/assets/72da1744-ef4c-4fe6-8640-1c694d88ace6)


![image](https://github.com/user-attachments/assets/f644bef5-76ad-4840-a5be-a4c502598de8)


![image](https://github.com/user-attachments/assets/3e2fc6d7-8c13-4d18-a1cd-edd8d60ce57b)


![image](https://github.com/user-attachments/assets/0b5e9c46-1e25-43af-9111-8881b5d14c1f)


![image](https://github.com/user-attachments/assets/3fbb0929-29d3-4349-908e-5481053b1d9c)


![image](https://github.com/user-attachments/assets/20346dfd-cb1b-4400-bc3a-cddbd0d0e1aa)


![image](https://github.com/user-attachments/assets/7a4636c5-72ae-435a-aec1-98736e5e0315)


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
│ ├── index.html
│ ├── login.html
│ ├── signup.html
│ ├── teacher_info.html
│ ├── forgot_password.html
│ └── dashboard.html
└── static/
└── styles.css


## Database Schema

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
