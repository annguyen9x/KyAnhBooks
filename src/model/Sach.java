package model;

import java.sql.Date;

public class Sach {
	private String maSach;
	private String tenSach;
	private float donGia;
	private int soLuong;
	private String urlHinh;
	private String noiDung;
	private String tacGia;
	private int namXB;
	private String nXB;
	private String maLoaiSach;
	
	public Sach() {
		
	}
	
	public Sach(String maSach, String tenSach, float donGia, String urlHinh,
			String noiDung, String tacGia, int namXB, String nXB, String maLoaiSach) {
		super();
		this.maSach = maSach;
		this.tenSach = tenSach;
		this.donGia = donGia;
		this.urlHinh = urlHinh;
		this.noiDung = noiDung;
		this.tacGia = tacGia;
		this.namXB = namXB;
		this.nXB = nXB;
		this.maLoaiSach = maLoaiSach;
	}
	
	public Sach(String maSach, String tenSach, float donGia, int soLuong, String urlHinh,
			String noiDung, String tacGia, int namXB, String nXB, String maLoaiSach) {
		super();
		this.maSach = maSach;
		this.tenSach = tenSach;
		this.donGia = donGia;
		this.soLuong = soLuong;
		this.urlHinh = urlHinh;
		this.noiDung = noiDung;
		this.tacGia = tacGia;
		this.namXB = namXB;
		this.nXB = nXB;
		this.maLoaiSach = maLoaiSach;
	}

	public String getMaSach() {
		return maSach;
	}

	public void setMaSach(String maSach) {
		this.maSach = maSach;
	}

	public String getTenSach() {
		return tenSach;
	}

	public void setTenSach(String tenSach) {
		this.tenSach = tenSach;
	}

	public float getDonGia() {
		return donGia;
	}

	public void setDonGia(float donGia) {
		this.donGia = donGia;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getUrlHinh() {
		return urlHinh;
	}

	public void setUrlHinh(String urlHinh) {
		this.urlHinh = urlHinh;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public String getTacGia() {
		return tacGia;
	}

	public void setTacGia(String tacGia) {
		this.tacGia = tacGia;
	}

	public int getNamXB() {
		return namXB;
	}

	public void setNamXB(int namXB) {
		this.namXB = namXB;
	}

	public String getnXB() {
		return nXB;
	}

	public void setnXB(String nXB) {
		this.nXB = nXB;
	}

	public String getMaLoaiSach() {
		return maLoaiSach;
	}

	public void setMaLoaiSach(String maLoaiSach) {
		this.maLoaiSach = maLoaiSach;
	}
	
}
