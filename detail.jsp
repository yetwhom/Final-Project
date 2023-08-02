<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세 정보</title>
</head>
<body>
    <h1>상세 정보</h1>

    <%-- URL 파라미터에서 선택된 ID 값 가져오기 --%>
    <% String selectedId = request.getParameter("id");
       int id = Integer.parseInt(selectedId);

       // DB 연결 변수들
       String jdbcUrl = "jdbc:mysql://masterdb.cjjvm5nexheu.ap-southeast-1.rds.amazonaws.com:3306/team3";
       String dbUser = "root";
       String dbPassword = "Qwer1234!";
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
    %>

    <%-- DB 연결 시도 --%>
    <% try {
           // JDBC 드라이버 로드
           Class.forName("com.mysql.jdbc.Driver");
           // DB 연결
           conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
           // SQL 쿼리 실행
           String query = "SELECT * FROM shelter WHERE id = ?";
           pstmt = conn.prepareStatement(query);
           pstmt.setInt(1, id);
           rs = pstmt.executeQuery();

           // 결과 출력
           if (rs.next()) {
               // 여기서 원하는 상세 정보를 가져와서 출력합니다.
               // 예를 들어, name, address, scale 등의 컬럼을 활용하여 출력 가능합니다.
               String name = rs.getString("name");
               String address = rs.getString("address");
               String address2 = rs.getString("address2");
               int scale = rs.getInt("scale");
               Integer people = rs.getInt("people");
               Integer food = rs.getInt("food");
               Integer water = rs.getInt("water");
               Integer medicine = rs.getInt("medicine");
               Integer bedding = rs.getInt("bedding");

               out.println("<p>ID: " + id + "</p>");
               out.println("<p>이름: " + name + "</p>");
               out.println("<p>주소: " + address + "</p>");
               out.println("<p>상세 주소: " + address2 + "</p>");
               out.println("<p>규모: " + scale + "</p>");
               out.println("<p>인원: " + (people == null ? "없음" : people) + "</p>");
               out.println("<p>음식: " + (food == null ? "없음" : food) + "</p>");
               out.println("<p>물: " + (water == null ? "없음" : water) + "</p>");
               out.println("<p>약: " + (medicine == null ? "없음" : medicine) + "</p>");
               out.println("<p>침구: " + (bedding == null ? "없음" : bedding) + "</p>");
               // 필요한 정보들을 추가로 출력하시면 됩니다.
           } else {
               out.println("<p>해당하는 ID의 정보를 찾을 수 없습니다.</p>");
           }
       } catch (ClassNotFoundException e) {
           out.println("<p>JDBC 드라이버를 찾을 수 없습니다.</p>");
           e.printStackTrace();
       } catch (SQLException e) {
           out.println("<p>DB 연결 중 오류가 발생했습니다.</p>");
           e.printStackTrace();
       } finally {
           // 연결 종료
           if (rs != null) {
               try {
                   rs.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
           if (pstmt != null) {
               try {
                   pstmt.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
           if (conn != null) {
               try {
                   conn.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
       }
    %>
</body>
</html>

