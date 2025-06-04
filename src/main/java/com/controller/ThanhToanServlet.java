package com.controller;
import com.dao.SanPhamDAO;
import com.entity.SanPham;
import com.entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/thanhtoan")
public class ThanhToanServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String[] maSanPhamArr = request.getParameterValues("maSanPham[]");
        String[] soLuongArr = request.getParameterValues("soLuong[]");
        String tongTien = request.getParameter("tongTien");
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        List<SanPham> danhSachMua = new ArrayList<>();
        System.out.println("ThanhToanServlet: start");

        if (maSanPhamArr != null && soLuongArr != null) {
            for (int i = 0; i < maSanPhamArr.length; i++) {
                int ma = Integer.parseInt(maSanPhamArr[i]);
                int sl = Integer.parseInt(soLuongArr[i]);

                SanPham sp = sanPhamDAO.getById(ma); // Lấy từ DB hoặc Session
                if (sp != null) {
                    sp.setSoLuong(sl); // Cập nhật số lượng người dùng chọn
                    danhSachMua.add(sp);
                }
            }
        }
        request.setAttribute("danhSachMua", danhSachMua);
        request.setAttribute("tongTien", tongTien);
        request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
    }

}
