<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 로그인 정보를 세션에 저장하는 부분 추가 --%>
<%
  String userId = (String) session.getAttribute("userId"); // 세션에서 userId 가져오기
  if (userId != null) {
    // 이미 로그인한 사용자는 userId를 세션에 저장
    session.setAttribute("userId", userId);
  } else {
    // 로그인 페이지에서 리다이렉트된 경우, 로그인 정보를 세션에 저장
    String newUserId = request.getParameter("userId"); // 로그인 페이지에서 전달된 userId 매개변수
    if (newUserId != null && !newUserId.isEmpty()) {
      session.setAttribute("userId", newUserId);
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Main 페이지</title>
  <style type="text/css">
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
  color: rgb(0, 0, 0);
}

/* 색상에 따라 상자 높이 조정 */
.box-1 {
  height: 10%; /* 높이로 변경 */
  background-color: rgb(255, 255, 255);
  position: relative; /* 자식 요소를 부모 요소를 기준으로 배치하기 위해 추가 */
  border: black 1px solid;
}

/* Divide the 70% area in half in the middle */
.box-2 {
  height: 70%; /* 높이로 변경 */
  background-color: rgb(255, 255, 255);
  display: flex;
  flex-direction: row; /* 왼쪽과 오른쪽으로 정렬 */
}

/* left 50% */
.box-2-left {
  flex-grow: 1;
  background-color: rgb(255, 255, 255); /* 반투명 스타일로 표시 */
  border: black 1px solid;
}

/* Right 50% */
.box-2-right {
  flex-grow: 1;
  background-color: rgb(255, 255, 255); /* 반투명 스타일로 표시 */
  border: black 1px solid;
}

/* Divide the 20% area into three on both sides */
.box-3 {
  height: 20%; /* 높이로 변경 */
  background-color: rgb(255, 255, 255);
  display: flex;
  flex-direction: row; /* 왼쪽과 오른쪽으로 정렬 */
}

/* Left 33.33% */
.box-3-left {
  flex-grow: 1;
  background-color: rgba(255, 255, 255, 0.5); /* 반투명 스타일로 표시 */
  border: black 1px solid;
}

/* center 33.33% */
.box-3-middle {
  flex-grow: 1;
  background-color: rgba(255, 255, 255, 0.5); /* 반투명 스타일로 표시 */
  border: black 1px solid;
}

/* Right 33.33% */
.box-3-right {
  flex-grow: 1;
  background-color: rgba(255, 255, 255, 0.5); /* 반투명 스타일로 표시 */
  border: black 1px solid;
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
    <div class="box box-1">
      <a href="afloginmain.jsp">
        <img src="2.png" alt="로고 이미지">
      </a>
      <% if (session.getAttribute("userId") != null) { %>
        <form method="post" action="<%=request.getContextPath()%>/afloginmain.jsp?action=logout">
          <button type="submit" class="logout-button">로그아웃</button>
        </form>
      <% } %>
    </div>

    <div class="box box-2">
      <div class="box-2-left">
        <p>현재 재난 경보</p>
      </div>
      <div class="box-2-right">
        <p>실시간 뉴스</p>
      </div>
    </div>

    <div class="box box-3">
      <div class="box-3-left">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="javascript:void(0)" onclick="showPopup()">비상 연락처 추가</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="box-3-middle">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/showtable.jsp">대피소 목록</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="box-3-right">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/showinfo.jsp">내 정보</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <% if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
    session.invalidate(); // 세션 무효화
    response.sendRedirect("index.jsp"); // 로그아웃 후 index.jsp로 이동
  } %>
</body>
<script>
  function showPopup() {
    alert("추후에 업데이트 예정입니다.");
  }
</script>
</html>
