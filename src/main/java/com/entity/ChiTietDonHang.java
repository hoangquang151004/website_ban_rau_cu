package com.entity;

import java.util.Arrays;

public class ChiTietDonHang {
    private int maDonHang;
    private String tenTaiKhoan;
    private String[] maSanPham;
    private String[] soLuong;
    private double tongTien;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(String tenTaiKhoan, String[] maSanPham, String[] soLuong, double tongTien) {
        this.tenTaiKhoan = tenTaiKhoan;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
    }

    public ChiTietDonHang(int maDonHang, String tenTaiKhoan, String[] maSanPham, String[] soLuong, double tongTien) {
        this.maDonHang = maDonHang;
        this.tenTaiKhoan = tenTaiKhoan;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
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

    public String[] getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String[] maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String[] getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(String[] soLuong) {
        this.soLuong = soLuong;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    @Override
    public String toString() {
        return "ChiTietDonHang{" +
                "maDonHang=" + maDonHang +
                ", tenTaiKhoan='" + tenTaiKhoan + '\'' +
                ", maSanPham=" + Arrays.toString(maSanPham) +
                ", soLuong=" + Arrays.toString(soLuong) +
                ", tongTien=" + tongTien +
                '}';
    }
}

