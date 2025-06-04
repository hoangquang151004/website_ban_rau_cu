package com.controller;

import com.dao.ChiTietDonHangDAO;
import com.dao.DonHangDAO;
import com.entity.ChiTietDonHang;
import com.entity.DonHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/xacnhan")
public class XacNhanDonHangServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String tenTaiKhoan = req.getParameter("tenTaiKhoan");
        String diaChi = req.getParameter("diaChi");
        String SDT = req.getParameter("SDT");
        String ghiChu = req.getParameter("ghiChu");
        String phuongThucThanhToan = req.getParameter("payment");
        int tongTien = Integer.valueOf(req.getParameter("tongTien"));

        DonHangDAO donHangDAO = new DonHangDAO();
        ChiTietDonHangDAO chiTietDonHangDAO = new ChiTietDonHangDAO();

        DonHang dh = new DonHang();
        dh.setTenTaiKhoan(tenTaiKhoan);
        dh.setDiaChiGiao(diaChi);
        dh.setSoDienThoaiNhan(SDT);
        dh.setGhiChu(ghiChu);
        dh.setPhuongThucTT(phuongThucThanhToan);
        dh.setNgayDat(Date.valueOf(LocalDate.now()));
        dh.setTongTien(tongTien);
        System.out.println(dh.toString());
        donHangDAO.insertDonHang(dh);

        ChiTietDonHang ct = new ChiTietDonHang();
        int maDonHang = donHangDAO.layMaDonHang();
        ct.setMaDonHang(maDonHang);
        ct.setTenTaiKhoan(tenTaiKhoan);
        ct.setTenTaiKhoan(tenTaiKhoan);

        String[] maSanPham = req.getParameterValues("maSanPham[]");
        String[] soLuong = req.getParameterValues("soLuong[]");

        ct.setMaSanPham(maSanPham);
        ct.setSoLuong(soLuong);
        chiTietDonHangDAO.insertChiTiet(ct);

        HttpSession session = req.getSession();
        session.setAttribute("gioHang", null);
        req.setAttribute("maDonHang", maDonHang);
        req.getRequestDispatcher("thanhcong.jsp").forward(req, resp);
    }

}
