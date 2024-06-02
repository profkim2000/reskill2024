<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑 리뷰 입력</title>
</head>
<%
    // post로 넘어온 한글의 유형을 UTF-8로 세팅한다.
    request.setCharacterEncoding("UTF-8");
    
    // POST의 hidden type으로 넘어온 camping장 정보의 ID    
    String campID = request.getParameter("campID");

    // POST방식으로 넘어온 review 내용.
    String review = request.getParameter("review");

    out.print("campID = " + campID);
    out.print("<BR>");
    out.print("review = " + review);

    // 접속할 DBMS 주소 		
    String url = "jdbc:postgresql://172.30.0.7/camping";
    
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
        String query = "insert into review (campid, review) values (" + campID + ", '" + review + "')";
        out.print("query = " + query);
                
        // select 쿼리를 실행한다.
        stmt.executeUpdate(query);
        
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

    // review 입력 후 다시 원래 페이지로 돌아간다.
    out.print("<script>document.location.href='./campinfo.jsp?id=" + campID + "'</script>");
%>
</html>
