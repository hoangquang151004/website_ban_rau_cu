<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Admin - Trang quản trị</title>
      <link rel="stylesheet" href="asset/admin/style.css" />
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
            <h2>Quản lý đơn hàng</h2>

            <% String message = (String) request.getAttribute("message");
                if (message != null) { %>
            <script>
                alert("<%= message %>");
            </script>
            <% } %>
            <form action="donhang?action=tim" method="post">
                <input type="text" placeholder="Tìm kiếm tài khoản..." name="keyword" style="width: 450px">
                <input type="submit" value="Tìm kiếm" class="btn btn-timkiem">
            </form>

            
            <table border="1" width="80%" cellspacing="0" cellpadding="12">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tên tài khoản</th>
                    <th>Ngày đặt</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Trạng thái</th>
                    <th>Tổng tiền</th>
                    <th>Hành động</th>
                    
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dh" items="${donHangList}" varStatus="status">
                    <tr>
                        <td>${dh.maDonHang}</td>
                        <td>${dh.tenTaiKhoan}</td>
                        <td>${dh.ngayDat}</td>
                        <td>${dh.soDienThoaiNhan}</td>
                        <td>${dh.diaChiGiao}</td>
                        <td>${dh.trangThai}</td>
                        <td>${dh.tongTien}</td>
                        <td colspan="3" style="display: flex" >
                            <a href="donhang?action=xem&maDonHang=${dh.maDonHang}" class="btn btn-them">Xem chi tiết</a>
                            <a href="donhang?action=sua&maDonHang=${dh.maDonHang}" class="btn btn-sua">Sửa</a>
                            <a href="donhang?action=xoa&maDonHang=${dh.maDonHang}&page=${currentPage}" class="btn btn-xoa"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này không?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="donhang?page=${i}">${i}</a>
        </c:forEach>
    </main>
  </body>
</html>
