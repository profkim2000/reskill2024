<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	// 사용자가 파라미터로 넘긴 값들을 다 찾아낸다.
    	String name = request.getParameter("name");
		String publisher = request.getParameter("publisher");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String category = request.getParameter("category");    	
		
		// 사용자가 넘겨준 값들을 확인한다.
		if (price.trim().length() == 0)
			price = "0";
    %>    
    <% 	// 도서 정보를 DB에 저장한다.
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
 			String query = "insert into book (name, publisher, author, price, category) " ;
 			query = query + " values ";
 			query = query + "('" + name + "', ";
 			query = query + "'" + publisher + "', ";
 			query = query + "'" + author + "', ";
 			query = query + price + ", ";
 			query = query + "'" + category + "'";
 			query = query + ")";
 			
 			// 쿼리를 출력한다. 개발할 때는 항상 다양한 경우에 대해 쿼리를 출력해 보면서 확인해야 한다.
 			out.print("<br><br>query = " + query + "<br><br>");
 			        
 			// insert 쿼리를 실행한다. 영향을 받은(=추가된) 자료의 수가 cAffected에 저장된다.
 			int cAffected = stmt.executeUpdate(query);

 			out.print("<br><br>" + cAffected + "개의 도서가 추가되었습니다.<br>");
 			out.print("<ul>");
 			out.print("<li>name: " + name + "</li>");
 			out.print("<li>publisher: " + publisher + "</li>");
 			out.print("<li>author: " + author + "</li>");
 			out.print("<li>price: " + price + "</li>");
 			out.print("<li>category: " + category + "</li>");
 			out.print("</ul>");
 			
 			// 쿼리 실행기를 닫는다.
 			stmt.close();

 			// 연결을 닫는다.
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