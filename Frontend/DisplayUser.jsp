<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@ page import = "com.entity.User" %> 
	<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <style>
        /* General styling for the body */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fce4ec; /* Light pink background */
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f06292; /* Pink background */
            padding: 15px 20px;
            color: white;
        }

        .navbar h1 {
            margin: 0;
        }

        .navbar .add-user-button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: white;
            color: #f06292; /* Pink color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .navbar .add-user-button:hover {
            background-color: #f8bbd0; /* Light pink hover */
        }

        /* Table Styling */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f06292; /* Pink background */
            color: white;
        }

        table tr:hover {
            background-color: #f8bbd0; /* Light pink hover */
        }

        /* Action Button Styling */
        .action-buttons a {
            padding: 8px 12px;
            font-size: 14px;
            margin: 0 5px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .edit-button {
            background-color: #f06292; /* Pink background */
            color: white;
        }

        .edit-button:hover {
            background-color: #ec407a; /* Darker pink hover */
        }

        .delete-button {
            background-color: #f44336;
            color: white;
        }

        .delete-button:hover {
            background-color: #e53935;
        }

        .no-users-message {
            text-align: center;
            font-size: 18px;
            color: #555;
        }

        /* Modal content */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 40%;
            max-width: 600px;
        }

        .modal-content h2 {
            margin: 0 0 15px;
        }

        .modal-content label {
            display: block;
            margin-bottom: 8px;
        }

        .modal-content input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .modal-content button {
            padding: 10px 20px;
            background-color: #f06292; /* Pink button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #ec407a; /* Darker pink hover */
        }

        /* Close button */
        .close-button {
            float: right;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            color: #aaa;
        }

        .close-button:hover {
            color: #ff5722;
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
    <div class="navbar">
        <h1>User Management</h1>
        <button class="add-user-button" onclick="window.location.href='register.jsp'">Register New User</button>
    </div>

    <!-- Display All Users Table -->
    <h2 style="text-align:center; color: #f06292;">User Details</h2>
    <%  
        ArrayList<User> allUsers = (ArrayList<User>) session.getAttribute("users"); 
        if (allUsers != null && !allUsers.isEmpty()) {  
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Date of Birth</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (User user : allUsers) { %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getDob() %></td>
                        <td><%= user.getMobile() %></td>
                        <td><%= user.getAddress() %></td>
                        <td class="action-buttons">
                            <a href="javascript:void(0)" class="edit-button" onclick="openModal('<%= user.getId() %>', '<%= user.getMobile() %>', '<%= user.getAddress() %>', '<%= user.getPassword() %>')">Edit</a>
                            <a href="/Registration_crud/DeleteUser?id=<%= user.getId() %>" class="delete-button" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <%  
        } else {  
    %>
        <p class="no-users-message">No users found.</p>
    <% } %>

    <!-- Modal Overlay -->
    <div class="modal-overlay" id="editUserModal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <h2>Edit User Details</h2>
            <form action="/Registration_crud/EditUserData" method="post">
                <input type="hidden" name="user_id" id="user_id">
                <label for="mobile">Mobile</label>
                <input type="text" id="mobile" name="mobile" required>
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
                <label for="password">Change Password</label>
                <input type="text" id="password" name="password" placeholder="Enter new password">
                <button type="submit">Update User</button>
            </form>
        </div>
    </div>

    <script>
        function openModal(id, mobile, address, password) {
            document.getElementById('editUserModal').style.display = 'flex';
            document.getElementById('user_id').value = id;
            document.getElementById('mobile').value = mobile;
            document.getElementById('address').value = address;
            document.getElementById('password').value = password;
        }

        function closeModal() {
            document.getElementById('editUserModal').style.display = 'none';
        }
    </script>
</body>
</html>
