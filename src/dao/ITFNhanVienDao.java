package dao;

import java.util.List;

import model.NhanVien;;

public interface ITFNhanVienDao {
	
	boolean insert(NhanVien nv);
	
	boolean update(NhanVien nv);
	
	boolean updatePassWord(int maNV,String matKhau);
	
	boolean delete(int maNV);
	
	NhanVien getNhanVien(String email);
	
	NhanVien getNhanVien(int maNV);
	
	List<NhanVien> getDSNhanVien();
	
	List<NhanVien> getDSNhanVienTheoChuVu(String chucVu);
	
	NhanVien dangNhap(String email, String matKhau);
	
	boolean kiemTraEmailTonTai(String email);
	
	boolean kiemTraDienThoaiTonTai(String dienThoai);
}
