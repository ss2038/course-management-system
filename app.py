from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail, Message
from datetime import datetime
from models import User, Admin, TeacherApproval, ContentAccess, LoginLog
from config import Config

app = Flask(__name__)
app.config.from_object(Config)

db = SQLAlchemy(app)
mail = Mail(app)

# Models
class User(db.Model):
    __tablename__ = 'users'
    user_id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    user_type = db.Column(db.String(50), nullable=False)
    is_approved = db.Column(db.Boolean, default=False)
    signup_date = db.Column(db.DateTime, default=datetime.utcnow)
    last_login = db.Column(db.DateTime)
    college_name = db.Column(db.String(255))
    country = db.Column(db.String(100))
    university_website = db.Column(db.String(255))
    additional_info = db.Column(db.Text)

class Admin(db.Model):
    __tablename__ = 'admin'
    admin_id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    full_name = db.Column(db.String(255), nullable=False)

class TeacherApproval(db.Model):
    __tablename__ = 'teacher_approvals'
    approval_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    approval_status = db.Column(db.String(50), default='pending')
    requested_date = db.Column(db.DateTime, default=datetime.utcnow)
    approved_by = db.Column(db.Integer, db.ForeignKey('admin.admin_id'))
    approval_date = db.Column(db.DateTime)

class ContentAccess(db.Model):
    __tablename__ = 'content_access'
    access_id = db.Column(db.Integer, primary_key=True)
    user_type = db.Column(db.String(50), nullable=False)
    drive_link = db.Column(db.String(255), nullable=False)

class LoginLog(db.Model):
    __tablename__ = 'login_logs'
    log_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    login_time = db.Column(db.DateTime, default=datetime.utcnow)
    ip_address = db.Column(db.String(50))

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        user_type = request.form['user_type']
        
        existing_user = User.query.filter_by(email=email).first()
        if existing_user:
            flash('Email already registered.')
            return redirect(url_for('signup'))
        
        if user_type == 'teacher':
            flash('Teachers must email the admin for registration.')
            return redirect(url_for('teacher_info'))
        
        new_user = User(
            email=email,
            user_type=user_type,
            is_approved=True if user_type == 'student' else False,
            signup_date=datetime.utcnow()
        )
        new_user.set_password(password)
        
        db.session.add(new_user)
        db.session.commit()
        
        if user_type == 'student':
            flash('Student registered successfully!')
            return redirect(url_for('login'))
        else:
            # This part should not be reached due to earlier redirect, but kept for completeness
            flash('Teacher registration request submitted. Please wait for admin approval.')
            return redirect(url_for('teacher_info'))
    
    return render_template('signup.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        user = User.query.filter_by(email=email).first()
        
        if user and user.password == password:
            if not user.is_approved:
                flash('Your account is not yet approved.')
                return redirect(url_for('login'))
            
            user.last_login = datetime.utcnow()
            log = LoginLog(user_id=user.user_id, ip_address=request.remote_addr)
            db.session.add(log)
            db.session.commit()
            
            content = ContentAccess.query.filter_by(user_type=user.user_type).first()
            return render_template('dashboard.html', user=user, drive_link=content.drive_link)
        else:
            flash('Invalid email or password.')
    
    return render_template('login.html')

@app.route('/teacher_info')
def teacher_info():
    return render_template('teacher_info.html', admin_email=app.config['ADMIN_EMAIL'])
    
@app.route('/forgot_password', methods=['GET', 'POST'])
def forgot_password():
    if request.method == 'POST':
        email = request.form['email']
        user = User.query.filter_by(email=email).first()
        if user:
            send_password_email(user.email, user.password)
            flash('Your password has been sent to your email.')
            return redirect(url_for('login'))
        else:
            flash('Email not found.')
    return render_template('forgot_password.html')

def send_password_email(email, password):
    msg = Message('Your Password', sender=app.config['MAIL_USERNAME'], recipients=[email])
    msg.body = f'Your password is: {password}'
    mail.send(msg)

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)