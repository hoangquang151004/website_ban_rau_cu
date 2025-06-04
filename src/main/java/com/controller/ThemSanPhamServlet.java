package com.controller;
import com.dao.SanPhamDAO;
import com.database.DBcontext;
import com.entity.SanPham;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/them-san-pham")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,     // 2MB
        maxFileSize = 1024 * 1024 * 10,          // 10MB
        maxRequestSize = 1024 * 1024 * 50)       // 50MB
public class ThemSanPhamServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String tenSanPham = request.getParameter("ten-san-pham");
        double giaSanPham = Double.parseDouble(request.getParameter("gia-san-pham"));
        String loaiSanPham = request.getParameter("loai-san-pham");
        String moTa = request.getParameter("mo-ta");
        String xuatXu = request.getParameter("xuat-xu");
        int soLuong = Integer.parseInt(request.getParameter("so-luong"));

        // Xử lý file ảnh
        Part filePart = request.getPart("anh-san-pham");
        String fileName = new File(filePart.getSubmittedFileName()).getName();

        // Đường dẫn lưu file ảnh (trong thư mục /admin/image)
        String uploadPath = getServletContext().getRealPath("") + File.separator + "image";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        // Lưu file vào thư mục
        filePart.write(uploadPath + File.separator + fileName);

        // Tạo đối tượng sản phẩm
        SanPham product = new SanPham();
        product.setTenSanPham(tenSanPham);
        product.setGiaSanPham(giaSanPham);
        product.setLoaiSanPham(loaiSanPham);
        product.setMoTa(moTa);
        product.setXuatXu(xuatXu);
        product.setSoLuong(soLuong);
        product.setAnhSanPham(fileName);  // đường dẫn ảnh trong ứng dụng web

        try (Connection conn = new DBcontext().getConnection()) {
            SanPhamDAO dao = new SanPhamDAO();
            if (dao.insertProduct(product)) {
                response.sendRedirect("/sanpham");
            } else {
                response.getWriter().println("Thêm sản phẩm thất bại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi khi thêm sản phẩm: " + e.getMessage());
        }
    }
}
