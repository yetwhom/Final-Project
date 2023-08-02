<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Split into three divs</title>
  <link rel="stylesheet" href="style.css"> <!-- style.css 파일과 연결 -->
</head>
<body>
  <div class="container">
    <!-- Top 10% -->
    <div class="box box-1">
      <a href="index.html">
        <img src="2.png" alt="logo image">
      </a>
      <!-- 로그인 버튼 클릭 시 login.jsp로 이동 -->
      <div style="position: absolute; top: 0; right: 0; height: 100%; display: flex; align-items: center; padding-right: 20px;">
        <a href="login.jsp" class="login-button">Login</a>
      </div>
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
                    <tr>
                      <td height="10">
                        <a href="javascript:void(0)" onclick="showPopup()">What to do in case of disaster</a>
                      </td>
                    </tr>
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
                    <tr>
                      <td height="10">
                        <a href="/showtable.jsp">List of shelters</a>
                      </td>
                    </tr>
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
                    <tr>
                      <td height="10">
                        <a href="javascript:void(0)" onclick="showPopup()">Update</a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Popup Script -->
  <script>
    function showPopup() {
      alert("추후에 업데이트 예정입니다.");
    }
  </script>
</body>
</html>
