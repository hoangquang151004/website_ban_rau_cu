package com.controller;

import com.dao.DangNhapDAO;
import com.dao.TaiKhoanDAO;
import com.entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dangnhap")
public class DangNhapServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String tenTaiKhoan = req.getParameter("tenTaiKhoan");
        String matKhau = req.getParameter("matKhau");

        DangNhapDAO dao = new DangNhapDAO();
        TaiKhoan tk = dao.dangNhap(tenTaiKhoan, matKhau);

        if(tk != null) {
            if (tk.getQuyen().equals("user")) {
                // Đăng nhập thành công
                HttpSession session = req.getSession();
                session.setAttribute("taikhoan", tk);
                resp.sendRedirect("trangchu"); // về trang chủ hoặc dashboard
            } else if (tk.getQuyen().equals("admin")) {
                HttpSession session = req.getSession();
                session.setAttribute("user", tk);
                resp.sendRedirect("admin.jsp");
            }
        }
        else {
            // Đăng nhập thất bại
            req.setAttribute("error", "Tên tài khoản hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("dangnhap.jsp").forward(req, resp);
        }
    }
}
