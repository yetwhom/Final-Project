<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        #details_section {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        }
        p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h1>상세정보</h1>

    <div id="details_section">
        <%-- Get ID value selected from URL parameter --%>
        <% String selectedId = request.getParameter("id");
           int id = Integer.parseInt(selectedId);

           // DB connection variables
           String jdbcUrl = "jdbc:mysql://masterdb.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
           String dbUser = "root";
           String dbPassword = "Qwer1234!";
           Connection conn = null;
           PreparedStatement pstmt = null;
           ResultSet rs = null;
        %>

        <%-- DB connection attempt --%>
        <% try {
               // load the JDBC driver
               Class.forName("com.mysql.cj.jdbc.Driver");
               // DB connection
               conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
               // Execute SQL query
               String query = "SELECT * FROM shelter WHERE id = ?";
               pstmt = conn.prepareStatement(query);
               pstmt.setInt(1, id);
               rs = pstmt.executeQuery();

               // print the result
               if (rs.next()) {
                   // Get the detailed information you want here and print it.
                   // For example, it can be output using columns such as name, address, and scale.
                   String name = rs.getString("name");
                   String address = rs.getString("address");
                   String address2 = rs.getString("address2");
                   int scale = rs.getInt("scale");
                   Integer people = rs.getInt("people");
                   Integer food = rs.getInt("food");
                   Integer water = rs.getInt("water");
                   Integer medicine = rs.getInt("medicine");
                   Integer bedding = rs.getInt("bedding");

                   out.println("<p><strong>ID:</strong> " + id + "</p>");
                   out.println("<p><strong>이름:</strong> " + name + "</p>");
                   out.println("<p><strong>주소:</strong> " + address + "</p>");
                   out.println("<p><strong>상세주소:</strong> " + address2 + "</p>");
                   out.println("<p><strong>규모:</strong> " + scale + "</p>");
                   out.println("<p><strong>인원:</strong> " + (people == null ? "없음" : people) + "</p>");
                   out.println("<p><strong>식량:</strong> " + (food == null ? "없음" : food) + "</p>");
                   out.println("<p><strong>수자원:</strong> " + (water == null ? "없음" : water) + "</p>");
                   out.println("<p><strong>의약품:</strong> " + (medicine == null ? "없음" : medicine) + "</p>");
                   out.println("<p><strong>침구류:</strong> " + (bedding == null ? "없음" : bedding) + "</p>");
                   // You can print additional information as needed.
               } else {
                   out.println("<p>해당 ID의 정보를 찾을 수 없습니다.</p>");
               }
           } catch (ClassNotFoundException e) {
               out.println("<p>JDBC 드라이버를 찾을 수 없습니다.</p>");
               e.printStackTrace();
           } catch (SQLException e) {
               out.println("<p>데이터베이스 연결 중 오류가 발생했습니다.</p>");
               e.printStackTrace();
           } finally {
               // 연결 종료 처리
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
    </div>
</body>
</html>
