<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <title>Admin - Trang quản trị</title>
  <link rel="stylesheet" href="asset/admin/style.css" />
  <style>
    .order-detail-container {
      max-width: 800px;
      margin: 20px auto;
      background: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .order-info,
    .customer-info,
    .product-list,
    .total-price {
      margin-bottom: 25px;
    }
    .back-link a {
      text-decoration: none;
      color: #007bff;
      font-weight: bold;
    }

    .order-table {
      width: 100%;
      border-collapse: collapse;
    }

    .order-table th,
    .order-table td {
      padding: 12px 15px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }

    .order-table th {
      background-color: #f7f7f7;
    }

    .order-table a {
      color: #d32f2f;
      text-decoration: none;
    }

    .status {
      padding: 5px 10px;
      border-radius: 5px;
      font-size: 13px;
      font-weight: bold;
      display: inline-block;
    }
    .status.processing {
      background-color: #fff3cd;
      color: #856404;
    }

    .status.completed {
      background-color: #d4edda;
      color: #155724;
    }

    .status.cancelled {
      background-color: #f8d7da;
      color: #721c24;
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
  <div class="container" style="height: 700px">
    <div class="order-detail-container">
      <h2>Chi tiết đơn hàng #${donHang.maDonHang}</h2>

      <div class="order-info">
        <p><strong>Ngày đặt:</strong> ${donHang.ngayDat}</p>
        <p>
          <strong>Trạng thái:</strong>
          <span class="status processing">${donHang.trangThai}</span>
        </p>
      </div>

      <div class="customer-info">
        <h3>Thông tin người nhận</h3>
        <p><strong>Tên Tài Khoản:</strong> ${donHang.tenTaiKhoan}</p>
        <p>
          <strong>Địa chỉ:</strong> ${donHang.diaChiGiao}
        </p>
        <p><strong>SĐT:</strong> ${donHang.soDienThoaiNhan}</p>
      </div>

      <div class="product-list">
        <h3>Sản phẩm đã đặt</h3>
        <table class="order-table">
          <thead>
          <tr>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="sp" items="${sanPhamList}">
            <tr>
              <th>${sp.tenSanPham}</th>
              <th>${sp.soLuong}</th>
              <th>${sp.giaSanPham}</th>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="total-price">
        <p><strong>Tổng cộng:</strong> ${donHang.tongTien}đ</p>
      </div>

      <div class="back-link">
        <a href="donhang">← Quay lại quản lý đơn hàng</a>
      </div>
    </div>

  </div>

</main>
</body>
</html>
