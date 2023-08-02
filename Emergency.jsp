<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Emergency contact network settings</title>
  <link rel="stylesheet" href="style.css"> <!-- Add a link to the style.css file -->
</head>
<body>
  <div class="emergency-container">
    <h2>Emergency contact network settings</h2>

    <%-- Emergency contact phone number input form --%>
    <form method="post" action="<%=request.getContextPath()%>/Emergency.jsp">
      <div class="form-group">
        <label for="Emergency">Phone Number:</label>
        <input type="text" id="Emergency" name="Emergency" required>
      </div>
      <button type="submit" class="save-button">Save</button>
      <%-- Click the Back button to go to the afloginmain.jsp page --%>
      <a href="afloginmain.jsp" class="return-button">Previous</a>
    </form>

    <%-- Start JSP code to save emergency phone number to database --%>
    <%!
      void saveEmergencyPhoneNumber(String userId, String emergencyPhoneNumber) {
        try {
          // set RDS connection information
          String dbURL = "jdbc:mysql://masterdb.cjjvm5nexheu.ap-southeast-1.rds.amazonaws.com:3306/team3";
          String dbUser = "root"; // Modify with RDS user ID
          String dbPassword = "Qwer1234!"; // modified with RDS user password

          Class.forName("com.mysql.jdbc.Driver");
          Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

          // Update the record corresponding to the user ID in the users table
          String updateQuery = "UPDATE user SET Emergency=? WHERE ID=?";
          PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
          updateStatement.setString(1, emergencyPhoneNumber);
          updateStatement.setString(2, userId);
          updateStatement.executeUpdate();

          updateStatement.close();
          connection.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    %>

    <%
      // Get user ID stored in session
      String userId = (String) session.getAttribute("userId");

      // Get the current emergency phone number from the database
      String currentEmergencyPhoneNumber = "";

      try {
        // set RDS connection information
        String dbURL = "jdbc:mysql://masterdb.cjjvm5nexheu.ap-southeast-1.rds.amazonaws.com:3306/team3";
        String dbUser = "root"; // Modify with RDS user ID
        String dbPassword = "Qwer1234!"; // modified with RDS user password

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Retrieve the emergency phone number from the database
        String selectQuery = "SELECT Emergency FROM user WHERE ID=?";
        PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
        selectStatement.setString(1, userId);
        ResultSet resultSet = selectStatement.executeQuery();

        if (resultSet.next()) {
          currentEmergencyPhoneNumber = resultSet.getString("Emergency");
        }

        resultSet.close();
        selectStatement.close();
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>

    <script>
      // Set the current emergency phone number as the initial value in the input field
      document.addEventListener('DOMContentLoaded', function() {
        var emergencyInput = document.getElementById('Emergency');
        emergencyInput.value = '<%= currentEmergencyPhoneNumber %>';
      });
    </script>

    <%-- end of JSP code to retrieve current emergency phone number from database --%>

    <%-- Save the modified emergency phone number --%>
    <% if (request.getMethod().equalsIgnoreCase("post")) {
      String emergencyPhoneNumber = request.getParameter("Emergency");
      saveEmergencyPhoneNumber(userId, emergencyPhoneNumber);
    } %>
    <%-- End of JSP code to save emergency phone number to database --%>

  </div>
</body>
</html>
