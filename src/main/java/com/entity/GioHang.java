package com.entity;

public class GioHang {
    private SanPham sanPham;
    private int soLuong;

    public GioHang(SanPham sanPham, int soLuong) {
        this.sanPham = sanPham;
        this.soLuong = soLuong;
    }

    public SanPham getSanPham() { return sanPham; }
    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }
    public double getTongTien() {
        return sanPham.getGiaSanPham() * soLuong;
    }
}
