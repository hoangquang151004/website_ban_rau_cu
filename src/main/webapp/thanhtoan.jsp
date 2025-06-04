<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="com.entity.TaiKhoan" %>
<%@ page import="com.entity.SanPham" %>
<%@ page import="java.util.List" %>
<%
  TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("tk");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thanh toán - Green Mart</title>
  <link rel="stylesheet" href="asset/user/style.css?v=<%= System.currentTimeMillis() %>" />

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
<div class="checkout-container">
  <form action="xacnhan" method="post">

  <!-- Billing Details -->
  <div class="billing-details">
    <h3>Thông tin giao hàng</h3>
    <label>Tên tài Khoản</label>
    <input type="text" name ="tenTaiKhoan" value="${taikhoan.tenTaiKhoan}"/>

    <label>Địa chỉ *</label>
    <input type="text" placeholder="Địa chỉ" name="diaChi" value="${taikhoan.diaChi}"/>

    <label>Số điện thoại *</label>
    <input type="text" placeholder=""  name ="SDT" value="${taikhoan.SDT}"/>

    <label>Ghi Chú</label>
    <textarea
            placeholder="Ghi Chú nội dung giao hàng" name = "ghiChu"
    ></textarea>
  </div>

  <!-- Order Summary -->
  <div class="order-summary">
    <h3>Đơn Hàng Của Bạn</h3>
    <table>
      <tr>
        <th>Sản phẩm</th>
        <th>Số lượng</th>
      </tr>
      <c:forEach var="i" items="${danhSachMua}">
        <tr>
          <th>${i.tenSanPham}</th>
          <td>${i.soLuong}</td>
        </tr>
        <input type="hidden" value="${i.maSanPham}" name ="maSanPham[]">
        <input type="hidden" value="${i.soLuong}" name = "soLuong[]">
      </c:forEach>
      <tr>
      <td>Tổng tiền</td>
      <td>${tongTien}</td>
        <input type="hidden" value="${tongTien}" name = "tongTien">
      </tr>
    </table>


    <div class="payment-method">
      <label
      ><input type="radio" name="payment" value ="ck" checked />Chuyển khoản </label
      >
      <p>
        Vui lòng gửi thông tin chi tiết địa chỉ (số nhà, xã phường) để chúng
        tôi giao nhận tận nơi cho quý khách
      </p>

      <label
      ><input type="radio" name="payment" value ="tm" /> Trả tiền mặt khi nhận
        hàng</label
      >
    </div>


    <button class="place-order" type = "submit">Xác nhận đặt hàng</button>

    <p class="privacy-note">
      Thông tin cá nhân của bạn sẽ được sử dụng để xử lý đơn hàng, tăng trải
      nghiệm sử dụng website, và cho các mục đích khác đã được mô tả trong
      privacy policy của chúng tôi.
    </p>
  </div>
  </form>
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

<script src="main.js"></script>
</body>
</html>
