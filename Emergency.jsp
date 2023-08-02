<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Information</title>
  <link rel="stylesheet" href="style.css"> <!-- style.css 파일에 대한 링크 추가 -->
</head>
<body>
  <div class="information-container">
    <h2>User Information</h2>
    <%-- 세션에서 사용자 ID와 비상 연락처 가져오기 --%>
    <% 
      String userId = (String) session.getAttribute("userId");
      String userEmergencyContact = (String) session.getAttribute("userEmergencyContact");
    %>

    <%-- 사용자 정보 가져오기를 위한 데이터베이스 연결 --%>
    <% 
    String dbURL = "jdbc:mysql://masterdb.cjjvm5nexheu.ap-southeast-1.rds.amazonaws.com:3306/team3";
    String dbUser = "root"; // RDS 사용자 ID로 수정
    String dbPassword = "Qwer1234!"; // RDS 사용자 비밀번호로 수정

    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

      // 사용자 정보 조회
      String query = "SELECT * FROM user WHERE ID=?";
      PreparedStatement preparedStatement = connection.prepareStatement(query);
      preparedStatement.setString(1, userId);
      ResultSet resultSet = preparedStatement.executeQuery();

      if (resultSet.next()) {
        String name = resultSet.getString("name");
        String address = resultSet.getString("address");
        String address1 = resultSet.getString("address1");
        String phoneNumber = resultSet.getString("phonenumber");
        String emergencyContact = resultSet.getString("Emergency");

        // 폼 구성: 비상 연락처 값만 수정 가능하도록 함
        %>
        <form method="post">
          <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= name %>" readonly>
          </div>
          <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= address %>" readonly>
          </div>
          <div class="form-group">
            <label for="address1">Address1:</label>
            <input type="text" id="address1" name="address1" value="<%= address1 %>" readonly>
          </div>
          <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="<%= phoneNumber %>" readonly>
          </div>
          <div class="form-group">
            <label for="emergencyContact">Emergency Contact:</label>
            <input type="text" id="emergencyContact" name="emergencyContact" value="<%= emergencyContact %>" required>
          </div>
          <button type="submit" class="update-button" disabled>Update</button> <!-- 비상 연락처 외 다른 정보는 수정할 수 없음 -->
        </form>
        <%
      } else {
        out.println("사용자 정보를 찾을 수 없습니다.");
      }

      resultSet.close();
      preparedStatement.close();
      connection.close();
    } catch (Exception e) {
      out.println("오류가 발생했습니다: " + e.getMessage());
    }
    %>
  </div>
</body>
</html>

<%-- 폼 제출 처리를 위한 JSP 코드 시작 --%>
<%
  if (request.getMethod().equalsIgnoreCase("post")) {
    String emergencyContact = request.getParameter("emergencyContact");
    
    // 사용자 정보 업데이트를 위한 데이터베이스 연결
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

      // 비상 연락처 값만 업데이트
      String query = "UPDATE user SET Emergency=? WHERE ID=?";
      PreparedStatement preparedStatement = connection.prepareStatement(query);
      preparedStatement.setString(1, emergencyContact);
      preparedStatement.setString(2, userId);
      int rowsUpdated = preparedStatement.executeUpdate();

      if (rowsUpdated > 0) {
        out.println("비상 연락처가 성공적으로 업데이트되었습니다.");
        // 세션의 비상 연락처 값도 업데이트
        session.setAttribute("userEmergencyContact", emergencyContact);
      } else {
        out.println("업데이트에 실패했습니다. 비상 연락처를 다시 확인해주세요.");
      }

      preparedStatement.close();
      connection.close();
    } catch (Exception e) {
      out.println("오류가 발생했습니다: " + e.getMessage());
    }
  }
%>
<%-- 폼 제출 처리를 위한 JSP 코드 끝 --%>
