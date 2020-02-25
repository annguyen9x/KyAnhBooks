package dao;

import java.sql.Date;
import java.util.List;

import model.KhachHang;

public interface ITFKhachHangDao {
	
	boolean insert(KhachHang kh);
	
	boolean update(KhachHang kh);
	
	boolean delete(KhachHang kh);
	
	KhachHang getKhachHang(String email);
	
	KhachHang getKhachHang(int maKH);
	
	List<KhachHang> getDSKhachHang();
	
	KhachHang dangNhap(String email, String matKhau);
	
	boolean kiemTraEmailTonTai(String email);
	
	boolean kiemTraDienThoaiTonTai(String dienThoai);
}
