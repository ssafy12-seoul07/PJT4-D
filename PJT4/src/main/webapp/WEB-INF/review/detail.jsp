<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<div>${review.title }</div>
	<div>${review.content }</div>
	
	<a href="review?action=delete&id=${review.id}">삭제</a>
	<a href="review?action=updateform&id=${review.id}">수정</a>
</body>
</html>