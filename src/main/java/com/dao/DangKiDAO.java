package com.dao;

import com.database.DBcontext;
import com.entity.TaiKhoan;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DangKiDAO {
    public void DangKi(TaiKhoan tk) {
        String sql = "INSERT INTO taikhoan (tenTaiKhoan, matKhau, quyen, hoTen, ngaySinh, diaChi, SDT, email) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, tk.getTenTaiKhoan());
            ps.setString(2, tk.getMatKhau());
            ps.setString(3, tk.getQuyen() != null ? tk.getQuyen() : "user");
            ps.setString(4, tk.getHoTen());
            ps.setDate(5, tk.getNgaySinh() != null ? new java.sql.Date(tk.getNgaySinh().getTime()) : null);
            ps.setString(6, tk.getDiaChi());
            ps.setString(7, tk.getSDT());
            ps.setString(8, tk.getEmail());

            ps.executeUpdate(); // Thực thi truy vấn
            System.out.println("Đăng ký tài khoản thành công!");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Đăng ký thất bại!");
        }
    }
}
