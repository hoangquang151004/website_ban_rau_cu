<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Admin - Trang quản trị</title>
    <link rel="stylesheet" href="asset/admin/style.css" />
</head>

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
    <div class="container" style="height: 500px">
        <h2>Quản lý tài khoản</h2>
        <% String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <script>
            alert("<%= message %>");
        </script>
        <% } %>
        <form action="taikhoan" method="post">
            <input type="text" placeholder="Tìm kiếm tài khoản..." name="txtTimKiem" style="width: 450px">
            <input type="submit" value="Tìm kiếm" class="btn btn-timkiem">
        </form>

        <table border="1" width="80%" cellspacing="0" cellpadding="12">
            <thead>
            <tr>
                <th>Tên đăng nhập</th>
                <th>Email</th>
                <th>Vai trò</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="acc" items="${taiKhoanList}" varStatus="status">
                <tr>
                    <td>${acc.tenTaiKhoan}</td>
                    <td>${acc.email}</td>
                    <td>${acc.quyen}</td>
                    <td>
                        <a href="taikhoan?action=sua&tenTaiKhoan=${acc.tenTaiKhoan}" class="btn btn-sua">Sửa</a>
                        <a href="taikhoan?action=xoa&tenTaiKhoan=${acc.tenTaiKhoan}&page=${currentPage}" class="btn btn-xoa"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản này không?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:forEach var="i" begin="1" end="${totalPages}">
    <a href="taikhoan?page=${i}">${i}</a>
    </c:forEach>
</main>
</body>
</html>
