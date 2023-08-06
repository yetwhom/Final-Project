<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Information</title>
  <link rel="stylesheet" href="style.css"> <!-- Add a link to the style.css file -->
</head>
<body>
  <div class="info-container">
    <h2>User Information</h2>

    <%-- Retrieve user information from the database based on the user ID in the session --%>
    <% 
      // Get user ID stored in session
      String userId = (String) session.getAttribute("userId");

      // Set RDS connection information
      String dbURL = "jdbc:mysql://masterdb.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
      String dbUser = "root"; // Modify with RDS user ID
      String dbPassword = "Qwer1234!"; // Modified with RDS user password

      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Retrieve user information from the user table
        String query = "SELECT ID, PW, address, address1, phonenumber, Emergency FROM user WHERE ID=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, userId);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
          // Display user information
          String ID = resultSet.getString("ID");
          String PW = resultSet.getString("PW");
          String address = resultSet.getString("address");
          String address1 = resultSet.getString("address1");
          String phonenumber = resultSet.getString("phonenumber");
          String Emergency = resultSet.getString("Emergency");

          out.println("<p>ID: " + ID + "</p>");
          out.println("<p>PW: " + PW + "</p>");
          out.println("<p>Address: " + address + "</p>");
          out.println("<p>Address1: " + address1 + "</p>");
          out.println("<p>Phone Number: " + phonenumber + "</p>");
          out.println("<p>Emergency Contact: " + Emergency + "</p>");
        } else {
          out.println("User not found.");
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();
      } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
      }
    %>
  </div>
</body>
</html>
