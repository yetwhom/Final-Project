<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>비상연락망 설정</title>
  <link rel="stylesheet" href="style.css"> <!-- style.css 파일에 대한 링크 추가 -->
</head>
<body>
  <div class="emergency-container">
    <h2>비상연락망 설정</h2>
    <%-- 세션에 사용자 ID가 존재하면 로그아웃 버튼을 보여줌 --%>
    <% if (session.getAttribute("userId") != null) { %>
      <form method="post" action="<%=request.getContextPath()%>/Emergency.jsp?action=logout">
        <button type="submit" class="logout-button">로그아웃</button>
      </form>
    <% } else { %>
      <%-- 세션에 사용자 ID가 없으면 로그인 버튼을 보여줌 --%>
      <a href="login.jsp" class="login-button">로그인</a>
    <% } %>

    <%-- 비상연락망 전화번호 입력 폼 --%>
    <form method="post" action="<%=request.getContextPath()%>/Emergency.jsp">
      <div class="form-group">
        <label for="emergencyNumber">전화번호:</label>
        <input type="text" id="emergencyNumber" name="emergencyNumber" required>
      </div>
      <button type="submit" class="save-button">저장</button>
    </form>

    <%-- 비상연락망 전화번호를 데이터베이스에 저장하는 JSP 코드 시작 --%>
    <%
      if (request.getMethod().equalsIgnoreCase("post")) {
        String Emergency = request.getParameter("Emergency");

        // 세션에 저장된 사용자 ID 가져오기
        String ID = (String) session.getAttribute("ID");

        // 데이터베이스에 비상연락망 전화번호를 저장하는 로직 작성 (예시로는 user 테이블에 필드를 추가하여 저장하는 것으로 가정)
        try {
          // RDS 연결 정보 설정
          String dbURL = "jdbc:mysql://masterdb.cjjvm5nexheu.ap-southeast-1.rds.amazonaws.com:3306/team3";
          String dbUser = "root"; // RDS 사용자 ID로 수정
          String dbPassword = "Qwer1234!"; // RDS 사용자 비밀번호로 수정

          Class.forName("com.mysql.jdbc.Driver");
          Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

          // 사용자 테이블에서 사용자 ID에 해당하는 레코드 업데이트
          String updateQuery = "UPDATE user SET Emergency=? WHERE ID=?";
          PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
          updateStatement.setString(1, Emergency);
          updateStatement.setString(2, ID);
          updateStatement.executeUpdate();

          updateStatement.close();
          connection.close();
        } catch (Exception e) {
          out.println("오류가 발생했습니다: " + e.getMessage());
        }
      }
    %>
    <%-- 비상연락망 전화번호를 데이터베이스에 저장하는 JSP 코드 끝 --%>
  </div>

  <%-- 로그아웃 처리 JSP 코드 시작 --%>
  <% if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
    // 로그아웃 처리: 세션 무효화 (로그아웃)
    session.invalidate();
    // index.jsp로 이동
    response.sendRedirect("index.jsp");
  } %>
  <%-- 로그아웃 처리 JSP 코드 종료 --%>
</body>
</html>
