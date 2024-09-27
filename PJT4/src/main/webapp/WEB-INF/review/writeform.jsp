<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 등록</title>
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
        width: 100%;
        margin: 0;
        padding: 0;
        position: fixed;
        top: 0;
        left: 0;
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

    h2 {
        color: black;
        background-color: white;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        width: fit-content;
        margin: 20px auto;
    }

    body {
        font-family: 'TheJamsil5Bold', Arial, sans-serif !important;
        margin: 20px;
        padding-top: 60px;
    }

    form {
        width: 50%;
        margin: 0 auto;
    }

    div {
        margin-bottom: 15px;
    }

    input[type="text"], textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        padding: 10px 20px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }
</style>
</head>
<body>
    <div class="navbar">
        <a href="VideoServlet">홈</a>
        <a href="login.jsp">로그인</a>
        <a href="logout.jsp">로그아웃</a>
    </div>
    <h2>리뷰 등록</h2>
    <form action="review" method="POST">
        <input type="hidden" name="action" value="write">
        <div>
            리뷰 제목: <input type="text" name="title">
        </div>
        <div>
            작성자: <input type="text" name="writer" value="익명">
        </div>
        <div>
            리뷰 내용: <textarea rows="10" cols="30" name="content"></textarea>
        </div>
        <div>
            <input type="submit" value="리뷰 등록">
        </div>
    </form>
</body>
</html>
