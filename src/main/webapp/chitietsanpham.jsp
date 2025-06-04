<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <div class="search-bar">
      <input
              type="text"
              placeholder="Tìm kiếm sản phẩm bạn muốn..."
              class="input-header"
      />
      <button class="btn_main">🔍</button>
    </div>

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
    <div class="product-detail-container">
      <div class="product-image">
        <img src="image/${sp.anhSanPham}" alt="${sp.tenSanPham}" />
      </div>

      <div class="product-info" style="height: 500px">
        <input type="hidden" value="${sp.maSanPham}">
        <h1>${sp.tenSanPham}</h1>
        <p class="price">${sp.giaSanPham}đ</p>

        <form action="cart.html" method="POST" style="margin: 10px">
          <label for="quantity">Số lượng:</label>
          <label>${sp.soLuong}</label>
          <button type="submit" class="btn_main"><a href="giohang?maSanPham=${sp.maSanPham}" >Mua hàng</a></button>
        </form>


        <div class="product-meta">
          <ul>

            <li><strong>Xuất xứ:</strong> ${sp.xuatXu}</li>
            <li><strong>Mô tả:</strong> ${sp.moTa}</li>
          </ul>
        </div>

        <div class="back-link">
          <a href="trangchu">← Quay lại danh sách sản phẩm</a>
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
