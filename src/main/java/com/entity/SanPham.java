package com.entity;

public class SanPham {
    private int maSanPham;
    private String tenSanPham;
    private double giaSanPham;
    private String loaiSanPham;
    private String moTa;
    private String xuatXu;
    private int soLuong;
    private String anhSanPham;

    public SanPham() {
    }

    public SanPham(String tenSanPham, int soLuong,double giaSanPham) {
        this.tenSanPham = tenSanPham;
        this.soLuong = soLuong;
        this.giaSanPham = giaSanPham;
    }

    public SanPham(int maSanPham, String tenSanPham, double giaSanPham, String loaiSanPham, String moTa, String xuatXu, int soLuong, String anhSanPham) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.giaSanPham = giaSanPham;
        this.loaiSanPham = loaiSanPham;
        this.moTa = moTa;
        this.xuatXu = xuatXu;
        this.soLuong = soLuong;
        this.anhSanPham = anhSanPham;
    }


    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public double getGiaSanPham() {
        return giaSanPham;
    }

    public void setGiaSanPham(double giaSanPham) {
        this.giaSanPham = giaSanPham;
    }

    public String getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(String loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getXuatXu() {
        return xuatXu;
    }

    public void setXuatXu(String xuatXu) {
        this.xuatXu = xuatXu;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getAnhSanPham() {
        return anhSanPham;
    }

    public void setAnhSanPham(String anhSanPham) {
        this.anhSanPham = anhSanPham;
    }
}
