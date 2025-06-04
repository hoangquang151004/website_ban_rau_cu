package com.controller;

import com.dao.SanPhamDAO;
import com.entity.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TrangChuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        SanPhamDAO dao = new SanPhamDAO();
        if(action.equals("")){
            int page = 1;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            int pagePerRecord = 5;
            int totalRecords = dao.getCount();
            int totalPage = (int) Math.ceil((double) totalRecords / pagePerRecord);
            List<SanPham> sanPhamList = dao.getByPage((page - 1) * pagePerRecord, pagePerRecord);
            System.out.println("SL: " + totalRecords);
            req.setAttribute("sanPhamList", sanPhamList);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("page", page);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else if (action.equals("xem")) {
            int maSanPham = Integer.parseInt(req.getParameter("maSanPham"));
            SanPham sp = dao.getById(maSanPham);
            req.setAttribute("sp", sp);
            req.getRequestDispatcher("chitietsanpham.jsp").forward(req, resp);
        }else if (action.equals("muahang")) {
            int maSanPham = Integer.parseInt(req.getParameter("maSanPham"));
            SanPham sp = dao.getById(maSanPham);

            HttpSession session = req.getSession();
            List<SanPham> gioHang = (List<SanPham>) session.getAttribute("gioHang");

            if (gioHang == null) {
                gioHang = new ArrayList<>();
            }
            gioHang.add(sp);
            session.setAttribute("gioHang", gioHang);
            resp.sendRedirect("giohang");
        }else if (action.equals("loc")) {
            String keyword = req.getParameter("keyword");
            int page = 1;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            int pagePerRecord = 5;
            int totalRecords = dao.getCountFillter(keyword);
            int totalPage = (int) Math.ceil((double) totalRecords / pagePerRecord);
            List<SanPham> sanPhamList = dao.fillter(keyword,(page - 1) * pagePerRecord, pagePerRecord);
            System.out.println("SL: " + totalRecords);
            req.setAttribute("sanPhamList", sanPhamList);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("page", page);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }

        }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String keyword = req.getParameter("keyword");
        SanPhamDAO dao = new SanPhamDAO();
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        int pagePerRecord = 5;
        int totalRecords = dao.getCountFind(keyword,keyword);
        int totalPage = (int) Math.ceil((double) totalRecords / pagePerRecord);
        List<SanPham> sanPhamList = dao.find(keyword,keyword,(page - 1) * pagePerRecord, pagePerRecord);
        System.out.println("SL: " + totalRecords);
        req.setAttribute("sanPhamList", sanPhamList);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("page", page);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
