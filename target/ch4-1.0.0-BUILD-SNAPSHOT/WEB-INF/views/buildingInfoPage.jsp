<%--
  Created by IntelliJ IDEA.
  User: gimminju
  Date: 2023/12/01
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>


<!-- /WEB-INF/views/buildingInfoPage.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="false"%>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>자취특공대</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #deedf7;
        }

        header {
            background-color: #deedf7;
            color: black;
            text-align: center;
            gap: 10px;
        }

        main {
            display: flex;
            margin: 0 100px;
            gap: 10px;
        }

        section {
            background-color: rgb(255, 255, 255);
            flex: 4;
            padding: 10px;
        }

        aside {
            background-color: rgb(255, 255, 255);
            flex: 1;
            padding: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 8px;
            text-align: center;
        }

        .other-content {
            margin-top: 20px;
        }

        #map {
            width: 100px;
            height: 100px;
            background-color: lightgray;
            margin-bottom: 20px;
        }

        .file-input-container {
            margin-bottom: 20px;
        }

        .review-preview {
            border: 1px solid darkgray;
            padding: 10px;
            margin-bottom: 20px;
        }

        .more-reviews {
            text-align: center;
            color: blue;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>





<body>
<header>
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

    <h1>${address}</h1>
</header>

<main>
    <section>
        <h2>Main Section</h2>

        <table>
            <tr>
                <th>Header 1</th>
                <th>Header 2</th>
                <th>Header 3</th>
            </tr>
            <tr>
                <td>건물 가격: ${buildingPrice}</td>
                <td>주소: ${address}</td>
                <td>건물 자재: ${material}</td>
            </tr>
            <!-- Add more rows as needed -->
        </table>

        <div class="other-content">
            <h3>안정성 지표 계산</h3>
            <div class="input-container">
                <div class="first-input">
                    <label for="xInput">융자</label>
                    <input type="number" id="xInput" name="xInput" min="0" />
                    <span>만원</span>
                </div>
                <div class="second-input">
                    <label for="yInput">선순위 보증금</label>
                    <input type="number" id="yInput" name="yInput" min="0" />
                    <span>만원</span>
                </div>
                <button onclick="calculateResult()">계산</button>
            </div>

            <div id="result1"></div>

            <script>
                function calculateResult() {
                    // Get the input element values
                    var xInput = document.getElementById('xInput');
                    var yInput = document.getElementById('yInput');
                    var resultDiv = document.getElementById('result1');
                    const price = 30000;

                    // Check if the inputs are valid numbers
                    if (!isNaN(xInput.value) && !isNaN(yInput.value)) {
                        var result =
                            ((price / 120) * 100 + parseFloat(yInput.value)) /
                            parseFloat(xInput.value);
                        resultDiv.textContent = 'Result: ' + result.toFixed(2) + '%';
                    } else if (!isNaN(xInput.value)) {
                        var result = ((price / 120) * 100) / parseFloat(xInput.value);
                        resultDiv.textContent = 'Result: ' + result.toFixed(2) + '%';
                    } else {
                        // If the inputs are not valid numbers, show an error message
                        resultDiv.textContent = '다시 입력해주세요.';
                    }
                }
            </script>
        </div>
    </section>

    <aside>
        <h3>지도</h3>

        <div id="map" style="width: 100%; height: 180px"></div>
        <script
                type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e096b224feddb23b004fb6438e152d52&libraries=services"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
                };

            //지도를 미리 생성
            var map = new daum.maps.Map(mapContainer, mapOption);
            //주소-좌표 변환 객체를 생성
            var geocoder = new daum.maps.services.Geocoder();
            //마커를 미리 생성
            var marker = new daum.maps.Marker({
                position: new daum.maps.LatLng(37.537187, 127.005476),
                map: map
            });

            geocoder.addressSearch("${address}", function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        </script>

        <h3>실거주자 인증</h3>
        <div class="file-input-container">
            <label for="fileInput"></label>
            <input type="file" id="fileInput" name="fileInput" />
            <button onclick="submitFile()">인증</button>
        </div>
        <div id="result2"></div>

        <script>
            function submitFile() {
                var fileInput = document.getElementById('fileInput');
                var resultDiv = document.getElementById('result2');

                // Check if a file is selected
                if (fileInput.files.length > 0) {
                    var selectedFile = fileInput.files[0];

                    // You can perform actions with the selected file here
                    resultDiv.textContent = '[인증 요청 완료]' + selectedFile.name;
                } else {
                    // If no file is selected, show an error message
                    resultDiv.textContent = '다시 첨부하신 후, 요청해주세요.';
                }
            }
        </script>

        <div class="review-preview">
            <h3>Review Preview</h3>
            <p>This is a preview of the review.</p>
            <a href="#">More Reviews</a>
        </div>
    </aside>
</main>
</body>
</html>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Building Information</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Building Information</h1>--%>
<%--<p>Building Code: ${buildingCode}</p>--%>
<%--<p>Address: ${address}</p>--%>
<%--<!-- ... 추가적인 데이터 출력 -->--%>
<%--</body>--%>
<%--</html>--%>

