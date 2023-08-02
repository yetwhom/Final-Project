<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Emergency 설정</title>
</head>
<body>
    <% 
        HttpSession session = request.getSession();
        boolean loggedIn = session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn");
        String ID = (String) session.getAttribute("ID");
        String EmergencyValue = (String) session.getAttribute("Emergency");
        
        if (!loggedIn) {
            // 로그인이 안 된 경우 로그인 페이지로 이동
            response.sendRedirect("login.html");
        } else {
            // 로그인 된 경우 설정 폼과 값 업데이트 표시
    %>
            <h1>환영합니다, <%= id %>님!</h1>
            <h2>Emergency 설정</h2>
            <form action="Emergency.jsp" method="post">
                <label for="emergencyValue">Emergency 값:</label>
                <input type="text" id="emergencyValue" name="emergencyValue" value="<%= emergencyValue %>">
                <input type="submit" value="변경">
            </form>
    <% 
            // 값 업데이트 후 메시지 표시
            String updatedEmergency = request.getParameter("updatedEmergency");
            if (updatedEmergency != null) {
                out.println("<p>Emergency 값이 업데이트되었습니다. 현재 Emergency 값: " + updatedEmergency + "</p>");
            }
    %>
            <a href="/afloginmain.jsp">돌아가기</a>
    <% 
        }
    %>
</body>
</html>
