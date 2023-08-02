<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>세 개의 div로 분할</title>
  <link rel="stylesheet" href="style.css"> <!-- style.css 파일에 대한 링크 추가 -->
</head>
<body>
  <div class="container">
    <!-- 상단 10% -->
    <div class="box box-1">
      <a href="index.html">
        <img src=".png" alt="로고 이미지">
      </a>
      <!-- 로그인 버튼 클릭 시 login.jsp로 이동 -->
      <a href="login.jsp" class="login-button">로그인</a>
    </div>

    <!-- 상단 70%를 가로로 분할 -->
    <div class="box box-2">
      <!-- 상단 왼쪽 50% -->
      <div class="box-2-left">
        <p>현재 재난 경보</p>
      </div>
      <!-- 상단 오른쪽 50% -->
      <div class="box-2-right">
        <p>실시간 뉴스</p>
      </div>
    </div>

    <!-- 상단 20%를 가로로 세 개로 분할 -->
    <div class="box box-3">
      <!-- 상단 왼쪽 33.33% -->
      <div class="box-3-left">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/notice;no=3">재난 발생 시 대처 방법</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- 상단 가운데 33.33% -->
      <div class="box-3-middle">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/notice;no=2">대피소 목록</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- 상단 오른쪽 33.33% -->
      <div class="box-3-right">
        <table class="float" width="228" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td value="top">
                <table>
                  <tbody>
                    <tr><td height="10"> <a href="/notice;no=1">업데이트</a></td></tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>
