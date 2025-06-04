<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <title>Admin - Trang quản trị</title>
  <link rel="stylesheet" href="asset/user/style.css?v=<%= System.currentTimeMillis() %>" />
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
  <div class="logo">🌿 GREEN <span class="blue">MART</span></div>
  <form action="trangchu" method="post">
    <div class="search-bar">
      <input
              type="text"
              placeholder="Tìm kiếm sản phẩm bạn muốn..."
              class="input-header"
              name="keyword"
      />
      <button type="submit">🔍</button>
    </div>
  </form>
  <div class="cart">
    <a href="trangchu">Trang Chủ |</a>
    <c:choose>
      <c:when test="${empty taikhoan}">
        <a href="dangnhap.jsp">Đăng nhập |</a>
      </c:when>
      <c:otherwise>
        <span>Xin chào, ${taikhoan.tenTaiKhoan} |</span>
        <a href="dangxuat">Đăng xuất |</a>
      </c:otherwise>
    </c:choose>

    <a href="donhang?action=lichsu&maTaiKhoan=${taikhoan.tenTaiKhoan}">Đơn hàng của bạn |</a>
    <a href="giohang">🛒 Cart</a>
  </div>

</header>
<main>
  <div class="container" style="height: 700px">
    <div class="order-detail-container">
      <h2>Chi tiết đơn hàng #${donHang.maDonHang}</h2>

      <div class="order-info">
        <p><strong>Ngày đặt:</strong> ${donHang.ngayDat}</p>
        <p>
          <strong>Trạng thái:</strong>
          <c:choose>
            <c:when test="${donHang.trangThai eq 'Đang giao hàng'}">
              <span class="status processing">${donHang.trangThai}</span>
            </c:when>
            <c:when test="${donHang.trangThai eq 'Đã giao hàng'}">
              <span class="status completed">${donHang.trangThai}</span>
            </c:when>
            <c:when test="${donHang.trangThai eq 'Đã hủy'}">
              <span class="status cancelled">${donHang.trangThai}</span>
            </c:when>
            <c:otherwise>
              <span class="status">${donHang.trangThai}</span>
            </c:otherwise>
          </c:choose>
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
        <a href="donhang?action=lichsu&maTaiKhoan=${taikhoan.tenTaiKhoan}">← Quay lại lịch sử đơn hàng</a>
      </div>
    </div>

  </div>

</main>
<footer>
  <div class="footer-top">
    <div class="footer-left">
      <ul>
        <li>Chính sách giao hàng</li>
        <li>Hóa đơn điện tử</li>
        <li>Giới thiệu công ty</li>
        <li>Chính sách đổi trả</li>
        <li>Hướng dẫn mua hàng</li>
        <li>Cần thuê mặt bằng</li>
        <li>Quy chế hoạt động</li>
        <li>Chính sách khách hàng</li>
        <li>Liên hệ</li>
      </ul>
    </div>
    <div class="footer-right">
      <p>
        <span class="hotline">📞 Hotline:</span> 0379 775 286 / 0972 452 592
        <span class="time">(7:00 - 21:30)</span>
      </p>
      <p>
        📝 <span class="register">Đăng ký chào hàng vào Green Mart</span>
      </p>
      <p>
        ⛔
        <span class="store-address"
        >Cửa hàng: A106 chung cư Athena Xuân Phương, Nam Từ Liêm.</span
        >
      </p>
    </div>
  </div>
  <div class="footer-bottom">
    <p>
      © 2023. Green Mart. Cửa hàng: A106 chung cư Athena Xuân Phương, Nam Từ
      Liêm, Hà Nội. Email: dienct87@gmail.com. Chịu trách nhiệm nội dung:
      Green Mart
    </p>
  </div>
</footer>
<script src="main.js"></script>
</body>
</html>


