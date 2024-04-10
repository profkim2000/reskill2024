<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String strCategoryID = request.getParameter("categoryID");
	out.print("URL의 파라미터로 받은 값, categoryID = " + strCategoryID);
%>
<%
	/*---------------------------------------------------
	categoryID를 가진 book_category 테이블 내의 자료를 삭제한다.
	---------------------------------------------------*/
	
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
	
		// 삭제를 실행할 쿼리문
		String query = "delete from book_category where ID = " + strCategoryID;
		
		/*---------------------------------------- 
		여기에 쿼리문을 출력하는 코드를 추가해 보세요.
		----------------------------------------*/
	 	        
		// insert 쿼리를 실행한다. 영향을 받은(=추가된) 자료의 수가 cAffected에 저장된다.
		int cAffected = stmt.executeUpdate(query);
		
		out.print("<br><br>" + cAffected + "개의 분류가 삭제되었습니다.");
	
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