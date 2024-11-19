<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        /* Updated styling with pink theme */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f8bbd0, #f48fb1);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #ffffff;
            margin-top: 100px;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ad1457;
            font-size: 24px;
        }
        .form-container label {
            font-weight: bold;
            color: #880e4f;
            align-self: flex-start;
            margin-bottom: 5px;
            font-size: 14px;
        }
        .form-container input,
        .form-container textarea {
            width: 93%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #f06292;
            border-radius: 5px;
            font-size: 14px;
            background-color: #fce4ec;
            transition: all 0.3s ease;
        }
        .form-container input:focus,
        .form-container textarea:focus {
            border-color: #ad1457;
            background-color: #ffffff;
            outline: none;
            box-shadow: 0 0 5px rgba(173, 20, 87, 0.5);
        }
        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #ad1457;
            border: none;
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-container button:hover {
            background-color: #880e4f;
        }
        .form-container .note {
            text-align: center;
            font-size: 12px;
            color: #880e4f;
            margin-top: 10px;
        }
    </style>
    <script>
        function validateForm() {
            const username = document.getElementById('username').value.trim();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value;
            const dob = document.getElementById('dob').value;
            const phone = document.getElementById('phone').value.trim();
            const address = document.getElementById('address').value.trim();
            // Validate username
            if (username.length < 3) {
                alert('Username must be at least 3 characters long.');
                return false;
            }
            // Validate email
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address.');
                return false;
            }
            // Validate password
            if (password.length < 6) {
                alert('Password must be at least 6 characters long.');
                return false;
            }
            // Validate DOB
            if (!dob) {
                alert('Please select your date of birth.');
                return false;
            }
            // Validate phone number
            const phoneRegex = /^[6-9][0-9]{9}$/; // Starts with 6, 7, 8, or 9 and has exactly 10 digits
            if (!phoneRegex.test(phone)) {
                alert('Phone number must be a 10-digit number starting with 6, 7, 8, or 9.');
                return false;
            }
            // Validate address
            if (address.length < 10) {
                alert('Address must be at least 10 characters long.');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Register</h2>
        <form action="/Registration_crud/RegisterServlet" method="post" onsubmit="return validateForm()">
            <label for="username">User Name</label>
            <input type="text" id="username" name="username" placeholder="Enter your full name" required>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" required>
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{10}" placeholder="Enter your 10-digit phone number" required>
            <label for="address">Address</label>
            <textarea id="address" name="address" rows="3" placeholder="Enter your address" required></textarea>
            <button type="submit">Register</button>
        </form>
        <p class="note">All fields are required to complete your registration.</p>
    </div>
</body>
</html>
