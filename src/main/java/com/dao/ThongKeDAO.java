package com.dao;

import com.database.DBcontext;
import com.entity.SanPham;
import com.entity.TaiKhoan;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ThongKeDAO {
    public int tongDonHang(Date tu, Date den) {
        String query = "SELECT count(*) FROM donhang WHERE ngaydat between ? and ? ";
        try(Connection connection = new DBcontext().getConnection(); PreparedStatement ps= connection.prepareStatement(query);){
            ps.setDate(1,tu);
            ps.setDate(2,den);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int tongDanhThu(Date tu, Date den){
        String query = "SELECT sum(tongTien) FROM donhang WHERE ngaydat between ? and ? ";
        try(Connection connection = new DBcontext().getConnection(); PreparedStatement ps= connection.prepareStatement(query);){
            ps.setDate(1,tu);
            ps.setDate(2,den);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<SanPham> getSanPham(Date tu, Date den) {
        String sql = "SELECT ct.maSanPham, COUNT(ct.soLuong) AS sl, sp.tenSanPham\n" +
                "FROM chitietdonhang ct\n" +
                "INNER JOIN donhang dh ON ct.maDonHang = dh.maDonHang\n" +
                "INNER JOIN sanpham sp ON sp.maSanPham = ct.maSanPham\n" +
                "WHERE dh.ngayDat BETWEEN ? AND ?\n" +
                "GROUP BY ct.maSanPham, sp.tenSanPham\n" +
                "ORDER BY sl";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(tu.getTime()));
            ps.setDate(2, new java.sql.Date(den.getTime()));

            ResultSet rs = ps.executeQuery();
            List<SanPham> sanPhamList = new ArrayList<>();
            while (rs.next()) {
                SanPham sanPham = new SanPham();
                sanPham.setTenSanPham(rs.getString("tenSanPham"));
                sanPham.setSoLuong(rs.getInt("sl"));
                sanPhamList.add(sanPham);
            }
            return sanPhamList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<String> getTaiKhoan(Date tu, Date den){
        String sql ="SELECT tenTaiKhoan, COUNT(*) AS soluong\n" +
                "FROM donhang\n" +
                "WHERE ngayDat BETWEEN ? AND ? \n" +
                "GROUP BY tenTaiKhoan\n" +
                "ORDER BY soluong DESC;\n";
        List<String> list = new ArrayList<String>();
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1,tu);
            ps.setDate(2,den);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("tenTaiKhoan"));
                list.add(rs.getInt("soLuong")+"");
                return list;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
