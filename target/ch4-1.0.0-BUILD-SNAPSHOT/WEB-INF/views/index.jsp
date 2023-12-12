<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자취특공대</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">자취특공대</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<div style="text-align:center">
    <h1>This is HOME</h1>
    <h1>This is HOME</h1>
    <h1>This is HOME</h1>
    <div id="map" style="width:500px;height:400px;"></div>
</div>
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e096b224feddb23b004fb6438e152d52"></script>--%>
<%--<script>--%>
<%--    var container = document.getElementById('map');--%>
<%--    var options = {--%>
<%--        center: new kakao.maps.LatLng(33.450701, 126.570667),--%>
<%--        level: 3--%>
<%--    };--%>

<%--    var map = new kakao.maps.Map(container, options);--%>
<%--</script>--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // new daum.Postcode({
    //     oncomplete: function(data) {
    //         var buildingCode = data.buildingCode;
    //
    //         // 가져온 zonecode를 활용하여 원하는 작업 수행
    //         console.log("건물 코드(buildingCode):", buildingCode);
    //     }
    // }).open();
    new daum.Postcode({
        oncomplete: function(data) {
            // Ajax 요청을 통해 서버로 데이터 전송
            $.ajax({
                type: 'POST',
                url: '/ch4/api/saveAddressData', // Spring 컨트롤러의 매핑 경로
                headers : { "content-type": "application/json"},
                dataType : 'text' ,
                data: JSON.stringify({ data: data }),
                success: function(response) {
                    console.log("[성공] : " + response);
                    window.location.href = '/ch4/buildingInfoPage';
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        }
    }).open();
</script>
</body>
</html>