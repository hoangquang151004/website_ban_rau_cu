package com.dao;

import com.database.DBcontext;
import com.entity.TaiKhoan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DangNhapDAO {
    public TaiKhoan dangNhap(String tenTaiKhoan, String matKhau) {
        String sql = "SELECT * FROM TaiKhoan WHERE tenTaiKhoan = ? AND matKhau = ?";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, tenTaiKhoan);
            ps.setString(2, matKhau);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                TaiKhoan tk = new TaiKhoan();
                tk.setTenTaiKhoan(rs.getString("tenTaiKhoan"));
                tk.setMatKhau(rs.getString("matKhau"));
                tk.setHoTen(rs.getString("hoTen"));
                tk.setQuyen(rs.getString("quyen"));
                tk.setNgaySinh(rs.getDate("ngaySinh"));
                tk.setDiaChi(rs.getString("diaChi"));
                tk.setSDT(rs.getString("SDT"));
                tk.setEmail(rs.getString("email"));
                return tk;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Không đúng thông tin đăng nhập
    }
}
