# UserRegistration_CRUD
# RegisterUser_Crud Project

This repository contains the core files for a **User Registration CRUD** application built using **JSP** and **Hibernate**. The project handles user registration, viewing all users, and performing basic operations like editing and deleting users.


The project is organized into the following main directories:
## Features

- User Registration: Allows a user to register by providing basic details like name, email, etc.
- View All Users: Displays a list of all registered users from the database.
- Edit User Details: Allows updating user details like name or email.
- Delete User: Allows deleting a user from the system.
- Hibernate ORM: Uses Hibernate for database interaction, including session management and CRUD operations.

## Requirements

- **Java 8+**
- **Apache Tomcat** (or any servlet container)
- **MySQL** (or any compatible database)
- **Hibernate ORM**

## Setup Instructions

### Here are the instructions for setting up your Eclipse project if you're deploying the RegisterUser_Crud project locally in Eclipse:
1. Use SqlScript 
        -Regisration.sql
      in mysql workbench to create the database and table.

      
2. Create a New Dynamic Web Project/Maven project in Eclipse
    Open Eclipse and go to the File menu.
    Select New > Dynamic Web Project.
    In the New Dynamic Web Project window:
    Project Name: Enter RegisterUser_Crud as the project name.
    Target Runtime: Select your Apache Tomcat or any other servlet container you're using.
    If you haven't configured Tomcat in Eclipse yet, click on New Runtime and select Apache Tomcat (download and configure it first if required).
    Dynamic Web Module Version: Choose the appropriate version (usually 3.0 or 4.0 depending on your Tomcat version).
  Click Finish to create the project.


4. Organize Project Structure
    Now, set up the folder structure inside your newly created project.

    3.1. Create Folders for Frontend, Backend, and Configurations
    Frontend Files (JSP):

    In the Project Explorer window, expand the RegisterUser_Crud project.
    Right-click on WebContent and select New > Folder.
    Name the folder frontend and click Finish.
    Inside the frontend folder, add your JSP files (registerUser.jsp, displayAllUsers.jsp).
    Backend Files (Java):

    Right-click on the src folder and select New > Package.
    Name the package backend and click Finish.
    Inside the backend package, create your Java files:
            -User.java
   
            -UserDao.java
   
            -UserDaoImplementation.java
   
            -FetchAllUsersServlet.java

            -EditUserData.java
   
            -DeleteUser.java
   
            -RegisterServlet.java
   
    Configuration Files:

    Inside the WebContent/WEB-INF folder, place the following configuration files:
   
              -web.xml
           
              -hibernate.cfg.xml
   
    3.2. Add the pom.xml (If Using Maven)
      If you're using Maven for dependency management, make sure the pom.xml file is placed in the root of the project (same level as src and WebContent).
5. Configure Database Connection in hibernate.cfg.xml
    Open the hibernate.cfg.xml file located in WebContent/WEB-INF and configure the connection settings:
    Update the <hibernate-configuration> section with your MySQL (or other database) details, such as the url, username, and password.
6. Add Dependencies to pom.xml
    If you're using Maven to manage dependencies, add the necessary libraries in the pom.xml file.
7. Configure Web Deployment Descriptor (web.xml)
    In WebContent/WEB-INF/web.xml, configure the servlets and servlet-mapping for the application
8. Run the Project Locally on Apache Tomcat
    Deploy the project to Tomcat:

    In Eclipse, right-click on your project in Project Explorer.
    Select Run As > Run on Server.
    Choose the configured Tomcat server and click Finish.
    
    Access the Application:
    Open your browser and visit the URLs to test the application:
   
    Register User: http://localhost:8080/RegisterUser_Crud/frontend/registerUser.jsp
   
    View All Users: http://localhost:8080/RegisterUser_Crud/frontend/displayAllUsers.jsp
9. Debugging and Logs

    If you face any issues, check the Console window in Eclipse for logs and error messages from Tomcat.
    Also, check the Server Logs for any deployment issues.
    By following these steps, you will have your RegisterUser_Crud project set up and running locally in Eclipse.
   # RegistrationCrudAssessment
