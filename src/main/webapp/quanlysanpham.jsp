<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Admin - Trang quản trị</title>
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
        <div class="container" style="height: 700px">
            <h2>Quản lý sản phẩm</h2>
            <form action ="sanpham" method="post">
                <div class="top-action">
                    <a class="btn btn-them" href="themsanpham.jsp">Thêm sản phẩm</a>
                    <div class="top-right">
                        <input type="text" placeholder="Tìm kiếm sản phẩm..." class="search-box" name="keyword">
                        <input type="submit" class="btn btn-timkiem" value = "Tìm kiếm sản phẩm">
                    </div>
                </div>
            </form>

            
            <table border="1" width="80%" cellspacing="0" cellpadding="12">
                <thead>
                <tr>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá sản phẩm</th>
                    <th>Loại sản phẩm</th>
                    <th>Xuất xứ</th>
                    <th>Số lượng</th>
                    <th>Ảnh sản phẩm</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu tài khoản sẽ được lặp qua ở đây -->
                <c:forEach var="pro" items="${sanPhamList}">
                    <tr>
                    <td>${pro.maSanPham}</td>
                    <td>${pro.tenSanPham}</td>
                    <td>${pro.giaSanPham}</td>
                    <td>${pro.loaiSanPham}</td>
                    <td>${pro.xuatXu}</td>
                    <td>${pro.soLuong}</td>
                    <td><img src="image/${pro.anhSanPham}" alt="${pro.anhSanPham}"></td>
                    <td><a href="sanpham?action=sua&maSanPham=${pro.maSanPham}" class="btn btn-sua">Sửa</a>
                        <a href="sanpham?action=xoa&maSanPham=${pro.maSanPham}&page=${page}"  class="btn btn-xoa"  onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản này không?');">Xóa</a></td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
        <c:forEach var = "i" begin="1" end="${totalPage}">
            <a href="sanpham?page=${i}">${i}</a>
        </c:forEach>

    </main>
  </body>
</html>
