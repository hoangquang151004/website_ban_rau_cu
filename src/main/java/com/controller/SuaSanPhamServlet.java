package com.controller;

import com.dao.SanPhamDAO;
import com.entity.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet("/sua-san-pham")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,    // 2MB
        maxFileSize = 1024 * 1024 * 10,         // 10MB
        maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class SuaSanPhamServlet extends HttpServlet {
    private static final String IMAGE_UPLOAD_DIR = "image";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Đường dẫn thực tế đến thư mục lưu ảnh
        String uploadPath = request.getServletContext().getRealPath("/") + IMAGE_UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            // Lấy thông tin từ form
            int maSanPham = Integer.parseInt(request.getParameter("ma-san-pham"));
            String tenSanPham = request.getParameter("ten-san-pham");
            double giaSanPham = Double.parseDouble(request.getParameter("gia-san-pham"));
            String loaiSanPham = request.getParameter("loai-san-pham");
            String moTa = request.getParameter("mo-ta");
            String xuatXu = request.getParameter("xuat-xu");
            int soLuong = Integer.parseInt(request.getParameter("so-luong"));

            SanPhamDAO dao = new SanPhamDAO();
            SanPham sanPhamCu = dao.getById(maSanPham);

            // Xử lý ảnh
            Part filePart = request.getPart("anh-san-pham");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            String tenFileAnh = sanPhamCu.getAnhSanPham(); // mặc định giữ ảnh cũ

            if (fileName != null && !fileName.isEmpty()) {
                tenFileAnh = System.currentTimeMillis() + "_" + fileName;
                String filePath = uploadPath + File.separator + tenFileAnh;

                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, Paths.get(filePath));
                }

                // Xóa ảnh cũ nếu tồn tại
                File oldImage = new File(uploadPath + File.separator + sanPhamCu.getAnhSanPham());
                if (oldImage.exists()) {
                    oldImage.delete();
                }
            }

            // Tạo đối tượng mới để cập nhật
            SanPham sanPham = new SanPham();
            sanPham.setMaSanPham(maSanPham);
            sanPham.setTenSanPham(tenSanPham);
            sanPham.setGiaSanPham(giaSanPham);
            sanPham.setLoaiSanPham(loaiSanPham);
            sanPham.setMoTa(moTa);
            sanPham.setXuatXu(xuatXu);
            sanPham.setSoLuong(soLuong);
            sanPham.setAnhSanPham(tenFileAnh); // giữ hoặc gán ảnh mới

            boolean thanhCong = dao.update(maSanPham, sanPham);
            if (thanhCong) {
                response.sendRedirect("quanlysanpham.jsp");
            } else {
                request.setAttribute("error", "Cập nhật sản phẩm thất bại.");
                request.getRequestDispatcher("loi.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi cập nhật sản phẩm.");
            request.getRequestDispatcher("loi.jsp").forward(request, response);
        }
    }
}
