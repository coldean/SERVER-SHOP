<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <style>
        /* 스타일링 */
        .product {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>장바구니</h1>

    <!-- 상품 목록 -->
    <div id="cart-items">
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM products");

                while (rs.next()) {
                    int productId = rs.getInt("id");
                    String product_name = rs.getString("name");
                    int price = rs.getInt("price");

        %>
                    <div class="product">
                        <span><%= product_name %> - 가격: <%= price %>원</span>
                        <input type="number" value="1" min="1">
                        <button onclick="removeFromCart(<%= productId %>)">삭제</button>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

    <!-- 결제 버튼 -->
    <button onclick="checkout()">결제</button>

    <script>
        // 결제 함수
        function checkout() {
            alert("결제 완료!");
        }

        // 상품 삭제하는 함수
        function removeFromCart(productId) {
            // 여기에 삭제 기능을 추가할 수 있습니다.
        }
    </script>
</body>
</html>
