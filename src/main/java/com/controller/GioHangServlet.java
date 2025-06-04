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

@WebServlet("/giohang")
public class GioHangServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        List<SanPham> gioHang = (List<SanPham>) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new ArrayList<>();
        }

        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        int maSanPham = req.getParameter("maSanPham") == null ? 0 : Integer.parseInt(req.getParameter("maSanPham"));

        if (action.equals("")) {
            if (maSanPham != 0) {
                SanPham sp = new SanPhamDAO().getById(maSanPham);
                boolean daCo = false;
                for (SanPham sanPham : gioHang) {
                    if (sanPham.getMaSanPham() == maSanPham) {
                        daCo = true;
                        break;
                    }
                }
                if (!daCo) {
                    gioHang.add(sp);
                }
                session.setAttribute("gioHang", gioHang);
                req.getRequestDispatcher("/trangchu").forward(req, resp);
            } else {
                req.getRequestDispatcher("/giohang.jsp").forward(req, resp);
            }
        } else if (action.equals("xoa")) {
            if (maSanPham != 0) {
                gioHang.removeIf(sp -> sp.getMaSanPham() == maSanPham);
            }
            session.setAttribute("gioHang", gioHang);
            req.getRequestDispatcher("/giohang.jsp").forward(req, resp);
        }
    }
}
