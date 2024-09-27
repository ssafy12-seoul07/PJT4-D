<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${video.title}</title>
    <style>
        /* 기본 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
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
