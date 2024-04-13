<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 가입 결과</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##scot", "12341234");

        // SQL 쿼리 준비
        String sql = "INSERT INTO user_tbl (name, username, password) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, username);
        pstmt.setString(3, password);

        // SQL 쿼리 실행
        pstmt.executeUpdate();

        out.println("<h2>회원 가입 성공!</h2>");
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<h2>회원 가입 실패</h2>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</body>
</html>
