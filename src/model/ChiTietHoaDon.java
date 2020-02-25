package model;

public class ChiTietHoaDon {
	private int soHD;
	private String maSach;
	private int soLuong;
	private float donGia;
	
	public ChiTietHoaDon() {
		
	}
	
	public ChiTietHoaDon(int soHD, String maSach, int soLuong, float donGia) {
		super();
		this.soHD = soHD;
		this.maSach = maSach;
		this.soLuong = soLuong;
		this.donGia = donGia;
	}
	
	public int getSoHD() {
		return soHD;
	}
	public void setSoHD(int soHD) {
		this.soHD = soHD;
	}
	public String getMaSach() {
		return maSach;
	}
	public void setMaSach(String maSach) {
		this.maSach = maSach;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getDonGia() {
		return donGia;
	}
	public void setDonGia(float donGia) {
		this.donGia = donGia;
	}
}
