<%@ page import="com.entity.TaiKhoan" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
  TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("tk");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <title>Đặt hàng thành công - Green Mart</title>
  <link
          rel="stylesheet"
          href="asset/user/style.css?v=<%= System.currentTimeMillis() %>"
  />
  <style>
    .success-container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
      background: #f8f9fa;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .success-container h2 {
      color: #28a745;
      margin-bottom: 20px;
    }
    .success-container p {
      font-size: 1.1em;
      color: #333;
      margin: 10px 0;
    }
    .success-container .bank-info {
      margin-top: 20px;
      padding: 15px;
      background: #e9ecef;
      border-radius: 5px;
    }
    .success-container a {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
    }
    .success-container a:hover {
      background: #0056b3;
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
        <a href="logout">Đăng xuất |</a>
      </c:otherwise>
    </c:choose>

    <a href="#">Đơn hàng của bạn |</a>
    <a href="giohang">🛒 Cart</a>
  </div>

</header>

<div class="success-container" style="height: 500px">
  <h2>Đặt hàng thành công!</h2>
  <p>Cảm ơn bạn đã mua sắm tại Green Mart.</p>
  <p>Mã đơn hàng của bạn là: <strong>${maDonHang}</strong></p>

  <a href="trangchu">Quay lại trang chủ</a>
</div>

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
</body>
</html>
