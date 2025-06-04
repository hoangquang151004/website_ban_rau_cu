<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <title>Admin - Trang quản trị</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/admin/style.css" />
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
    <h2>Sửa sản phẩm</h2>

    <!-- FORM gửi dữ liệu sửa -->
    <form action="sua-san-pham" method="post" enctype="multipart/form-data">
      <!-- Gửi mã sản phẩm để biết đang sửa cái nào -->
      <input type="hidden" name="ma-san-pham" value="${sanPham.maSanPham}" />

      <table width="80%" cellspacing="0" cellpadding="12">
        <tr>
          <td>
            <label for="ten-san-pham">Tên sản phẩm:</label>
            <input type="text" id="ten-san-pham" name="ten-san-pham" value="${sanPham.tenSanPham}" required />
          </td>
          <td>
            <label for="gia-san-pham">Giá sản phẩm:</label>
            <input type="number" step="0.01" id="gia-san-pham" name="gia-san-pham" value="${sanPham.giaSanPham}" required />
          </td>
        </tr>
        <tr>
          <td>
            <label for="loai-san-pham">Loại sản phẩm:</label>
            <select id="loai-san-pham" name="loai-san-pham">
              <option value="rau" <c:if test="${sanPham.loaiSanPham == 'rau'}">selected</c:if>>Rau</option>
              <option value="qua" <c:if test="${sanPham.loaiSanPham == 'qua'}">selected</c:if>>Quả</option>
              <option value="thit" <c:if test="${sanPham.loaiSanPham == 'gia_vi'}">selected</c:if>>Gia vị</option>
              <option value="hai-san" <c:if test="${sanPham.loaiSanPham == 'hat'}">selected</c:if>>Hạt</option>
            </select>
          </td>
          <td>
            <label for="mo-ta">Mô tả:</label>
            <textarea id="mo-ta" name="mo-ta">${sanPham.moTa}</textarea>
          </td>
        </tr>
        <tr>
          <td>
            <label for="xuat-xu">Xuất xứ:</label>
            <input type="text" id="xuat-xu" name="xuat-xu" value="${sanPham.xuatXu}" required />
          </td>
          <td>
            <label for="so-luong">Số lượng:</label>
            <input type="number" id="so-luong" name="so-luong" value="${sanPham.soLuong}" required />
          </td>
        </tr>
        <tr>
          <td >
            <label for="anh-san-pham">Ảnh sản phẩm mới (nếu muốn thay):</label>
            <input type="file" id="anh-san-pham" name="anh-san-pham" accept=".jpg, .jpeg, .png, .gif" />
          </td>
          <td>
            <b>Ảnh hiện tại:</b><br/>
            <img src="image/${sanPham.anhSanPham}" width="150" alt="Ảnh sản phẩm" />
          </td>
        </tr>
      </table>

      <button class="btn btn-sua" type="submit">Cập nhật sản phẩm</button>
    </form>
  </div>
</main>
</body>
</html>
