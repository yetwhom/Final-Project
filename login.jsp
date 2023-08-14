<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 페이지</title>
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
    .login-container {
      background-color: white;
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    .login-container h2 {
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
    .login-button {
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
    .login-button:hover {
      background-color: #0056b3;
    }
    p {
      margin-top: 15px;
    }
    a {
      color: #007bff;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>
    <form method="post">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <button type="submit" class="login-button">login</button>
    </form>
    <p>Don't have an account yet? <a href="signup.jsp">Sign up</a></p>
  </div>

  <%-- 로그인 처리를 위한 JSP 코드 시작 --%>
  <%
    if (request.getMethod().equalsIgnoreCase("post")) {
      // RDS 연결 정보 설정
      String dbURL = "jdbc:mysql://masterdb.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
      String dbUser = "root"; // RDS 사용자 ID로 수정
      String dbPassword = "Qwer1234!"; // RDS 사용자 비밀번호로 수정

      String enteredUsername = request.getParameter("username");
      String enteredPassword = request.getParameter("password");

      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // 사용자 테이블에서 입력한 사용자 ID와 비밀번호를 확인합니다.
        String query = "SELECT * FROM user WHERE ID=? AND PW=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, enteredUsername);
        preparedStatement.setString(2, enteredPassword);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
          // 로그인 성공: 세션에 사용자 정보 저장 후 해당 페이지로 이동
          String userId = resultSet.getString("ID");
          session.setAttribute("userId", userId); // 사용자 ID를 세션에 저장
          String name = resultSet.getString("name"); // 사용자 이름 정보를 가져옴

          if ("admin".equals(name)) {
            response.sendRedirect("admin.jsp"); // 만약 사용자가 관리자인 경우 admin.jsp로 이동
          } else {
            response.sendRedirect("afloginmain.jsp"); // 관리자가 아닌 경우 afloginmain.jsp로 이동
          }
        } else {
          // 로그인 실패: 에러 메시지 표시 또는 로그인 페이지로 이동
          out.println("로그인 실패. 다시 시도해주세요.");
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();
      } catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
      }
    }
  %>
  <%-- 로그인 처리를 위한 JSP 코드 끝 --%>
</body>
</html>
