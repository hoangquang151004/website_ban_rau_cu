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
    <div class="order-history-container" style="height: 480px">
      <h2>Đơn hàng của bạn</h2>
      <table class="order-table">
        <thead>
          <tr>
            <th>Mã đơn hàng</th>
            <th>Ngày đặt</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Chi tiết</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="dh" items="${donHangList}">
          <tr>
            <td>${dh.maDonHang}</td>
            <td>${dh.ngayDat}</td>
            <td>${dh.tongTien}</td>

            <td><c:choose>
              <c:when test="${dh.trangThai eq 'Đang giao hàng'}">
                <span class="status processing">${dh.trangThai}</span>
              </c:when>
              <c:when test="${dh.trangThai eq 'Đã giao hàng'}">
                <span class="status completed">${dh.trangThai}</span>
              </c:when>
              <c:when test="${dh.trangThai eq 'Đã hủy'}">
                <span class="status cancelled">${dh.trangThai}</span>
              </c:when>
              <c:otherwise>
                <span class="status">${dh.trangThai}</span>
              </c:otherwise>
            </c:choose></td>
            <td><a href="donhang?action=xemct&maDonHang=${dh.maDonHang}">Xem</a></td>
          </tr>
        </c:forEach>

        </tbody>
      </table>
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
