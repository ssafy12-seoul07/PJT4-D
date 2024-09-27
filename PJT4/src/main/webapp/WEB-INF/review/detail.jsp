<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style>
	@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
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
        
    body {
        font-family: 'TheJamsil5Bold';
        margin: 20px;
    }
    .container {
        border: 1px solid #ccc;
        padding: 20px;
        width: 50%;
        margin: auto;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }
    a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	<div class="navbar">
	    <a href="VideoServlet">홈</a>
	    <a href="login.jsp">로그인</a>
	    <a href="logout.jsp">로그아웃</a>
	</div>
    <div class="container">
        <h2>${review.title}</h2>
        <p>${review.content}</p>
        <a href="review?action=delete&id=${review.id}">삭제</a>
        <a href="review?action=updateform&id=${review.id}">수정</a>
    </div>
</body>
</html>
