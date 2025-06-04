<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      <div class="container">
        <h2>Sửa đơn hàng</h2>
        <form action="donhang" method="post" >
        <table  width="80%" cellspacing="0" cellpadding="12">
                <tr>
                <td>Mã đơn hàng:</td>
                <td><input type="text" name="madonhang" value="${donHang.maDonHang}" required /></td>
            </tr>
            <tr>
                <td>Tên tài khoản:</td>
                <td><input type="text" name="tentk" value="${donHang.tenTaiKhoan}" required /></td>
            </tr>
            <tr>
                <td>Ngày đặt:</td>
                <td><input type="date" name="ngayDat" value="${donHang.ngayDat}" required /></td>
            </tr>
            <tr>
                <td>SDT:</td>
                <td><input type="text" name="SDT" value="${donHang.soDienThoaiNhan}" required /></td>
            </tr>
            <tr>
                <td>Địa chỉ giao:</td>
                <td><input type="text" name="diachigiao" value="${donHang.diaChiGiao}" required /></td>
            </tr>
            
            <tr>
                <td>Trạng thái:</td>
                <td>
                    <select name="trangThai">
                        <option value="Đang giao hàng" <c:if test="${donHang.trangThai == 'Đang giao hàng'}">selected</c:if>>Đang giao hàng</option>
                        <option value="Đã giao hàng" <c:if test="${donHang.trangThai == 'Đã giao hàng'}">selected</c:if>>Đã giao hàng</option>
                        <option value="Đã hủy" <c:if test="${donHang.trangThai == 'Đã hủy'}">selected</c:if>>Đã hủy</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Phướng thức TT:</td>
                <td>
                    <select name="phuongThucTT">
                        <option value="ck" <c:if test="${donHang.phuongThucTT == 'ck'}">selected</c:if>>Chuyển khoản</option>
                        <option value="tm" <c:if test="${donHang.phuongThucTT == 'tm'}">selected</c:if>>Thanh toán khi nhận hàng</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Ghi chú:</td>
                <td><textarea name="ghiChu" >${donHang.ghiChu}</textarea></td>
            </tr>
            <tr>
                <td>Tổng tiền:</td>
                <td><input type="number" name="tongTien" value="${donHang.tongTien}" required /></td>
            </tr>
          </table>
          <button class="btn btn-sua" type="submit">Sửa đơn hàng</button>
        </form>
      </div>
    </main>
  </body>
</html>
