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
  <title>Green Mart</title>
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

<div class="container">
  <aside>
    <div class="sidebar">
      <h3>Danh mục sản phẩm </h3>

      <div class="menu">
        <div class="menu-item">
          <div class="menu-title"><a href="trangchu?action=loc&keyword=rau">Rau củ</a></div>
          </ul>
        </div>
        <div class="menu-item">
          <div class="menu-title"><a href="trangchu?action=loc&keyword=qua">Trái cây</a></div>
        </div>
        <div class="menu-item">
          <div class="menu-title"><a href="trangchu?action=loc&keyword=thit">Hạt</a></div>

        </div>
        <div class="menu-item">
          <div class="menu-title"><a href="trangchu?action=loc&keyword=hai-san">Gia Vị</a></div>
        </div>
      </div>
    </div>

    <div class="sidebar">
      <h3>Sản phầm bán chạy</h3>
      <div class="hot-products">
        <div class="hot-product-item">
          <img src="image/dua.jpg" alt="Mì Kokomi Lẩu Bò" />
          <div class="info">
            <p class="name">Dứa Đà nẵng</p>
            <p class="price">35,000₫</p>
          </div>
        </div>
        <div class="hot-product-item">
          <img src="image/cam.jpg" alt="Mì Kokomi Tôm Chua Cay" />
          <div class="info">
            <p class="name">Cam sành Tuyên Quang</p>
            <p class="price">20,000₫</p>
          </div>
        </div>
        <div class="hot-product-item">
          <img src="image/tao.jpg" alt="Mì Kokomi Tôm Chua Cay" />
          <div class="info">
            <p class="name">Táo Mèo Hà Giang</p>
            <p class="price">30,000₫</p>
          </div>
        </div>
        <!-- Lặp lại cho các sản phẩm khác -->
      </div>
    </div>
  </aside>

  <main>
    <div class="banner">
      <img
              src="https://vinafruit.com.vn/wp-content/uploads/2018/09/1.jpg"
              alt="Banner"
              height="170px"
      />
    </div>

    <h2>Phiên chợ SIÊU GIẢM GIÁ</h2>
    <div class="product-list">
      <c:forEach var="pro" items="${sanPhamList}">
        <div class="product">
          <img src="image/${pro.anhSanPham}" alt="${pro.anhSanPham}" style ="   height: 200px;width: 250px;">
          <p>${pro.tenSanPham}</p>
          <p class="price">${pro.giaSanPham}₫</p>
          <p>Số lượng: ${pro.soLuong}</p>
          <div class="btn_chossen">
            <a href="giohang?maSanPham=${pro.maSanPham}" class="btn_main" onclick="alert('Sản phẩm đã được thêm vào giỏ hàng')">Mua hàng</a>
            <a href="trangchu?action=xem&maSanPham=${pro.maSanPham}" class="btn_main2" >Xem chi tiết</a>
          </div>
        </div>
      </c:forEach>
    </div>
  </main>
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
