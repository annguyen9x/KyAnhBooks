package dao;

import java.util.Map;

import model.ChiTietHoaDon;

public interface ITFChiTietHoaDonDao {
	
	boolean insert(ChiTietHoaDon cthd);
	
	boolean update(ChiTietHoaDon cthd);
	
	boolean delete(int soHD, String maSach);
	
	Map<String, Object> xemThongTinDonHang(int soHD);
}
