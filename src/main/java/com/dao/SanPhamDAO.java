package com.dao;
import com.database.DBcontext;
import com.entity.SanPham;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SanPhamDAO {
    public List<SanPham> getByPage( int start, int end) {
        List<SanPham> list = new ArrayList<SanPham>();
        String sql = "SELECT * FROM sanpham LIMIT ?, ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new SanPham(
                        rs.getInt("maSanPham"),
                        rs.getString("tenSanPham"),
                        rs.getDouble("giaSanPham"),
                        rs.getString("loaiSanPham"),
                        rs.getString("moTa"),
                        rs.getString("xuatXu"),
                        rs.getInt("soLuong"),
                        rs.getString("anhSanPham")));
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getCount() {
        String sql = "SELECT count(*) FROM sanpham";
        int count = 0;
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<SanPham> find(String tenSanPham, String loaiSanPham, int start, int end) {
        List<SanPham> list = new ArrayList<SanPham>();
        String sql = "SELECT * FROM sanpham WHERE tenSanPham LIKE ? OR loaiSanPham LIKE ? LIMIT ?, ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + tenSanPham + "%");
            ps.setString(2, "%" + loaiSanPham + "%");
            ps.setInt(3, start);
            ps.setInt(4, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new SanPham(
                        rs.getInt("maSanPham"),
                        rs.getString("tenSanPham"),
                        rs.getDouble("giaSanPham"),
                        rs.getString("loaiSanPham"),
                        rs.getString("moTa"),
                        rs.getString("xuatXu"),
                        rs.getInt("soLuong"),
                        rs.getString("anhSanPham")));
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getCountFind(String tenSanPham, String loaiSanPham) {
        String sql = "SELECT count(*) FROM sanpham WHERE tenSanPham LIKE ? OR loaiSanPham LIKE ?";
        int count = 0;
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + tenSanPham + "%");
            ps.setString(2, "%" + loaiSanPham + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


    public int getCountFillter(String keyword) {
        String sql = "SELECT count(*) FROM sanpham WHERE loaiSanPham LIKE ?";
        int count = 0;
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public List<SanPham> fillter(String keyword, int start, int end) {
        List<SanPham> list = new ArrayList<SanPham>();
        String sql = "SELECT * FROM sanpham  WHERE loaiSanPham LIKE ? LIMIT ?, ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, start);
            ps.setInt(3, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new SanPham(
                        rs.getInt("maSanPham"),
                        rs.getString("tenSanPham"),
                        rs.getDouble("giaSanPham"),
                        rs.getString("loaiSanPham"),
                        rs.getString("moTa"),
                        rs.getString("xuatXu"),
                        rs.getInt("soLuong"),
                        rs.getString("anhSanPham")));
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public SanPham getById(int maSanPham) {
        String sql = "SELECT * FROM sanpham WHERE maSanPham = ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1,maSanPham);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new SanPham(
                        rs.getInt("maSanPham"),
                        rs.getString("tenSanPham"),
                        rs.getDouble("giaSanPham"),
                        rs.getString("loaiSanPham"),
                        rs.getString("moTa"),
                        rs.getString("xuatXu"),
                        rs.getInt("soLuong"),
                        rs.getString("anhSanPham"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean insertProduct(SanPham sanPham) {
        String sql = "INSERT INTO sanpham (tenSanPham, giaSanPham, loaiSanPham, moTa, xuatXu, soLuong, anhSanPham) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1,sanPham.getTenSanPham());
            stmt.setDouble(2, sanPham.getGiaSanPham());
            stmt.setString(3, sanPham.getLoaiSanPham());
            stmt.setString(4,sanPham.getMoTa());
            stmt.setString(5,sanPham.getXuatXu());
            stmt.setInt(6,sanPham.getSoLuong());
            stmt.setString(7, sanPham.getAnhSanPham());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(int maSanPham,SanPham sanPham) {
        String sql = "UPDATE sanpham SET tenSanPham = ?,giaSanPham = ?, loaiSanPham =?, moTa=?, xuatXu =?, soLuong =?, anhSanPham =? WHERE maSanPham = ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1,sanPham.getTenSanPham());
            stmt.setDouble(2, sanPham.getGiaSanPham());
            stmt.setString(3, sanPham.getLoaiSanPham());
            stmt.setString(4,sanPham.getMoTa());
            stmt.setString(5, sanPham.getXuatXu());
            stmt.setInt(6, sanPham.getSoLuong());
            stmt.setString(7, sanPham.getAnhSanPham());
            stmt.setInt(8, maSanPham);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(int maSanPham) {
        String sql = "DELETE sanpham WHERE maSanPham = ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, maSanPham);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    }

