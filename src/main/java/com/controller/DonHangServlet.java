package com.controller;

import com.dao.ChiTietDonHangDAO;
import com.dao.DonHangDAO;
import com.entity.DonHang;
import com.entity.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
@WebServlet("/donhang")
public class DonHangServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        int page = 1;
        int recordsPerPage = 5;
        DonHangDAO dao = new DonHangDAO();
        ChiTietDonHangDAO ctDAO = new ChiTietDonHangDAO();
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        if (action.equals("")) {
            List<DonHang> donHangList = dao.getByTPage((page - 1)* recordsPerPage,recordsPerPage);
            int totalRecords = dao.getTotal();
            int totalPages = (int) Math.ceil((double) totalRecords/recordsPerPage);
            req.setAttribute("donHangList", donHangList);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("quanlydonhang.jsp").forward(req, resp);
        } else if (action.equals("xem")) {
            String maDonHang = req.getParameter("maDonHang");
            DonHang donHang = dao.getById(Integer.parseInt(maDonHang));
            List<SanPham> sanPhamList = ctDAO.getChiTietDonHang(Integer.parseInt(maDonHang));
            req.setAttribute("sanPhamList", sanPhamList);
            req.setAttribute("donHang", donHang);
            req.getRequestDispatcher("cthd_admin.jsp").forward(req, resp);

        } else if (action.equals("sua")) {
            String maDonHang = req.getParameter("maDonHang");
            DonHang donHang = dao.getById(Integer.parseInt(maDonHang));
            req.setAttribute("donHang", donHang);
            req.getRequestDispatcher("suadonhang.jsp").forward(req, resp);
        } else if (action.equals("xoa")) {
            String maDonHang = req.getParameter("maDonHang");
            ctDAO.delete(Integer.parseInt(maDonHang));
            dao.delete(Integer.parseInt(maDonHang));
            resp.sendRedirect("donhang?message=deleted");
        } else if (action.equals("tim")) {
            String keyword = req.getParameter("keyword");
            List<DonHang> donHangList = dao.getByTPageFind(keyword,(page - 1)* recordsPerPage,recordsPerPage);
            int totalRecords = dao.getTotalFind(keyword);
            int totalPages = (int) Math.ceil((double) totalRecords/recordsPerPage);
            req.setAttribute("donHangList", donHangList);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("donhang.jsp").forward(req, resp);
        } else if (action.equals("lichsu")) {
            String maTaiKhoan = req.getParameter("maTaiKhoan") == null ? "" : req.getParameter("maTaiKhoan");
         if (maTaiKhoan.equals("")) {
             resp.sendRedirect("dangnhap.jsp");
         }
         else {
             List<DonHang> donHangList = dao.getByTPageUser(maTaiKhoan,(page - 1)* recordsPerPage,recordsPerPage);
             int totalRecords = dao.getTotalUser(maTaiKhoan);
             int totalPages = (int) Math.ceil((double) totalRecords/recordsPerPage);
             req.setAttribute("donHangList", donHangList);
             req.setAttribute("currentPage", page);
             req.setAttribute("totalPages", totalPages);
             req.getRequestDispatcher("lichsudonhang.jsp").forward(req, resp);
         }
        } else if (action.equals("xemct")) {
            String maDonHang = req.getParameter("maDonHang");
            DonHang donHang = dao.getById(Integer.parseInt(maDonHang));
            List<SanPham> sanPhamList = ctDAO.getChiTietDonHang(Integer.parseInt(maDonHang));
            req.setAttribute("sanPhamList", sanPhamList);
            req.setAttribute("donHang", donHang);
            req.getRequestDispatcher("chitiethoadon.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        if(action.equals("")) {
            DonHangDAO dao = new DonHangDAO();
            String maDonHang = req.getParameter("madonhang");
            String tenTaiKhoan  = req.getParameter("tentk");
            Date ngayDat = Date.valueOf(req.getParameter("ngayDat"));
            String SDT = req.getParameter("SDT");
            String diaChiGiao = req.getParameter("diachigiao");
            String trangThai = req.getParameter("trangThai");
            String phuongThucTT  = req.getParameter("phuongThucTT");
            String ghiChu = req.getParameter("ghiChu");
            double tongTien = Double.parseDouble(req.getParameter("tongTien"));

            DonHang donHang = new DonHang(tenTaiKhoan,ngayDat,SDT,diaChiGiao,phuongThucTT,ghiChu,trangThai,tongTien);
            dao.update(Integer.parseInt(maDonHang),donHang);
            resp.sendRedirect("donhang");
        } else if (action.equals("tim")) {
            int page = 1;
            int recordsPerPage = 5;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            DonHangDAO dao = new DonHangDAO();
            String keyword = req.getParameter("keyword");
            List<DonHang> donHangList = dao.getByTPageFind(keyword,(page - 1)* recordsPerPage,recordsPerPage);
            int totalRecords = dao.getTotalFind(keyword);
            System.out.println("tong"+totalRecords);
            int totalPages = (int) Math.ceil((double) totalRecords/recordsPerPage);
            req.setAttribute("donHangList", donHangList);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("quanlydonhang.jsp").forward(req, resp);
        }

    }
}
