<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thống kê doanh thu</title>
    <link rel="stylesheet" href="asset/admin/style.css?v=<%= System.currentTimeMillis() %>" />
    <style>
        input[type="date"] {
            width: 200px;
            padding: 6px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }
        form {
            background-color: #ffffff;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        form label {
            font-weight: bold;
        }
        form input[type="date"] {
            padding: 6px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        form button {
            background-color: #007acc;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        form button:hover {
            background-color: #007acc;
        }

        .stat-box {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #007acc;
        }
        .value {
            font-size: 28px;
            color: #007acc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        footer {
            margin-top: 30px;
            text-align: center;
            color: #777;
        }
    </style>
</head>
<body>
<header>
    <h1>Trang quản trị Admin - GreenMart</h1>
</header>

<nav>
    <a href="taikhoan">Quản lý tài khoản</a>
    <a href="sanpham">Quản lý sản phẩm</a>
    <a href="donhang">Quản lý đơn hàng</a>
    <a href="thongke">Thống kê</a>
    <a href="dangxuat">Đăng xuất</a>
</nav>

<main>
    <h1>📊 Thống kê hệ thống</h1>

    <form action="thongke" method="post">
        <label>Từ ngày:</label>
        <input type="date" name="tu" required />
        <label>Đến ngày:</label>
        <input type="date" name="den" required />
        <button type="submit">Thống kê</button>
    </form>

    <div class="stat-box">
        <div class="title">Tổng số đơn hàng</div>
        <div class="value">${tongDonHang}</div>
    </div>

    <div class="stat-box">
        <div class="title">Tổng doanh thu</div>
        <div class="value">${tongDoanhThu} VNĐ</div>
    </div>

    <div class="stat-box">
        <div class="title">Sản phẩm bán chạy nhất</div>
        <table>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Số lượng bán</th>
            </tr>
            <c:forEach var="sp" items="${spBanChay}">
                <tr>
                    <td>${sp.tenSanPham}</td>
                    <td>${sp.soLuong}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="stat-box">
        <div class="title">Khách hàng mua nhiều nhất</div>
        <table>
            <tr>
                <th>Tên tài khoản</th>
                <th>Tổng số đơn</th>
            </tr>
            <tr>
            <c:forEach var="kh" items="${khMuaNhieu}">
                    <td>${kh}</td>
            </c:forEach>
            </tr>
        </table>
    </div>
</main>

<footer>&copy; 2025 GreenMart. All rights reserved.</footer>
</body>
</html>
