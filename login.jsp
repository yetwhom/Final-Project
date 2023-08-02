<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 페이지</title>
  <link rel="stylesheet" href="style.css"> <!-- style.css 파일에 대한 링크 추가 -->
</head>
<body>
  <div class="login-container">
    <h2>로그인</h2>
    <form method="post">
      <div class="form-group">
        <label for="username">사용자 이름:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <button type="submit" class="login-button">로그인</button>
    </form>
    <p>아직 계정이 없으신가요? <a href="signup.jsp">회원가입</a></p>
  </div>

  <%-- 로그인 처리 JSP 코드 시작 --%>
  <%
    if (request.getMethod().equalsIgnoreCase("post")) {
      // 로그인 처리를 위한 RDS 연결 정보 설정
      String dbURL = "jdbc:mysql://masterdb.cjjvm5nexheu.ap-southeast-1.rds.amazonaws.com:3306/team3";
      String dbUser = "root"; // RDS 사용자 ID로 수정
      String dbPassword = "Qwer1234!"; // RDS 사용자 비밀번호로 수정

      String enteredUsername = request.getParameter("username");
      String enteredPassword = request.getParameter("password");

      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // 사용자 테이블에서 입력한 사용자 ID와 비밀번호 확인
        String query = "SELECT * FROM user WHERE ID=? AND PW=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, enteredUsername);
        preparedStatement.setString(2, enteredPassword);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
          // 로그인 성공: 세션에 사용자 정보 저장하고 메인 페이지로 이동
          String userId = resultSet.getString("ID");
          session.setAttribute("userId", userId); // 사용자 ID를 세션에 저장
          response.sendRedirect("main.jsp"); // 로그인 성공 시 메인 페이지로 이동
        } else {
          // 로그인 실패: 오류 메시지 표시 또는 다시 로그인 페이지로 이동
          out.println("로그인에 실패했습니다. 다시 시도해주세요.");
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();
      } catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
      }
    }
  %>
  <%-- 로그인 처리 JSP 코드 종료 --%>
</body>
</html>
