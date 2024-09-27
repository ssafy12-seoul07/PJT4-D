<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>운동 영상 메인 페이지</title>
    <style>
        /* 기존 스타일 유지 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .section {
            margin-bottom: 40px;
        }

        /* 게시판 스타일 테이블 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .thumbnail {
            width: 100px;
            height: auto;
        }

        .body-part-buttons button {
            margin: 5px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .body-part-buttons button:hover {
            background-color: #555;
        }
        .Rbutton a {
            margin: 5px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        a:focus {
            color: #003f7f;
            outline: none;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- 상단 메뉴 -->
<div class="navbar">
    <a href="VideoServlet">홈</a>
    <a href="login.jsp">로그인</a>
    <a href="logout.jsp">로그아웃</a>
</div>

<!-- 콘텐츠 영역 -->
<div class="container">
<c:if test = "${filteredVideos == null}">
    <h1>운동 영상 메인 페이지</h1>

    <!-- 조회수 상위 영상 리스트 (게시판 스타일) -->
    <div class="section">
    
        <h2>인기 운동 영상</h2>
        <table>
           <thead>
                <tr>
                    <th>썸네일</th>
                    <th>제목</th>
                    <th>조회수</th>
                </tr>
            </thead>	
            <tbody>
                <c:forEach var="video" items="${topVideos}">
                    <tr>
                        <td>
                            <a href="VideoServlet?action=view&id=${video.id}">
                                <img class="thumbnail" src="https://img.youtube.com/vi/${video.url}/0.jpg" alt="썸네일">
                            </a>
                        </td>
                        <td>
                            <a href="VideoServlet?action=view&id=${video.id}">${video.title}</a>
                        </td>
                        <td>${video.viewCount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

    <!-- 운동 부위별 필터링 (게시판 스타일) -->
    <div class="section">
        <h2>운동 부위별 영상</h2>
            <div class="body-part-buttons">
                <form method="get" action="VideoServlet">
                    <input type="hidden" name="action" value="filter">
                        <c:forEach var="part" items="${bodyParts}">
                            <button type="submit" name="bodyPart" value="${part}">${part}</button>
                        </c:forEach>
                </form>
            </div>
    <!-- 운동 부위별 영상 리스트 -->
    <table>

        <tbody>
            <c:forEach var="video" items="${filteredVideos}">
                <tr>
                    <td>
                        <a href="VideoServlet?action=view&id=${video.id}">
                            <img class="thumbnail" src="https://img.youtube.com/vi/${video.url}/0.jpg" alt="썸네일">
                        </a>
                    </td>
                    <td>
                        <a href="VideoServlet?action=view&id=${video.id}">${video.title}</a>
                    </td>
                    <td>${video.bodyPart}</td>
                </tr>
            </c:forEach>
        </tbody>
        </table>
    <div class = "Rbutton">
	<a href="review?action=writeform">리뷰 등록</a>
	<a href="review?action=list">리뷰 목록</a>
	</div>
    </div>
</div>
</body>
</html>
