<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 정보 가져오기</title>
</head>
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
    #search_section {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        margin-bottom: 20px;
    }
    #search_box {
        width: 70%;
        height: 40px;
        font-size: 16px;
        text-align: center;
    }
    #search_button, #all_button {
        width: 15%;
        height: 40px;
        background-color: #3498db;
        border: none;
        color: white;
        cursor: pointer;
        font-size: 16px;
        margin-left: 10px;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>
<body>
    <h1>DB 테이블 정보</h1>
    <div id="search_section" style="display: flex; flex-direction: row; align-items: center;">
        <form action="/main" style="width: 50%; display: flex; flex-direction: row; align-items: center; justify-content: space-evenly;">
            <input type="text" id="search_box" name="keyword" style="width: 80%; height: 40px; font-size: 20px; text-align: center;">
            <input type="button" value="find" onclick="search()" style="width: 10%; height: 45px;">
            <input type="button" value="All" onclick="showAllItems()" style="width: 10%; height: 45px;">
        </form>
    </div>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>주소</th>
            <th>상세주소</th>
            <th>규모</th>
            <th>인원</th>
        </tr>
        <%
            // DB 연결 변수들
            String jdbcUrl = "jdbc:mysql://masterdb.cipbbjwk95ru.ap-northeast-2.rds.amazonaws.com:3306/team3";
            String dbUser = "root";
            String dbPassword = "Qwer1234!";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            // DB 연결 시도
            try {
                // JDBC 드라이버 로드
                Class.forName("com.mysql.cj.jdbc.Driver");
                // DB 연결
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                stmt = conn.createStatement();
                
                // SQL 쿼리 실행
                String keyword = request.getParameter("keyword");
                String sql = "SELECT * FROM shelter";
                if (keyword != null && !keyword.trim().isEmpty()) {
                    sql += " WHERE name LIKE '%" + keyword  + "%' OR address LIKE '%" + keyword + "%' OR address2 LIKE '%" + keyword + "%' OR scale LIKE '%" + keyword + "%' OR people LIKE '%" + keyword + "%'";
                }
                
                rs = stmt.executeQuery(sql);
                
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
    <script>
        function search() {
            document.forms[0].action = "showtable.jsp?keyword=" + encodeURIComponent(document.getElementById("search_box").value);
            document.forms[0].submit();
        }
        function showAllItems() {
            document.forms[0].action = "showtable.jsp";
            document.forms[0].submit();
        }
    </script>
</body>
</html>
