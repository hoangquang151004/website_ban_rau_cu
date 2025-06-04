package com.dao;

import com.database.DBcontext;
import com.entity.TaiKhoan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TaiKhoanDAO {

    public List<TaiKhoan> getByTPage(int start, int end) {
        List<TaiKhoan> list = new ArrayList<TaiKhoan>();
        String query = "SELECT * FROM TAIKHOAN LIMIT ?,?";
        try (
                Connection conn = new DBcontext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TaiKhoan(
                        rs.getString("tenTaiKhoan"),
                        rs.getString("matKhau"),
                        rs.getString("quyen"),
                        rs.getString("hoTen"),
                        rs.getDate("ngaySinh"),
                        rs.getString("diaChi"),
                        rs.getString("SDT"),
                        rs.getString("email")));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int getTotal(){
        String query = "SELECT COUNT(*) FROM TAIKHOAN";
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


    public TaiKhoan findByID(String maTaiKhoan) {
        TaiKhoan tk = new TaiKhoan();
        String sql = "select * from taikhoan where tenTaiKhoan = ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, maTaiKhoan);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tk.setTenTaiKhoan(rs.getString("tenTaiKhoan"));
                tk.setMatKhau(rs.getString("matKhau"));
                tk.setQuyen(rs.getString("quyen"));
                tk.setHoTen(rs.getString("hoTen"));
                tk.setNgaySinh(rs.getDate("ngaySinh"));
                tk.setDiaChi(rs.getString("diaChi"));
                tk.setSDT(rs.getString("SDT"));
                tk.setEmail(rs.getString("email"));
            }
            return tk;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public List<TaiKhoan> find(String keyword) {
        List<TaiKhoan> list = new ArrayList<TaiKhoan>();
        String sql = "SELECT * FROM taikhoan WHERE tenTaiKhoan LIKE ? OR email LIKE ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TaiKhoan(
                        rs.getString("tenTaiKhoan"),
                        rs.getString("matKhau"),
                        rs.getString("quyen"),
                        rs.getString("hoTen"),
                        rs.getDate("ngaySinh"),
                        rs.getString("diaChi"),
                        rs.getString("SDT"),
                        rs.getString("email")));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void insert(TaiKhoan t) {

    }

    public void update(String tenTaiKhoan, TaiKhoan t) {
        String sql = "UPDATE taikhoan SET matKhau = ?, quyen = ?, hoTen = ?, ngaySinh = ?, diaChi = ?, SDT = ?, email = ? WHERE tenTaiKhoan = ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setString(1, t.getMatKhau());
            ps.setString(2, t.getQuyen());
            ps.setString(3, t.getHoTen());
            ps.setDate(4, t.getNgaySinh()); // Nếu là java.sql.Date
            ps.setString(5, t.getDiaChi());
            ps.setString(6, t.getSDT());
            ps.setString(7, t.getEmail());
            ps.setString(8, tenTaiKhoan);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Sua Thanh thanh cong");
    }


    public void delete(String tenTaiKhoan) {
        String sql = "delete from taikhoan where tenTaiKhoan = ?";
        try (Connection conn = new DBcontext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tenTaiKhoan);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
