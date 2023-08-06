<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>모든 정보 편집</title>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
        }
        .record {
            border: 1px solid #ccc;
            padding: 10px;
            width: 19%;
            margin: 1%;
        }
    </style>
</head>
<body>
    <h1>모든 정보 편집</h1>

    <div class="container">

        <%-- DB 연결 변수들 --%>
        <% String jdbcUrl = "jdbc:mysql://masterdb.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
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

               while (rs.next()) {
                   int id = rs.getInt("id");
                   String name = rs.getString("name");
                   String address = rs.getString("address");
                   String address2 = rs.getString("address2");
                   int scale = rs.getInt("scale");
                   Integer people = rs.getInt("people");
                   Integer food = rs.getInt("food");
                   Integer water = rs.getInt("water");
                   Integer medicine = rs.getInt("medicine");
                   Integer bedding = rs.getInt("bedding");

                   // 레코드를 5x10 형식으로 출력합니다.
                   out.println("<div class=\"record\">");
                   out.println("<h3>레코드 ID: " + id + "</h3>");
                   out.println("<form method=\"post\" action=\"edit.jsp\">");
                   out.println("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
                   out.println("<label>이름:</label>");
                   out.println("<input type=\"text\" name=\"name_" + id + "\" value=\"" + name + "\"><br>");
                   out.println("<label>주소:</label>");
                   out.println("<input type=\"text\" name=\"address_" + id + "\" value=\"" + address + "\"><br>");
                   out.println("<label>상세 주소:</label>");
                   out.println("<input type=\"text\" name=\"address2_" + id + "\" value=\"" + address2 + "\"><br>");
                   out.println("<label>규모:</label>");
                   out.println("<input type=\"number\" name=\"scale_" + id + "\" value=\"" + scale + "\"><br>");
                   out.println("<label>인원:</label>");
                   out.println("<input type=\"number\" name=\"people_" + id + "\" value=\"" + (people == null ? 0 : people) + "\"><br>");
                   out.println("<label>음식:</label>");
                   out.println("<input type=\"number\" name=\"food_" + id + "\" value=\"" + (food == null ? 0 : food) + "\"><br>");
                   out.println("<label>물:</label>");
                   out.println("<input type=\"number\" name=\"water_" + id + "\" value=\"" + (water == null ? 0 : water) + "\"><br>");
                   out.println("<label>약:</label>");
                   out.println("<input type=\"number\" name=\"medicine_" + id + "\" value=\"" + (medicine == null ? 0 : medicine) + "\"><br>");
                   out.println("<label>침구:</label>");
                   out.println("<input type=\"number\" name=\"bedding_" + id + "\" value=\"" + (bedding == null ? 0 : bedding) + "\"><br>");
                   out.println("<input type=\"submit\" value=\"저장\">");
                   out.println("</form>");
                   out.println("</div>");
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
    </div>
</body>
</html>
