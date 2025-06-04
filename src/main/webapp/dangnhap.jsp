<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Đăng nhập - Green Mart</title>
    <link rel="stylesheet" href="asset/user/style.css?v=<%= System.currentTimeMillis() %>" />
    <style>
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #4caf50;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: -10px;
        }

        .footer-note {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .footer-note a {
            color: #4caf50;
            text-decoration: none;
        }

        .footer-note a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">🌿 GREEN <span class="blue">MART</span></div>
    <div class="cart">
        <a href="trangchu">Trang Chủ |</a>
        <a href="dangki.jsp">Đăng Ký |</a>
        <a href="#">Đơn hàng của bạn |</a>
        <a href="giohang">🛒 Cart</a>
    </div>
</header>

<div class="login-container">
    <h2>Đăng nhập tài khoản</h2>
    <form action="dangnhap" method="post">
        <label for="tenTaiKhoan">Tên tài khoản:</label>
        <input type="text" name="tenTaiKhoan" required>

        <label for="matKhau">Mật khẩu:</label>
        <input type="password" name="matKhau" required>

        <input type="submit" value="Đăng nhập">

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
    </form>

    <div class="footer-note">
        Chưa có tài khoản? <a href="dangki.jsp">Đăng ký ngay</a>
    </div>
</div>

<footer>

</footer>

</body>
</html>
