<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<style>

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
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    table {
        width: 80%;
        margin: auto;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
    a {
        color: #007BFF;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
	<div class="navbar">
	    <a href="VideoServlet">홈</a>
	    <a href="login.jsp">로그인</a>
	    <a href="logout.jsp">로그아웃</a>
	</div>
    <table>
        <tr>
            <th>ID</th>
            <th>리뷰 제목</th>
            <th>작성자</th>
            <th>등록일</th>
        </tr>
        <c:forEach items="${list}" var="review">
            <tr>
                <td>${review.id}</td>          
                <td><a href="review?action=detail&id=${review.id}">${review.title}</a></td>
                <td>${review.writer}</td>         
                <td>${review.regDate}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
