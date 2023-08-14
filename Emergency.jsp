<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Information</title>
  <link rel="stylesheet" href="style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .information-container {
      background-color: white;
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    .information-container h2 {
      margin-top: 0;
    }
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }
    .update-button {
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
    .update-button:hover {
      background-color: #0056b3;
    }
    .return-button {
      color: #007bff;
      text-decoration: none;
      margin-top: 10px;
      display: inline-block;
    }
    .return-button:hover {
      text-decoration: underline;
    }
  </style>
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
    String dbURL = "jdbc:mysql://masterdb.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
    String dbUser = "root"; // RDS 사용자 ID로 수정
    String dbPassword = "Qwer1234!"; // RDS 사용자 비밀번호로 수정

    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

      // 사용자 정보 조회
      String query = "SELECT name, address, address1, phonenumber, Emergency FROM user WHERE ID=?";
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
            <label for="emergencyContact">Emergency Contact:</label>
            <input type="text" id="emergencyContact" name="emergencyContact" value="<%= emergencyContact %>" required>
          </div>
          <button type="submit" class="update-button">Update</button> <!-- 비상 연락처 외 다른 정보는 수정할 수 없음 -->
        </form>
        <a href="afloginmain.jsp" class="return-button">돌아가기</a> <!-- "돌아가기" 버튼을 누를 때 afloginmain.jsp로 이동 -->
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
