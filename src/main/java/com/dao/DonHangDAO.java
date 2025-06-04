package com.dao;

import com.database.DBcontext;
import com.entity.DonHang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DonHangDAO {
    public void insertDonHang(DonHang dh) {
        String query = "INSERT INTO donhang (tenTaiKhoan, ngayDat, soDienThoaiNhan, diaChiGiao, ghiChu, phuongThucTT, tongTien) " +
                "VALUES ( ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, dh.getTenTaiKhoan());
            ps.setDate(2, dh.getNgayDat()); // nếu dùng java.time.LocalDate
            ps.setString(3, dh.getSoDienThoaiNhan());
            ps.setString(4, dh.getDiaChiGiao());
            ps.setString(5, dh.getGhiChu());
            ps.setString(6, dh.getPhuongThucTT());
            ps.setDouble(7, dh.getTongTien());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int layMaDonHang() {
        int maDonHang = -1;
        String query = "SELECT maDonHang FROM donHang ORDER BY maDonHang DESC LIMIT 1;";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                maDonHang = rs.getInt("maDonHang");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return maDonHang;
    }

    public List<DonHang> getByTPage(int start, int end) {
        List<DonHang> list = new ArrayList<DonHang>();
        String query = "SELECT * FROM donHang LIMIT ?,?";
        try (
                Connection conn = new DBcontext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DonHang(
                        rs.getInt("maDonHang"),
                        rs.getString("tenTaiKhoan"),
                        rs.getDate("ngayDat"),
                        rs.getString("soDienThoaiNhan"),
                        rs.getString("diaChiGiao"),
                        rs.getString("phuongthucTT"),
                        rs.getString("ghiChu"),
                        rs.getString("trangThai"),
                        rs.getDouble("tongTien")
                ));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int getTotal(){
        String query = "SELECT COUNT(*) FROM donHang";
        try(Connection conn = new DBcontext().getConnection();PreparedStatement ps = conn.prepareStatement(query)){
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    public List<DonHang> getByTPageFind(String keyword,int start, int end) {
        List<DonHang> list = new ArrayList<DonHang>();
        String query = "SELECT * FROM donHang WHERE tenTaiKhoan LIKE ? or soDienThoaiNhan LIKE ? or diaChiGiao LIKE ? LIMIT ?,?";
        try (
                Connection conn = new DBcontext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setString(1,"%"+ keyword +"%");
            ps.setString(2,"%"+ keyword +"%");
            ps.setString(3,"%"+ keyword +"%");
            ps.setInt(4, start);
            ps.setInt(5, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DonHang(
                        rs.getInt("maDonHang"),
                        rs.getString("tenTaiKhoan"),
                        rs.getDate("ngayDat"),
                        rs.getString("soDienThoaiNhan"),
                        rs.getString("diaChiGiao"),
                        rs.getString("phuongthucTT"),
                        rs.getString("ghiChu"),
                        rs.getString("trangThai"),
                        rs.getDouble("tongTien")
                ));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int getTotalFind(String keyword){
        String query = "SELECT COUNT(*) FROM donHang where tenTaiKhoan LIKE ? or soDienThoaiNhan LIKE ? or diaChiGiao LIKE ?";
        try(Connection conn = new DBcontext().getConnection();PreparedStatement ps = conn.prepareStatement(query)){
            ps.setString(1,"%"+ keyword +"%");
            ps.setString(2,"%"+ keyword +"%");
            ps.setString(3,"%"+ keyword +"%");
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    public DonHang getById(int maDonHang) {
        String query = "SELECT * FROM donHang WHERE maDonHang = ?";
        try (
                Connection conn = new DBcontext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setInt(1, maDonHang);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DonHang dh = new DonHang(
                        rs.getInt("maDonHang"),
                        rs.getString("tenTaiKhoan"),
                        rs.getDate("ngayDat"),
                        rs.getString("soDienThoaiNhan"),
                        rs.getString("diaChiGiao"),
                        rs.getString("phuongthucTT"),
                        rs.getString("ghiChu"),
                        rs.getString("trangThai"),
                        rs.getDouble("tongTien")
                );
                return dh;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void update(int maDonHang,DonHang dh) {
        String query = "UPDATE donHang SET tenTaiKhoan = ?, ngayDat = ?, soDienThoaiNhan = ?, diaChiGiao = ?, ghiChu = ?, phuongThucTT = ?, tongTien = ?, trangThai = ? " +
                "WHERE maDonHang = ?";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, dh.getTenTaiKhoan());
            ps.setDate(2, dh.getNgayDat());
            ps.setString(3, dh.getSoDienThoaiNhan());
            ps.setString(4, dh.getDiaChiGiao());
            ps.setString(5, dh.getGhiChu());
            ps.setString(6, dh.getPhuongThucTT());
            ps.setDouble(7, dh.getTongTien());
            ps.setString(8, dh.getTrangThai());
            ps.setDouble(9, maDonHang);
            ps.executeUpdate();
            System.out.println("Cap nhat thanh cong");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void delete(int maDonHang) {
        String query = "DELETE FROM donHang WHERE maDonHang = ?";
        try (Connection conn = new DBcontext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maDonHang);
            ps.executeUpdate();
            System.out.println("Xoa thanh cong");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

// lich su don hang
    public int getTotalUser(String maTaiKhoan) {
        String query = "SELECT COUNT(*) FROM donHang WHERE tenTaiKhoan = ?";
        try(Connection conn = new DBcontext().getConnection();PreparedStatement ps = conn.prepareStatement(query)){
            ps.setString(1,maTaiKhoan);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<DonHang> getByTPageUser(String maTaiKhoan,int start, int end) {
        List<DonHang> list = new ArrayList<DonHang>();
        String query = "SELECT * FROM donHang WHERE tenTaiKhoan = ? LIMIT ?,?";
        try (
                Connection conn = new DBcontext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setString(1,maTaiKhoan);
            ps.setInt(2, start);
            ps.setInt(3, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DonHang(
                        rs.getInt("maDonHang"),
                        rs.getString("tenTaiKhoan"),
                        rs.getDate("ngayDat"),
                        rs.getString("soDienThoaiNhan"),
                        rs.getString("diaChiGiao"),
                        rs.getString("phuongthucTT"),
                        rs.getString("ghiChu"),
                        rs.getString("trangThai"),
                        rs.getDouble("tongTien")
                ));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



}

