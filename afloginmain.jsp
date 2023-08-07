<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Main page</title>
  <style type="text/css"><!-- Add a link to the style.css file -->
  /* style.css */

/* 공통 스타일 */
body, html {
  height: 100%;
  margin: 0;
}

.container {
  height: 100%;
  display: flex;
  flex-direction: column; /* 위에서 아래로 정렬 */
}

.box {
  flex-grow: 1;
  text-align: center;
  font-size: 20px;
  font-weight: bold;
  color: white;
}

/* 색상에 따라 상자 높이 조정 */
.box-1 {
  height: 10%; /* 높이로 변경 */
  background-color: rgb(206, 33, 33);
  position: relative; /* 자식 요소를 부모 요소를 기준으로 배치하기 위해 추가 */
}

/* Divide the 70% area in half in the middle */
.box-2 {
  height: 70%; /* 높이로 변경 */
  background-color: rgb(35, 35, 190);
  display: flex;
  flex-direction: row; /* 왼쪽과 오른쪽으로 정렬 */
}

/* left 50% */
.box-2-left {
  flex-grow: 1;
  background-color: rgba(48, 134, 70, 0.5); /* 반투명 스타일로 표시 */
}

/* Right 50% */
.box-2-right {
  flex-grow: 1;
  background-color: rgba(192, 30, 233, 0.5); /* 반투명 스타일로 표시 */
}

/* Divide the 20% area into three on both sides */
.box-3 {
  height: 20%; /* 높이로 변경 */
  background-color: green;
  display: flex;
  flex-direction: row; /* 왼쪽과 오른쪽으로 정렬 */
}

/* Left 33.33% */
.box-3-left {
  flex-grow: 1;
  background-color: rgba(0, 128, 128, 0.5); /* 반투명 스타일로 표시 */
}

/* center 33.33% */
.box-3-middle {
  flex-grow: 1;
  background-color: rgba(255, 165, 0, 0.5); /* 반투명 스타일로 표시 */
}

/* Right 33.33% */
.box-3-right {
  flex-grow: 1;
  background-color: rgba(128, 0, 128, 0.5); /* 반투명 스타일로 표시 */
}

/* 로고 이미지 스타일 조정 */
.box-1 img {
  max-height: 100%; /* 로고 이미지가 10% 영역을 넘어가지 않도록 최대 높이 설정 */
  max-width: 100%; /* 로고 이미지가 10% 영역을 넘어가지 않도록 최대 너비 설정 */
  display: block; /* 이미지를 다른 요소와 정렬하기 위해 블록 요소로 설정 */
  margin: 0 auto; /* 이미지를 수평으로 가운데로 정렬 */
}

/* 로그인 버튼 스타일 조정 */
.login-button {
  text-decoration: none;
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  margin-left: auto; /* 로그인 버튼을 오른쪽으로 이동 */
}

/* 로그아웃 버튼 스타일 조정 */
.logout-button {
  position: absolute;
  top: 50%; /* 로그인 버튼을 수직으로 가운데로 이동 */
  right: 10px;
  padding: 5px 10px;
  font-size: 16px;
  line-height: 20px;
  transform: translateY(-50%); /* 요소의 높이의 절반만큼 위로 이동하여 수직 가운데 정렬 */
}
  </style>
</head>
<body>
  <div class="container">
    <!-- Top 10% -->
    <div class="box box-1">
      <a href="afloginmain.jsp">
        <img src="2.png" alt="logo image">
      </a>
      <%-- Show logout button if user ID exists in session --%>
      <% if (session.getAttribute("userId") != null) { %>
        <form method="post" action="<%=request.getContextPath()%>/afloginmain.jsp?action=logout">
          <button type="submit" class="logout-button">Logout</button>
        </form>
      <% } else { %>
        <%-- If there is no user ID in session, show login button --%>
        <a href="login.jsp" class="login-button">Login</a>
      <% } %>
    </div>

    <!-- split top 70% horizontally -->
    <div class="box box-2">
      <!-- Top Left 50% -->
      <div class="box-2-left">
        <p>Current Disaster Alert</p>
      </div>
      <!-- top right 50% -->
      <div class="box-2-right">
        <p>Real-time news</p>
      </div>
    </div>

    <!-- split the top 20% horizontally into three -->
    <div class="box box-3">
      <!-- top left 33.33% -->
      <div class="box-3-left">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/Emergency.jsp">Add emergency contact</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- top middle 33.33% -->
      <div class="box-3-middle">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/showtable.jsp">List of shelters</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- top right 33.33% -->
      <div class="box-3-right">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/showinfo.jsp">my info</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <%-- start logout handling JSP code --%>
  <% if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
    // handle logout: session invalidation (logout)
    session.invalidate();
    // go to index.jsp
    response.sendRedirect("index.jsp");
  } %>
  <%-- Exit logout handling JSP code --%>
</body>
</html>
