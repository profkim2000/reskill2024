<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exec01</title>
</head>
<body>
<%!
int foo1(int A, int B)
{
	int C = A * B;
	return C;
}

int foo2(int A, int B, int C)
{
	int D = A + B + C;
	return D;
}

int foo3(int A, int B)
{
	if (A < B)
		return A;
	else	
		return B;
}

int foo4(int A, int B)
{
	if (A < B)
		return B;
	else	
		return A;
}

int foo5(int A, int B, int C)
{
	if (A < B)
	{
		if (B < C)
			return C;
		else
			return B;
	}
	else	
	{
		if (A < C)	
			return C;
		else
			return A;
	}
}

int foo6(int A, int B, int C)
{
	if (A < B)
	{
		if (A < C)
			return A;
		else
			return C;
	}
	else	
	{
		if (B < C)	
			return B;
		else
			return C;
	}
}
%>
<%
//foo1 테스트
int ret1 = foo1(3, 5);
out.print("[foo1] ret1 = " + ret1);

//foo2 테스트
out.print("<br>");

int ret2 = foo2(3, 5, 4);
out.print("[foo2] ret2 = " + ret2);

//foo3 테스트
out.print("<br>");

int ret3 = foo3(3, 5);
out.print("[foo3] ret3 = " + ret3);

//foo4 테스트
out.print("<br>");

int ret4 = foo4(3, 5);
out.print("[foo4] ret4 = " + ret4);

//foo5 테스트
out.print("<br>");

int ret5 = foo5(3, 5, 6);
out.print("[foo5] ret5 = " + ret5);

//foo6 테스트
out.print("<br>");

int ret6 = foo6(3, 5, 6);
out.print("[foo6] ret6 = " + ret6);
%>
</body>
</html>
