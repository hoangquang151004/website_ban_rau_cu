<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Green Mart</title>
    <link rel="stylesheet" href="asset/user/style.css?v=<%= System.currentTimeMillis() %>" />
    <style>
        .container {
            width: 500px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"] {
            width: 90%;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin: 10px auto;
        }

        input[type="submit"] {
            width: 90%;
            padding: 10px;
            background-color: #4caf50;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        form{
            width: 95%;
            margin: 0 auto;
            margin-left: 30px;
        }

    </style>
</head>
<body>
<header>
    <div class="logo">🌿 GREEN <span class="blue">MART</span></div>
    <div class="cart">
        <a href="trangchu">Trang Chủ |</a>
        <a href="login.jsp">Đăng Nhập |</a>
        <a href="#">Đơn hàng của bạn| </a>
        <a href="giohang">🛒 Cart</a>
    </div>
</header>

<div class="container">
    <form action="dangki" method="post">
        <h2>Đăng ký tài khoản</h2>

        <c:if test="${not empty error}">
            <p style="color:red; text-align:center;">${error}</p>
        </c:if>

        <label for="tenTaiKhoan">Tên tài khoản:</label>
        <input type="text" name="tenTaiKhoan" value="${param.tenTaiKhoan}" required />

        <label for="matKhau">Mật khẩu:</label>
        <input type="password" name="matKhau" required />

        <label for="hoTen">Họ tên:</label>
        <input type="text" name="hoTen" value="${param.hoTen}" />

        <label for="ngaySinh">Ngày sinh:</label>
        <input type="date" name="ngaySinh" value="${param.ngaySinh}" />

        <label for="diaChi">Địa chỉ:</label>
        <input type="text" name="diaChi" value="${param.diaChi}" />

        <label for="SDT">SĐT:</label>
        <input type="text" name="SDT" value="${param.SDT}" />

        <label for="email">Email:</label>
        <input type="email" name="email" value="${param.email}" />

        <input type="submit" value="Đăng ký" />
    </form>
</div>

<footer>

</footer>

<script src="main.js"></script>
</body>
</html>
