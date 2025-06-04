package com.controller;
import com.dao.ThongKeDAO;
import com.entity.SanPham;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/thongke")
public class ThongKeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        ThongKeDAO dao = new ThongKeDAO();

        int tongDonHang = dao.tongDonHang(new Date(2000-1-1),Date.valueOf(LocalDate.now()));
        int tongDoanhThu = dao.tongDanhThu(new Date(2000-1-1),Date.valueOf(LocalDate.now()));

        List<SanPham> spBanChay = dao.getSanPham(new Date(2000-1-1),Date.valueOf(LocalDate.now()));
        List<String> khMuaNhieu = dao.getTaiKhoan(new Date(2000-1-1),Date.valueOf(LocalDate.now()));

        req.setAttribute("tongDonHang", tongDonHang);
        req.setAttribute("tongDoanhThu", tongDoanhThu);
        req.setAttribute("khMuaNhieu", khMuaNhieu);
        req.setAttribute("spBanChay", spBanChay);
        req.getRequestDispatcher("thongke.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        Date tu = Date.valueOf(req.getParameter("tu"));
        Date den = Date.valueOf(req.getParameter("den"));
        ThongKeDAO dao = new ThongKeDAO();

        int tongDonHang = dao.tongDonHang(tu,den);
        int tongDoanhThu = dao.tongDanhThu(tu,den);

        List<SanPham> spBanChay = dao.getSanPham(tu,den);
        List<String> khMuaNhieu = dao.getTaiKhoan(tu,den);

        req.setAttribute("tongDonHang", tongDonHang);
        req.setAttribute("tongDoanhThu", tongDoanhThu);
        req.setAttribute("khMuaNhieu", khMuaNhieu);
        req.setAttribute("spBanChay", spBanChay);
        req.getRequestDispatcher("thongke.jsp").forward(req, resp);
    }
}
