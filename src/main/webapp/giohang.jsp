<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="com.entity.SanPham" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.TaiKhoan" %>
<%
  List<SanPham> gioHang = (List<SanPham>) session.getAttribute("gioHang");
  TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("tk");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Giỏ hàng - Green Mart</title>
  <link rel="stylesheet" href="asset/user/style.css?v=<%= System.currentTimeMillis() %>" />
  <style>
    /* ================= FORM GIỎ HÀNG ================= */

    .cart-container {
      max-width: 1000px;
      margin: 40px auto;
      padding: 20px;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0,0,0,0.1);
    }

    .cart-table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    .cart-table th, .cart-table td {
      padding: 16px;
      text-align: center;
      vertical-align: middle;
      border-bottom: 1px solid #eee;
    }

    .cart-table th {
      background-color: #f0f8f5;
      font-weight: 600;
      color: #2b7a5e;
    }

    .cart-product {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .cart-product img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 8px;
      border: 1px solid #ddd;
    }

    .quantity input[type="number"] {
      width: 60px;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 6px;
      text-align: center;
    }

    .tong input {
      width: 80px;
      padding: 5px;
      border: none;
      background-color: transparent;
      text-align: right;
      color: #333;
      font-weight: bold;
    }

    .gia {
      font-weight: bold;
      color: #28a745;
    }

    .btn_main2 {
      background-color: #e74c3c;
      color: white;
      padding: 6px 12px;
      border-radius: 6px;
      text-decoration: none;
      font-size: 14px;
      transition: background 0.3s;
    }

    .btn_main2:hover {
      background-color: #c0392b;
    }

    .cart-summary {
      text-align: right;
      border-top: 1px solid #ddd;
      padding-top: 20px;
    }

    .cart-summary h3 {
      font-size: 20px;
      margin-bottom: 10px;
    }

    .cart-summary input[name="tongTien"] {
      font-weight: bold;
      font-size: 18px;
      padding: 5px 10px;
      border: none;
      background: none;
      text-align: right;
      color: #333;
      width: 150px;
    }

    .checkout-btn {
      margin-top: 15px;
      padding: 12px 24px;
      background-color: #2ecc71;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .checkout-btn:hover {
      background-color: #27ae60;
    }

    .cart-actions {
      margin-top: 20px;
      text-align: left;
    }

    .cart-actions .continue a {
      padding: 10px 20px;
      background-color: #3498db;
      color: white;
      border-radius: 8px;
      text-decoration: none;
      font-size: 14px;
    }

    .cart-actions .continue a:hover {
      background-color: #2980b9;
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

<div class="cart-container" style="height: 480px">
  <form action="thanhtoan" method="post">
    <table class="cart-table">
      <tbody>
      <c:forEach var="sp" items="${gioHang}" varStatus="i">
        <tr>
          <td>
            <div class="cart-product">
              <!-- Mã sản phẩm -->
              <input type="hidden" name="maSanPham[]" value="${sp.maSanPham}">
              <img src="image/${sp.anhSanPham}" alt="${sp.tenSanPham}" />
              <span>${sp.tenSanPham}</span>
            </div>
          </td>
          <td class="gia">${sp.giaSanPham}đ</td>

          <!-- Số lượng -->
          <td>
            <div class="quantity">
              <input type="number" min="1" max="${sp.soLuong}" value="1" name="soLuong[]">
            </div>
          </td>

          <!-- Tổng tiền mỗi dòng (tính bằng JavaScript) -->
          <td class="tong"><input type="number" value="${sp.giaSanPham}" name ="tong[]" >đ</td>
          <td>
            <a href="giohang?action=xoa&maSanPham=${sp.maSanPham}" class="btn_main2">Xóa</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <div class="cart-summary">
      <h3>Thành tiền</h3>
      <p>Tổng tiền: <input type ="text" name = "tongTien"> đ</p>

      <!-- Nút submit form -->
      <button class="btn checkout-btn" type="submit">Tiến hành thanh toán</button>
    </div>
  </form>

    <div class="cart-actions">
      <button class="btn btn_main2"><a href="trangchu">← Tiếp tục mua sắm</a></button>
    </div>
  </div>
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
      <p><span class="hotline">📞 Hotline:</span> 0379 775 286 / 0972 452 592 <span class="time">(7:00 - 21:30)</span></p>
      <p>📝 <span class="register">Đăng ký chào hàng vào Green Mart</span></p>
      <p>⛔ <span class="store-address">Cửa hàng: A106 chung cư Athena Xuân Phương, Nam Từ Liêm.</span></p>
    </div>
  </div>
  <div class="footer-bottom">
    <p>© 2023. Green Mart. Cửa hàng: A106 chung cư Athena Xuân Phương, Nam Từ Liêm, Hà Nội. Email: dienct87@gmail.com. Chịu trách nhiệm nội dung: Green Mart</p>
  </div>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const giaFormat = (n) => new Intl.NumberFormat("vi-VN").format(n) + "đ";

    function capNhatTongTien() {
      const rows = document.querySelectorAll(".cart-table tbody tr");
      let tongTatCa = 0;

      rows.forEach((row) => {
        const giaText = row.querySelector(".gia").innerText.replace("đ", "").replace(/\./g, "").trim();
        const soLuongInput = row.querySelector("input[type='number']");
        const oTongTien = row.querySelector(".tong");

        const gia = parseInt(giaText)/10;
        const soLuong = parseInt(soLuongInput.value);

        const tong = gia * soLuong;
        oTongTien.innerText = giaFormat(tong);
        tongTatCa += tong;
      });

      // Cập nhật tổng tiền
      const tongTienDOM = document.querySelector(".cart-summary input:last-child");
      if (tongTienDOM) {
        tongTienDOM.setAttribute("Value",tongTatCa+"")
      }
    }

    // Gắn sự kiện thay đổi số lượng
    document.querySelectorAll(".cart-table input[type='number']").forEach((input) => {
      input.addEventListener("change", capNhatTongTien);
      input.addEventListener("input", capNhatTongTien);
    });

    // Khởi tạo tổng tiền ban đầu
    capNhatTongTien();
  });

</script>
</body>
</html>
