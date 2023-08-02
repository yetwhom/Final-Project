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

    <%-- 비상연락망 전화번호 입력 폼 --%>
    <form method="post" action="<%=request.getContextPath()%>/Emergency.jsp">
      <div class="form-group">
        <label for="Emergency">전화번호:</label>
        <input type="text" id="Emergency" name="Emergency" required>
      </div>
      <button type="submit" class="save-button">저장</button>
      <%-- 이전으로 버튼을 클릭하면 afloginmain.jsp 페이지로 이동하도록 함 --%>
      <a href="afloginmain.jsp" class="return-button">이전으로</a>
    </form>

    <%-- 비상연락망 전화번호를 데이터베이스에 저장하는 JSP 코드 시작 --%>
    <%
      if (request.getMethod().equalsIgnoreCase("post")) {
        String Emergency = request.getParameter("Emergency");

        // 세션에 저장된 사용자 ID 가져오기
        String userId = (String) session.getAttribute("userId");

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
          updateStatement.setString(2, userId);
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
</body>
</html>
