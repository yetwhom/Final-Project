<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 정보 가져오기</title>
</head>
<body>
    <h1>DB 테이블 정보</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>주소</th>
            <th>상세주소</th>
            <th>규모</th>
            <th>인원</th>
        </tr>
        <%-- DB 연결 변수들 --%>
        <% String jdbcUrl = "jdbc:mysql://test-db.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
           String dbUser = "root";
           String dbPassword = "Qwer1234!";
           Connection conn = null;
           Statement stmt = null;
           ResultSet rs = null;
        %>

        <%-- DB 연결 시도 --%>
        <% try {
               // JDBC 드라이버 로드
               Class.forName("com.mysql.jdbc.Driver");
               // DB 연결
               conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
               // SQL 쿼리 실행
               String query = "SELECT * FROM shelter";
               stmt = conn.createStatement();
               rs = stmt.executeQuery(query);

               // 결과 출력
               while (rs.next()) {
                   int id = rs.getInt("id");
                   String name = rs.getString("name");
                   String address = rs.getString("address");
                   String address2 = rs.getString("address2");
                   int scale = rs.getInt("scale");
                   Integer people = rs.getInt("people");


                   out.println("<tr>");
                    out.println("<td><a href=\"detail.jsp?id=" + id + "\">" + id + "</a></td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + address + "</td>");
                    out.println("<td>" + address2 + "</td>");
                    out.println("<td>" + scale + "</td>");
                    out.println("<td>" + people + "</td>");
                    out.println("</tr>");
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
             if (stmt != null) {
                 try {
                     stmt.close();
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
  </table>
 </body>
 </html>
 