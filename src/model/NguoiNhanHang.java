package model;

public class NguoiNhanHang {
	private int soHD;
	private String tenNN;
	private String dienThoai;
	private String diaChi;
	
	public NguoiNhanHang() {
	}
	
	public NguoiNhanHang(int soHD, String tenNN, String dienThoai, String diaChi) {
		super();
		this.soHD = soHD;
		this.tenNN = tenNN;
		this.dienThoai = dienThoai;
		this.diaChi = diaChi;
	}

	public String getTenNN() {
		return tenNN;
	}

	public void setTenNN(String tenNN) {
		this.tenNN = tenNN;
	}

	public int getSoHD() {
		return soHD;
	}

	public void setSoHD(int soHD) {
		this.soHD = soHD;
	}

	public String getDienThoai() {
		return dienThoai;
	}

	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	
}
