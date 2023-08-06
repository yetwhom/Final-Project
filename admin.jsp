<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Main page</title>
  <link rel="stylesheet" href="style.css"> <!-- Add a link to the style.css file -->
</head>
<body>
  <div class="container">
    <!-- Top 10% -->
    <div class="box box-1">
      <a href="admin.jsp">
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
                    <tr><td height="10"> <a href="/">재난 발생시 대처 방법</a></td></tr>
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
                    <tr><td height="10"> <a href="/edit.jsp">정보 수정 </a></td></tr>
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
