package model;

import java.util.Date;

public class NhanVien {
	private int maNV;
	private String tenNV;
	private String chucVu;
	private String matKhau;
	private String email;
	private String dienThoai;
	private String gioiTinh;
	private Date ngaySinh;
	private String diaChi;
	
	public NhanVien() {
		
	}

	public NhanVien(String tenNV, String chucVu, String matKhau, String email, String dienThoai,
			String gioiTinh, Date ngaySinh, String diaChi) {
		super();
		this.tenNV = tenNV;
		this.chucVu = chucVu;
		this.matKhau = matKhau;
		this.email = email;
		this.dienThoai = dienThoai;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
	}
	
	public NhanVien(int maNV, String tenNV, String chucVu, String matKhau, String email, String dienThoai,
			String gioiTinh, Date ngaySinh, String diaChi) {
		super();
		this.maNV = maNV;
		this.tenNV = tenNV;
		this.chucVu = chucVu;
		this.matKhau = matKhau;
		this.email = email;
		this.dienThoai = dienThoai;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
	}

	public int getMaNV() {
		return maNV;
	}

	public void setMaNV(int maNV) {
		this.maNV = maNV;
	}

	public String getTenNV() {
		return tenNV;
	}

	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}

	public String getChucVu() {
		return chucVu;
	}

	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
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
