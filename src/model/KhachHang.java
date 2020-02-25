package model;

import java.util.Date;

public class KhachHang {
	private int maKH;
	private String tenKH;
	private String matKhau;
	private String email;
	private String dienThoai;
	private String gioiTinh;
	private Date ngaySinh;
	private String diaChi;
	
	public KhachHang() {
		
	}
	
	public KhachHang(String tenKH, String matKhau, String email, String dienThoai, String gioiTinh,
			Date ngaySinh, String diaChi) {
		super();
		this.tenKH = tenKH;
		this.matKhau = matKhau;
		this.email = email;
		this.dienThoai = dienThoai;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
	}
	
	public KhachHang(int maKH, String tenKH, String matKhau, String email, String dienThoai, String gioiTinh,
			Date ngaySinh, String diaChi) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.matKhau = matKhau;
		this.email = email;
		this.dienThoai = dienThoai;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
	}
	
	public int getMaKH() {
		return maKH;
	}
	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDienThoai() {
		return dienThoai;
	}
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	
}
