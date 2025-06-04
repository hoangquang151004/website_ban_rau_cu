<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8"/>
  <title>Admin - Thêm sản phẩm</title>
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
    <h2>Thêm sản phẩm</h2>

    <!-- Form upload ảnh phải có enctype -->
    <form action="them-san-pham" method="post" enctype="multipart/form-data">
      <table width="80%" cellspacing="0" cellpadding="12">
        <tr>
          <td>
            <label for="ten-san-pham">Tên sản phẩm:</label>
            <input type="text" id="ten-san-pham" name="ten-san-pham" required/>
          </td>
          <td>
            <label for="gia-san-pham">Giá sản phẩm:</label>
            <input type="number" step="0.01" id="gia-san-pham" name="gia-san-pham" required/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="loai-san-pham">Loại sản phẩm:</label>
            <select id="loai-san-pham" name="loai-san-pham">
              <option value="rau">Rau</option>
              <option value="qua">Quả</option>
              <option value="gia_vi">Gia vị</option>
              <option value="hat">Hạt</option>
            </select>
          </td>
          <td>
            <label for="mo-ta">Mô tả:</label>
            <textarea id="mo-ta" name="mo-ta"></textarea>
          </td>
        </tr>
        <tr>
          <td>
            <label for="xuat-xu">Xuất xứ:</label>
            <input type="text" id="xuat-xu" name="xuat-xu" required/>
          </td>
          <td>
            <label for="so-luong">Số lượng:</label>
            <input type="number" id="so-luong" name="so-luong" required/>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <label for="anh-san-pham">Ảnh sản phẩm:</label>
            <input type="file" id="anh-san-pham" name="anh-san-pham" accept=".jpg, .jpeg, .png, .gif" required/>
          </td>
        </tr>
      </table>

      <button class="btn btn-them" type="submit">Thêm sản phẩm</button>
    </form>
  </div>
</main>
</body>
</html>
