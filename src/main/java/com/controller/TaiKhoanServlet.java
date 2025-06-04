package com.controller;

import com.dao.TaiKhoanDAO;
import com.entity.TaiKhoan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/taikhoan")
public class TaiKhoanServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        int page = 1;
        int recordsPerPage = 5;
        if (req.getParameter("page") != null) {
        page = Integer.parseInt(req.getParameter("page"));}

        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        if (action.equals("")) {
           TaiKhoanDAO dao = new TaiKhoanDAO();
           List<TaiKhoan> tkList = new ArrayList<>();
           tkList = dao.getByTPage((page - 1)* recordsPerPage,recordsPerPage);
           int totalRecords = dao.getTotal();
           int totalPages = (int) Math.ceil((double) totalRecords/recordsPerPage);
            req.setAttribute("taiKhoanList", tkList);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("quanlytaikhoan.jsp").forward(req, resp);
        }
        else if (action.equals("sua")) {
            String tenTaiKhoan = req.getParameter("tenTaiKhoan");
            TaiKhoan taikhoan = new TaiKhoanDAO().findByID(tenTaiKhoan);
            req.setAttribute("taikhoan", taikhoan);
            req.getRequestDispatcher("suataikhoan.jsp").forward(req, resp);
        } else if (action.equals("xoa")) {
            String tenTaiKhoan = req.getParameter("tenTaiKhoan");
            TaiKhoanDAO dao = new TaiKhoanDAO();
            dao.delete(tenTaiKhoan);
            resp.sendRedirect("taikhoan?message=deleted");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        if (action.equals("")) {
            String timKiem = req.getParameter("txtTimKiem");
            System.out.println("servlet:"+ timKiem);
            List<TaiKhoan> tkList = new ArrayList<>();
            TaiKhoanDAO dao = new TaiKhoanDAO();
            tkList = dao.find(timKiem);
            req.setAttribute("taiKhoanList", tkList);
            req.getRequestDispatcher("quanlytaikhoan.jsp").forward(req, resp);
        }
        else if (action.equals("xacnhan-sua")) {
            String tenTaiKhoan = req.getParameter("tenTaiKhoan");
            String matKhau = req.getParameter("matKhau");
            String quyen = req.getParameter("quyen");
            String hoTen = req.getParameter("hoTen");
            Date ngaySinh = Date.valueOf(req.getParameter("ngaySinh"));
            String diaChi = req.getParameter("diaChi");
            String SDT = req.getParameter("SDT");
            String email = req.getParameter("email");

            TaiKhoan tk = new TaiKhoan(tenTaiKhoan, matKhau, quyen, hoTen, ngaySinh, diaChi, SDT, email);
            TaiKhoanDAO dao = new TaiKhoanDAO();
            dao.update(tenTaiKhoan, tk);

            // Truyền thông báo thành công
            req.setAttribute("message", "Cập nhật tài khoản thành công!");

            // Load lại danh sách để hiển thị (nếu cần)
            List<TaiKhoan> tkList = dao.getByTPage(0, 3);
            int totalRecords = dao.getTotal();
            int totalPages = (int) Math.ceil((double) totalRecords / 3);
            req.setAttribute("taiKhoanList", tkList);
            req.setAttribute("currentPage", 1);
            req.setAttribute("totalPages", totalPages);

            req.getRequestDispatcher("quanlytaikhoan.jsp").forward(req, resp);
        }


    }
}
