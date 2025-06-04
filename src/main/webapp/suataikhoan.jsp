<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
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
    <div class="container">
        <h2>Sửa tài khoản</h2>

        <!-- Hiển thị thông báo nếu có -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>

        <form action="taikhoan?action=xacnhan-sua" method="post">
            <table>
                <tr>
                    <td>Tên tài khoản:</td>
                    <td><input type="text" name="tenTaiKhoan" value="${taikhoan.tenTaiKhoan}" readonly /></td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td><input type="password" name="matKhau" value="${taikhoan.matKhau}" required /></td>
                </tr>
                <tr>
                    <td>Quyền:</td>
                    <td>
                        <select name="quyen">
                            <option value="${taikhoan.quyen}" selected>${taikhoan.quyen}</option>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Họ và tên:</td>
                    <td><input type="text" name="hoTen" value="${taikhoan.hoTen}" required /></td>
                </tr>
                <tr>
                    <td>Ngày sinh:</td>
                    <td><input type="date" name="ngaySinh" value="${taikhoan.ngaySinh}" required /></td>
                </tr>
                <tr>
                    <td>Địa chỉ:</td>
                    <td><input type="text" name="diaChi" value="${taikhoan.diaChi}" required /></td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td><input type="text" name="SDT" value="${taikhoan.SDT}" required /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" value="${taikhoan.email}" required /></td>
                </tr>
            </table>
            <button class="btn btn-sua" type="submit">Sửa tài khoản</button>
        </form>
    </div>
</main>
</body>
</html>
