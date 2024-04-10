<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>책 분류 목록</title>
	<script>
		// categoryID를 이용해 category(분류)를 삭제한다.
		function OnDeleteClicked(categoryID)
		{
			//alert('삭제할 categoryID = ' + categoryID);
			
			location.href = 'deleteCategory.jsp?categoryID=' + categoryID;
		}
	</script>
</head>
<body>
	<% 	// DB에서 책 분류 자료를 가져온다.
 		// 접속할 DBMS 주소 		
 		String url = "jdbc:postgresql://172.30.0.7/testdb";
 		
 		// DBMS의 사용자 이름
 		String user = "scott";
 		
 		// 위 사용자 이름에 대한 비밀번호.
 		String pwd = "tiger";
 		
 		// 연결을 위한 변수 
 		Connection con = null;
 		
 		// 쿼리를 실행하는 Statement 변수
 		Statement stmt = null;
 		
 		// 결과를 받아올 변수
 		ResultSet rs = null;
 			
 		
 		// 시도한다. 이 try {} 안에서 실행을 시도하다가 문제가 생기면 catch {} 로 간다.
 		try
 		{
 			// postgresql JDBC를 읽어들인다(로드한다 = 메모리에 올려 사용할 준비를 한다).
 			Class.forName("org.postgresql.Driver");
 			
 			// DBMS와 연결한다. url: 접속할 서버. user: DBMS 사용자 계정, pwd: user의 비밀번호
 			con = DriverManager.getConnection(url, user, pwd);
 		    
 			// DBMS에 쿼리할 준비를 한다.
 			stmt = con.createStatement();

 			// 실행할 쿼리문
 			String query = "select * from book_category";
 			
 			/*---------------------------------------- 
 			여기에 쿼리문을 출력하는 코드를 추가해 보세요.
 			----------------------------------------*/
 		 	        
 			// 쿼리를 실행한 결과를 rs가 받는다.
 			rs = stmt.executeQuery(query);
 			
 			// 테이블을 구성한다.
 			out.print("<table border=1>");
 			
 			// 헤더 한 줄을 구성한다.
 			out.print("<tr>");
 			out.print("<th>ID</th><th>분류</th><th>기능</th>");
 			out.print("</tr>");
 			
 			// rs에 다음 자료가 있을 때까지 실행한다. = 더 이상 다음 자료가 없으면 while에서 빠져나온다.
			while (rs.next())
			{
				// 테이블의 새로운 row의 시작
				out.print("<tr>");
				
				// DBMS에서 가져온 결과를 보여준다. 표 형식으로 구성한다.
				out.print("<td>" + rs.getString("ID") + "</td>" + "<td>" + rs.getString("name") + "</td>");
				
				// 삭제 버튼을 보여주고, javascript를 이용해 삭제 jsp를 호출하면서 ID를 넘겨준다.
				out.print("<td>" + "<button onClick='OnDeleteClicked(" + rs.getString("ID") + ")'>삭제</button>" + "</td>");
				
				// 테이블 row의 끝
				out.print("</tr>");
			}
 			
			// 테이블 태그를 닫는다.
 			out.print("</table>");

			// 다 사용했으면 결과를 닫는다. 닫지 않으면 메모리 낭비가 발생함.
			rs.close();
 			
 			// 쿼리 실행기를 닫는다. 닫지 않으면 메모리 낭비가 발생함.
 			stmt.close();

 			// 연결을 닫는다. 닫지 않으면 메모리 낭비와 DB 접속 관련 문제가 발생함.
 			con.close();
 		}		
 		catch(Exception ex)		// 위 try{} 에서 문제가 발생하면 이 안으로 들어온다.
 		{
 			// 만약 try 안의 내용을 실행하는 중에 에러가 발생하면 그 에러 내용을 보여준다.
 			out.println("err: " + ex.toString());
 		}
    %>
</body>
</html>