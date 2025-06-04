package com.controller;

import com.dao.DangKiDAO;
import com.entity.TaiKhoan;
import com.dao.TaiKhoanDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
@WebServlet("/dangki")
public class DangKiServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        try {
            String tenTaiKhoan = req.getParameter("tenTaiKhoan");
            String matKhau = req.getParameter("matKhau");
            String quyen = req.getParameter("quyen");
            String hoTen = req.getParameter("hoTen");
            String diaChi = req.getParameter("diaChi");
            String SDT = req.getParameter("SDT");
            String email = req.getParameter("email");
            Date ngaySinh = Date.valueOf(req.getParameter("ngaySinh"));

            TaiKhoan tk = new TaiKhoan();
            tk.setTenTaiKhoan(tenTaiKhoan);
            tk.setMatKhau(matKhau);
            tk.setQuyen(quyen != null ? quyen : "user");
            tk.setHoTen(hoTen);
            tk.setNgaySinh(ngaySinh);
            tk.setDiaChi(diaChi);
            tk.setSDT(SDT);
            tk.setEmail(email);

            DangKiDAO dao = new DangKiDAO();
            dao.DangKi(tk);

            // Sau khi đăng ký thành công, chuyển sang trang đăng nhập
            resp.sendRedirect("dangnhap.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Đăng ký thất bại!");
            req.getRequestDispatcher("dangki.jsp").forward(req, resp);
        }
    }
}
