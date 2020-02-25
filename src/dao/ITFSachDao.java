package dao;

import java.util.List;
import java.util.Map;

import model.Sach;

public interface ITFSachDao {
	
	boolean insert(Sach sach);
	
	boolean update(Sach sach);
	
	boolean updateSoLuong(int soLuong, String maSach);
	
	boolean delete(String maSach);
	
	boolean kiemTraSachTheoMaSach(String maSach);
	
	Sach getSachTheoMaSach(String maSach);
	
	List<Sach> dsSach();
	
	List<Sach> dsSachNoiBat(int soLuong);
	
	List<Sach> dsSachMoi(int soLuong);
	
	List<Sach> dsSachTheoLoaiSach(String maLoaiSach);
	
	List<Sach> dsTenSachTheoLoaiSach(String maLoaiSach);
	
	List<Sach> dsSachTheoTenSach(String tenSach);
	
	Map<Integer, List<Sach>> hienThiSachTheoLoaiSach(String maLoaiSach);
	
	List<Sach> timKiemSach(String tenSach);
	
}
