<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wifi.publicwifilocator.dto.WifiDto" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    double lat = request.getParameter("lat") == null ? 0.0 : Double.parseDouble(request.getParameter("lat"));
    double lnt = request.getParameter("lnt") == null ? 0.0 : Double.parseDouble(request.getParameter("lnt"));
    ArrayList<WifiDto> list = (ArrayList<WifiDto>) session.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>와이파이 정보 구하기</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script>
        function getPosition() {
            const latInput = document.getElementById("lat");
            const lntInput = document.getElementById("lnt");

            navigator.geolocation.getCurrentPosition((position) => {
                latInput.value = position.coords.latitude;
                lntInput.value = position.coords.longitude;
            });
        }
    </script>
</head>
<body>
<h1>와이파이 정보 구하기</h1>
<div class="buttons">
    <a href="/">홈</a> |
    <a href="history.jsp">위치 히스토리 목록</a> |
    <a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a> |
    <a href="bookmark-list.jsp">북마크 보기</a> |
    <a href="bookmark-group.jsp">북마크 그룹 관리</a>
</div>

<form action="fetch-wifi-data.jsp" method="post">
    <label for="lat">
        LAT: <input type="text" id="lat" name="lat" value="<%= lat %>"/> ,
    </label>
    <label for="lnt">
        LNT: <input type="text" id="lnt" name="lnt" value="<%= lnt %>"/>
    </label>
    <input type="button" id="pos_btn" value="내 위치 가져오기" onclick="getPosition()">
    <input type="submit" value="근처 WIFI 정보 보기">
</form>

<table>
    <thead>
    <tr>
        <th>거리(Km)</th>
        <th>관리번호</th>
        <th>자치구</th>
        <th>와이파이명</th>
        <th>도로명주소</th>
        <th>상세주소</th>
        <th>설치위치(층)</th>
        <th>설치유형</th>
        <th>설치기관</th>
        <th>서비스구분</th>
        <th>망 종류</th>
        <th>설치년도</th>
        <th>실내외구분</th>
        <th>WIFI 접속환경</th>
        <th>X 좌표</th>
        <th>Y 좌표</th>
        <th>작업 일자</th>
    </tr>
    </thead>
    <tbody>
    <% if (lat == 0.0 && lnt == 0.0) { %>
    <tr>
        <td colspan="17" class="table_blank">위치 정보를 입력한 후에 조회해 주세요.</td>
    </tr>
    <% } else if (list != null && !list.isEmpty()) {
        for (WifiDto wifi : list) { %>
    <tr>
        <td><%= wifi.getDistance() %></td>
        <td><%= wifi.getX_SWIFI_MGR_NO() %></td>
        <td><%= wifi.getX_SWIFI_WRDOFC() %></td>
        <td>
            <a href="detail.jsp?distance=<%= wifi.getDistance() %>&mgrNo=<%= wifi.getX_SWIFI_MGR_NO() %>">
                <%= wifi.getX_SWIFI_MAIN_NM() %>
            </a>
        </td>
        <td><%= wifi.getX_SWIFI_ADRES1() %></td>
        <td><%= wifi.getX_SWIFI_ADRES2() %></td>
        <td><%= wifi.getX_SWIFI_INSTL_FLOOR() %></td>
        <td><%= wifi.getX_SWIFI_INSTL_TY() %></td>
        <td><%= wifi.getX_SWIFI_INSTL_MBY() %></td>
        <td><%= wifi.getX_SWIFI_SVC_SE() %></td>
        <td><%= wifi.getX_SWIFI_CMCWR() %></td>
        <td><%= wifi.getX_SWIFI_CNSTC_YEAR() %></td>
        <td><%= wifi.getX_SWIFI_INOUT_DOOR() %></td>
        <td><%= wifi.getX_SWIFI_REMARS3() %></td>
        <td><%= wifi.getLNT() %></td>
        <td><%= wifi.getLAT() %></td>
        <td><%= wifi.getWORK_DTTM() %></td>
    </tr>
    <%   }
    } %>
    </tbody>
</table>
</body>
</html>