package model;

import java.util.Date;

public class NhapSach {
	private String maNS;
	private int maNVKho;
	private String maSach;
	private int soLuongNhap;
	private Date ngayNhap;
	
	public NhapSach() {
	}
	
	public NhapSach(String maNS, int maNVKho, String maSach, int soLuongNhap, Date ngayNhap) {
		super();
		this.maNS = maNS;
		this.maNVKho = maNVKho;
		this.maSach = maSach;
		this.soLuongNhap = soLuongNhap;
		this.ngayNhap = ngayNhap;
	}

	public String getMaNS() {
		return maNS;
	}

	public void setMaNS(String maNS) {
		this.maNS = maNS;
	}

	public int getMaNVKho() {
		return maNVKho;
	}

	public void setMaNVKho(int maNVKho) {
		this.maNVKho = maNVKho;
	}

	public String getMaSach() {
		return maSach;
	}

	public void setMaSach(String maSach) {
		this.maSach = maSach;
	}

	public int getSoLuongNhap() {
		return soLuongNhap;
	}

	public void setSoLuongNhap(int soLuongNhap) {
		this.soLuongNhap = soLuongNhap;
	}

	public Date getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}
	
}
