<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${video.title}</title>
    <style>
        /* 기본 스타일 설정 */
       @font-face {
            font-family: 'TheJamsil5Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        body {
            font-family: 'TheJamsil5Bold';
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
        .video-container {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .video-title {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .video-body {
            margin-top: 20px;
        }
    </style>
</head>
<body>
	<div class="navbar">
	    <a href="VideoServlet">홈</a>
	    <a href="login.jsp">로그인</a>
	    <a href="logout.jsp">로그아웃</a>
	</div>

<div class="video-container">
    <div class="video-title">${video.title}</div>
    <iframe width="560" height="315" src="https://www.youtube.com/embed/${video.url}" 
            title="${video.title}" frameborder="0" 
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen></iframe>
    <div class="video-body">
        <p><strong>운동 부위:</strong> ${video.bodyPart}</p>
        <p><strong>조회수:</strong> ${video.viewCount}</p>
        <!-- 필요한 추가 정보가 있으면 여기에 추가 -->
    </div>
</div>

</body>
</html>
