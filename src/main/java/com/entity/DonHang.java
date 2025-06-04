package com.entity;
import java.time.LocalDate;
import java.sql.Date;

public class DonHang {
    private int maDonHang;
    private String tenTaiKhoan;
    private Date ngayDat;
    private String soDienThoaiNhan;
    private String diaChiGiao;
    private String phuongThucTT;
    private String ghiChu;
    private String trangThai;
    private double tongTien;

    public DonHang() {
    }

    public DonHang(String tenTaiKhoan, Date ngayDat, String soDienThoaiNhan, String diaChiGiao, String phuongThucTT, String ghiChu, String trangThai, double tongTien) {
        this.tenTaiKhoan = tenTaiKhoan;
        this.ngayDat = ngayDat;
        this.soDienThoaiNhan = soDienThoaiNhan;
        this.diaChiGiao = diaChiGiao;
        this.phuongThucTT = phuongThucTT;
        this.ghiChu = ghiChu;
        this.trangThai = trangThai;
        this.tongTien = tongTien;
    }

    public DonHang(int maDonHang, String tenTaiKhoan, Date ngayDat, String soDienThoaiNhan, String diaChiGiao, String phuongThucTT, String ghiChu, String trangThai, double tongTien) {
        this.maDonHang = maDonHang;
        this.tenTaiKhoan = tenTaiKhoan;
        this.ngayDat = ngayDat;
        this.soDienThoaiNhan = soDienThoaiNhan;
        this.diaChiGiao = diaChiGiao;
        this.ghiChu = ghiChu;
        this.trangThai = trangThai;
        this.phuongThucTT = phuongThucTT;
        this.tongTien = tongTien;
    }

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getTenTaiKhoan() {
        return tenTaiKhoan;
    }

    public void setTenTaiKhoan(String tenTaiKhoan) {
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    public String getSoDienThoaiNhan() {
        return soDienThoaiNhan;
    }

    public void setSoDienThoaiNhan(String soDienThoaiNhan) {
        this.soDienThoaiNhan = soDienThoaiNhan;
    }

    public String getDiaChiGiao() {
        return diaChiGiao;
    }

    public void setDiaChiGiao(String diaChiGiao) {
        this.diaChiGiao = diaChiGiao;
    }

    public String getPhuongThucTT() {
        return phuongThucTT;
    }

    public void setPhuongThucTT(String phuongThucTT) {
        this.phuongThucTT = phuongThucTT;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    @Override
    public String toString() {
        return "DonHang{" +
                "maDonHang=" + maDonHang +
                ", tenTaiKhoan='" + tenTaiKhoan + '\'' +
                ", ngayDat=" + ngayDat +
                ", soDienThoaiNhan='" + soDienThoaiNhan + '\'' +
                ", diaChiGiao='" + diaChiGiao + '\'' +
                ", phuongThucTT='" + phuongThucTT + '\'' +
                ", ghiChu='" + ghiChu + '\'' +
                ", trangThai='" + trangThai + '\'' +
                ", tongTien=" + tongTien +
                '}';
    }
}

