package dao;

import java.util.Map;

import model.HoaDon;
import model.NguoiNhanHang;

public interface ITFNguoiNhanHangDao {
	int insert(NguoiNhanHang nnh);
	
	boolean update(NguoiNhanHang nnh);
	
	boolean delete(int soHD);
	
	NguoiNhanHang getNguoiNhanHang(int soHD);
}
