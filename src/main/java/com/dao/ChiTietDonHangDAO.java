package com.dao;

import com.database.DBcontext;
import com.entity.ChiTietDonHang;
import com.entity.DonHang;
import com.entity.SanPham;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ChiTietDonHangDAO {
    public void insertChiTiet(ChiTietDonHang ct) {
        for(int i = 0; i < ct.getMaSanPham().length; i++) {
            String sql = "INSERT INTO chitietdonhang (maDonHang, tenTaiKhoan, maSanPham, soLuong) VALUES (?, ?, ?, ?)";
            try (Connection conn = new DBcontext().getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, ct.getMaDonHang());
                ps.setString(2, ct.getTenTaiKhoan());
                ps.setInt(3, Integer.valueOf(ct.getMaSanPham()[i]));
                ps.setInt(4,Integer.valueOf(ct.getSoLuong()[i]));
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            sql = "UPDATE sanpham set soluong = soluong - ? where maSanPham = ?";
            try (Connection conn = new DBcontext().getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(2, Integer.valueOf(ct.getMaSanPham()[i]));
                ps.setInt(1,Integer.valueOf(ct.getSoLuong()[i]));
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public List<SanPham> getChiTietDonHang(int maDonHang) {
        List<SanPham> list = new ArrayList<SanPham>();
        String sql = "SELECT ct.*,sp.tenSanPham,sp.giaSanPham FROM chitietdonhang ct INNER JOIN sanpham sp ON ct.maSanPham = sp.maSanPham WHERE ct.maDonHang = ?";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maDonHang);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SanPham(rs.getString("tenSanPham"),
                        rs.getInt("soLuong"),
                        rs.getDouble("giaSanPham")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void delete(int maDonHang) {
        String query = "DELETE FROM chitietdonhang WHERE maDonHang = ?";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maDonHang);
            ps.executeUpdate();
            System.out.println("Xoa thanh cong ct");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
