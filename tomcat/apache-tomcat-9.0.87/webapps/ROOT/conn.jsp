<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 가입 결과</title>
</head>
<body>
<%
    String userId = request.getParameter("user_id");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##scot", "12341234");

        // SQL 쿼리 준비
        // 데이터베이스의 user_tbl 테이블 구조에 따라 필드명과 데이터 타입을 확인하고 적절히 수정하세요.
        String sql = "INSERT INTO user_tbl (user_id, address, email, gender, password) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, address);
        pstmt.setString(3, email);
        pstmt.setString(4, gender);
        pstmt.setString(5, password);

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
