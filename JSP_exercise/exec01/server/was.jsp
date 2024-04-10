<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    	String strCategory = request.getParameter("category");
    	out.print("URL의 파라미터로 받은 값, category = " + strCategory);
    %>
</body>
</html>